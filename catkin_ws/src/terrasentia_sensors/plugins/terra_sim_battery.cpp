// <plugin name="battery" filename="libbattery_discharge.so">
//      <ros_node>battery_monitor_client</ros_node>
//      <link_name>body</link_name>
//      <battery_name>linear_battery</battery_name>
//      <constant_coef>12.694</constant_coef>
//      <linear_coef>-100.1424</linear_coef>
//      <initial_charge>1.1665</initial_charge>
//      <capacity>1.2009</capacity>
//      <resistance>0.061523</resistance>
//      <smooth_current_tau>1.9499</smooth_current_tau>
//      <charge_rate>0.2</charge_rate>
// </plugin>
// <plugin name="consumer" filename="libbattery_consumer.so">
//      <link_name>body</link_name>
//      <battery_name>linear_battery</battery_name>
//      <power_load>6.6</power_load>
// </plugin>

#include "../include/misc/terra_sim_battery.h"

#include <ros/ros.h>
#include <sdf/sdf.hh>

#include <boost/bind.hpp>
#include <boost/thread/mutex.hpp>

#include "gazebo/physics/physics.hh"
#include "gazebo/common/Time.hh"
#include "gazebo/common/Plugin.hh"
#include "gazebo/common/Battery.hh"


#include <algorithm>
#include <assert.h>

#include <geometry_msgs/Twist.h>

namespace gazebo {

BatteryPlugin::BatteryPlugin(){}

// Destructor
BatteryPlugin::~BatteryPlugin() {
     alive_ = false;
     queue_.clear();
     queue_.disable();
     _nh->shutdown();
     callback_queue_thread_.join();
     delete _nh;
}

// Load the controller
void BatteryPlugin::Load(physics::ModelPtr _parent, sdf::ElementPtr _sdf) {

     this->parent = _parent;
     this->world = _parent->GetWorld();

     // Define default variables if not defined by user
     this->robot_namespace_ = "";
     this->command_topic_ = "cmd_vel";
     this->battery_topic_ = "terra/battery";
     this->robot_base_frame_ = "base_footprint";
     this->battery_link_ = "main_battery";
     this->battery_name_ = "MainBattery";

     this->update_rate_ = 10.0;
     this->_vmax = 12.0;
     this->_vmin = 10.0;
     this->_v0 = _vmax;
     this->dBattery = 0.0002;

     // Voltages
     this->e0 = 12.694;
     this->e1 = -100.1424;

     // Charges
     this->q0 = 5.2;     // Initial battery charge in Ah
     this->qt = 0.2;     // Charge rate in A

     // Current voltage and charge
     this->et = 0;
     this->q = 0;      // Instantaneous battery charge in Ah

     // Battery parameters
     this->c = 5.2;      // Battery capacity in Ah
     this->r = 0.061523;      // Battery inner resistance in Ohm
     this->tau = 1.9499;    // Current low-pass filter characteristic time in seconds
     this->iraw = 0;   // Raw battery current in A
     this->ismooth = 0;// Smoothed battery current in A

     if (!_sdf->HasElement("robotNamespace")) {
          ROS_INFO_NAMED("TerraBattery", "BatteryPlugin Plugin missing <robotNamespace>, defaults to \"%s\"",
          this->robot_namespace_.c_str());
     } else this->robot_namespace_ = _sdf->GetElement("robotNamespace")->Get<std::string>() + "/";

     if (!_sdf->HasElement("robotBaseFrame")) {
          ROS_WARN_NAMED("TerraBattery", "BatteryPlugin Plugin (ns = %s) missing <robotBaseFrame>, defaults to \"%s\"",
          this->robot_namespace_.c_str(), this->robot_base_frame_.c_str());
     } else this->robot_base_frame_ = _sdf->GetElement("robotBaseFrame")->Get<std::string>();

     if (!_sdf->HasElement("batteryName")) {
          ROS_WARN_NAMED("TerraBattery", "BatteryPlugin Plugin (ns = %s) missing <batteryName>, defaults to value from robot_description: %f",
          this->robot_namespace_.c_str(), this->battery_name_);
     } else this->battery_name_ = _sdf->GetElement("batteryName")->Get<std::string>();

     if (!_sdf->HasElement("batteryLink")) {
          ROS_WARN_NAMED("TerraBattery", "BatteryPlugin Plugin (ns = %s) missing <batteryLink>, defaults to \"%s\"",
          this->robot_namespace_.c_str(), this->battery_link_.c_str());
     } else this->battery_link_ = _sdf->GetElement("batteryLink")->Get<std::string>();

     if (!_sdf->HasElement("commandTopic")) {
          ROS_WARN_NAMED("TerraBattery", "BatteryPlugin Plugin (ns = %s) missing <commandTopic>, defaults to \"%s\"",
          this->robot_namespace_.c_str(), this->command_topic_.c_str());
     } else this->command_topic_ = _sdf->GetElement("commandTopic")->Get<std::string>();

     if (!_sdf->HasElement("batteryTopic")) {
          ROS_WARN_NAMED("TerraBattery", "BatteryPlugin Plugin (ns = %s) missing <batteryTopic>, defaults to \"%s\"",
          this->robot_namespace_.c_str(), this->battery_topic_.c_str());
     } else this->battery_topic_ = _sdf->GetElement("batteryTopic")->Get<std::string>();

     if (!_sdf->HasElement("updateRate")) {
          ROS_WARN_NAMED("TerraBattery", "BatteryPlugin Plugin (ns = %s) missing <updateRate>, defaults to %f",
          this->robot_namespace_.c_str(), this->update_rate_);
     } else this->update_rate_ = _sdf->GetElement("updateRate")->Get<double>();

     /** ============== Sensor Specific Parameters =======================
     *                       SDF Definable
     * ============== END Sensor Specific Parameters ======================= */

     if (!_sdf->HasElement("constantCoef")) {
          ROS_WARN_NAMED("TerraBattery", "BatteryPlugin Plugin (ns = %s) missing <constantCoef>, defaults to %f",
          this->robot_namespace_.c_str(), this->e0);
     } else this->e0 = _sdf->GetElement("constantCoef")->Get<double>();

     if (!_sdf->HasElement("linearCoef")) {
          ROS_WARN_NAMED("TerraBattery", "BatteryPlugin Plugin (ns = %s) missing <linearCoef>, defaults to %f",
          this->robot_namespace_.c_str(), this->e1);
     } else this->e1 = _sdf->GetElement("linearCoef")->Get<double>();

     if (!_sdf->HasElement("initialCharge")) {
          ROS_WARN_NAMED("TerraBattery", "BatteryPlugin Plugin (ns = %s) missing <initialCharge>, defaults to %f",
          this->robot_namespace_.c_str(), this->q0);
     } else this->q0 = _sdf->GetElement("initialCharge")->Get<double>();

     if (!_sdf->HasElement("chargeRate")) {
          ROS_WARN_NAMED("TerraBattery", "BatteryPlugin Plugin (ns = %s) missing <chargeRate>, defaults to %f",
          this->robot_namespace_.c_str(), this->qt);
     } else this->qt = _sdf->GetElement("chargeRate")->Get<double>();

     if (!_sdf->HasElement("capacity")) {
          ROS_WARN_NAMED("TerraBattery", "BatteryPlugin Plugin (ns = %s) missing <capacity>, defaults to %f",
          this->robot_namespace_.c_str(), this->c);
     } else this->c = _sdf->GetElement("capacity")->Get<double>();

     if (!_sdf->HasElement("internalResistance")) {
          ROS_WARN_NAMED("TerraBattery", "BatteryPlugin Plugin (ns = %s) missing <internalResistance>, defaults to %f",
          this->robot_namespace_.c_str(), this->r);
     } else this->r = _sdf->GetElement("internalResistance")->Get<double>();

     if (!_sdf->HasElement("smoothCurrentTau")) {
          ROS_WARN_NAMED("TerraBattery", "BatteryPlugin Plugin (ns = %s) missing <smoothCurrentTau>, defaults to %f",
          this->robot_namespace_.c_str(), this->tau);
     } else this->tau = _sdf->GetElement("smoothCurrentTau")->Get<double>();

     if (!_sdf->HasElement("vMax")) {
          ROS_WARN_NAMED("TerraBattery", "BatteryPlugin Plugin (ns = %s) missing <vMax>, defaults to %f",
          this->robot_namespace_.c_str(), this->_vmax);
     } else this->_vmax = _sdf->GetElement("vMax")->Get<double>();

     if (!_sdf->HasElement("vMin")) {
          ROS_WARN_NAMED("TerraBattery", "BatteryPlugin Plugin (ns = %s) missing <vMin>, defaults to %f",
          this->robot_namespace_.c_str(), this->_vmin);
     } else this->_vmin = _sdf->GetElement("vMin")->Get<double>();

     if (!_sdf->HasElement("vInitial")) {
          ROS_WARN_NAMED("TerraBattery", "BatteryPlugin Plugin (ns = %s) missing <vInitial>, defaults to %f",
          this->robot_namespace_.c_str(), this->_v0);
     } else this->_v0 = _sdf->GetElement("vInitial")->Get<double>();

     if (!_sdf->HasElement("deltaVoltage")) {
          ROS_WARN_NAMED("TerraBattery", "BatteryPlugin Plugin (ns = %s) missing <deltaVoltage>, defaults to %f",
          this->robot_namespace_.c_str(), this->dBattery);
     } else this->dBattery = _sdf->GetElement("deltaVoltage")->Get<double>();


     // Initialize update rate stuff
     if(this->update_rate_ > 0.0) this->update_period_ = 1.0 / this->update_rate_;
     else this->update_period_ = 0.0;

     last_update_time_ = cur_time_ = this->world->SimTime();

     // Make sure the ROS node for Gazebo has already been initialized
     if (!ros::isInitialized()){
          ROS_FATAL_STREAM_NAMED("TerraBattery", "A ROS node for Gazebo has not been initialized, unable to load plugin. "
          << "Load the Gazebo system plugin 'libgazebo_ros_api_plugin.so' in the gazebo_ros package)");
          return;
     }

     /** =====================================
     *     Begin Node after settings have
     * been set by default, if not user.
     ===================================== */

     ROS_INFO_NAMED("TerraBattery", "Starting BatteryPlugin Plugin (ns = %s)", this->robot_namespace_.c_str());

     _nh = new ros::NodeHandle(this->robot_namespace_);

     // ROS: Subscribe to the velocity command topic (usually "cmd_vel")
     ros::SubscribeOptions so = ros::SubscribeOptions::create<geometry_msgs::Twist>(
     command_topic_, 1, boost::bind(&BatteryPlugin::cmdVelCallback, this, _1), ros::VoidPtr(), &queue_);

     cmd_vel_subscriber_ = _nh->subscribe(so);
     battery_level_pub_ = _nh->advertise<terrasentia_sensors::TerraBattery>(battery_topic_, 1);

     // start custom queue for diff drive
     this->callback_queue_thread_ = boost::thread(boost::bind(&BatteryPlugin::QueueThread, this));
     // listen to the update event (broadcast every simulation iteration)
     this->update_connection_ = event::Events::ConnectWorldUpdateBegin(boost::bind(&BatteryPlugin::OnUpdate, this));

     update_count_ = 0;
     x_ = 0;
     rot_ = 0;
     alive_ = true;

     ROS_GREEN_STREAM("Created a battery");
     // ROS_GREEN_STREAM("TerraBatteryPlugin is fully loaded.");
}

void BatteryPlugin::Init(){
     // ROS_GREEN_STREAM("Init Battery");
     this->q = this->q0;
     this->charging = false;
}

void BatteryPlugin::Reset(){
    this->iraw = 0.0;
    this->ismooth = 0.0;
    this->Init();
}

double BatteryPlugin::OnUpdateVoltage(const common::BatteryPtr &_battery){
     // double dt = this->world->Physics()->GetMaxStepSize();
     // double totalpower = 0.0;
     // double k = dt / this->tau;
     //
     // if (fabs(_battery->Voltage())<1e-3)
     //      return 0.0;
     //
     // for (auto powerLoad : _battery->PowerLoads())
     //      totalpower += powerLoad.second;
     //
     // // current = power(Watts)/Voltage
     // this->iraw = totalpower / _battery->Voltage();
     //
     // this->ismooth = this->ismooth + k * (this->iraw - this->ismooth);
     //
     // if (!this->charging) this->q = this->q - GZ_SEC_TO_HOUR(dt * this->ismooth);
     // else this->q = this->q + GZ_SEC_TO_HOUR(dt * this->qt);
     //
     // this->sim_time_now = this->world->SimTime().Double();
     //
     // #ifdef BATTERY_DEBUG
     // gzdbg << "Current charge:" << this->q << ", at:" << this->sim_time_now << "\n";
     // #endif
     //
     // //    ROS_INFO_STREAM(this->q);
     // this->et = this->e0 + this->e1 * (1 - this->q / this->c) - this->r * this->ismooth;
     //
     // #ifdef BATTERY_DEBUG
     // gzdbg << "Current voltage:" << this->et << ", at:" << this->sim_time_now << "\n";
     // #endif
     //
     // //Turn off the motor
     // if (this->q <= 0){
     //      this->sim_time_now = this->world->SimTime().Double();
     //
     //      #ifdef BATTERY_DEBUG
     //      gzdbg << "Out of juice at:" << this->sim_time_now << "\n";
     //      #endif
     //
     //      this->q = 0;
     //      kobuki_msgs::MotorPower power_msg;
     //      power_msg.state = power::OFF;
     //      lock.lock();
     //      this->motor_power.publish(power_msg);
     //      lock.unlock();
     // } else if (this->q >= this->c) this->q = this->c;
     //
     // // HUNTER TODO: change to terrabattery format msg
     // std_msgs::Float64 charge_msg;
     // charge_msg.data = this->q;
     //
     // lock.lock();
     // this->charge_state.publish(charge_msg);
     // lock.unlock();

     return et;
}

void BatteryPlugin::cmdVelCallback(
     const geometry_msgs::Twist::ConstPtr& cmd_msg) {

     boost::mutex::scoped_lock scoped_lock(lock);
     x_ = cmd_msg->linear.x;
     rot_ = cmd_msg->angular.z;
}

void BatteryPlugin::OnUpdate(){
     update_count_++;
     double dt = this->world->Physics()->GetMaxStepSize();
     double totalpower = 0.0;
     double k = dt / this->tau;

     // current = power(Watts)/Voltage
     // this->iraw = totalpower / _battery->Voltage();

     this->q = this->q - GZ_SEC_TO_HOUR(dt * k);
     this->et = this->e0 + this->e1 * (1 - this->q / this->c);
     this->last_update_time_ = this->world->SimTime();

     // ROS_INFO_STREAM(this->et);
     // gzdbg << "Current charge:" << this->q << ", at:" << this->sim_time_now << "\n";
     // gzdbg << "Current voltage:" << this->et << ", at:" << this->last_update_time_.Double() << "\n";

     // ROS_CYAN_STREAM(update_count_);


     this->publishBatteryInfo();
}

void BatteryPlugin::QueueThread() {
     static const double timeout = 0.01;

     while (alive_ && _nh->ok()){
          queue_.callAvailable(ros::WallDuration(timeout));
     }
}

void BatteryPlugin::publishBatteryInfo() {
     ros::Time current_time = ros::Time::now();

     // Package battery message header
     this->sim_battery_.stamp = current_time;
     // this->sim_battery_.header.frame_id = robot_base_frame_;
     // this->sim_battery_.child_frame_id = battery_link_;

     // Package battery message
     this->sim_battery_.vmax = _vmax;
     this->sim_battery_.vmin = _vmin;
     this->sim_battery_.voltage = this->et;

     battery_level_pub_.publish(sim_battery_);
}

  GZ_REGISTER_MODEL_PLUGIN(BatteryPlugin)
}
