#include <iostream>
#include <boost/bind.hpp>
#include <stdlib.h>
#include <unistd.h>

#include "../include/terra_sensor_relay.h"
#include "../include/misc/ros_debug.h"

using namespace std;
using namespace terra;

/** SECTION:

     CONSTRUCTOR & DECONSTRUCTOR

 */
TerraSensorRelay::TerraSensorRelay(ros::NodeHandle nh, int port, char* ip)
: m_nh(nh), _it(nh){

	// Declare constants
	_count = 0;
	_num_sensors = 0;
	_num_imu = 0;
	_num_gps = 0;
	_num_odom = 0;
	_num_encoder = 0;
	_num_rgb = 0;
	_num_rgbd = 0;
	_num_lidar = 0;

	terra_lat_origin = 0;
	terra_long_origin = 0;

	_loop_rate = new ros::Rate(50);
	_port = port;
	_ip_out = ip;

	udp_sock = new UDP(port,NULL);

}

TerraSensorRelay::~TerraSensorRelay(){
	delete udp_sock;
	delete _loop_rate;
}


/** SECTION:

     Main Class Functions

 */

int TerraSensorRelay::addRosSensor(string sensor_name, const char* topic_name, int sensor_type){

	// Index of sensor in array for reference
	int idx;
	ros::Subscriber tmpSub;

	// Error-Checking
	if(_num_sensors + 1 >= MAX_NUM_SENSORS){
		cout << "WARNING: Too many sensors!" << endl;
		return -1;
	}
	cout << "NUM SENSORS: " << _num_sensors << endl;

	// Add subscriber with callback based on Sensor-type
	if(sensor_type == SIMULATOR_DATA_IMU){
		idx = _num_imu;
		Sim_Msg_IMUData tmpSens;
		arrImu.push_back(tmpSens);
		tmpSub = m_nh.subscribe<terrasentia_sensors::TerraImu>(topic_name, 50, boost::bind(&TerraSensorRelay::imuCallback,this,_1,idx));
		_num_imu++;
	} else if(sensor_type == SIMULATOR_DATA_GPS){
		idx = _num_gps;
		Sim_Msg_GPSData tmpSens;
		arrGps.push_back(tmpSens);
		tmpSub = m_nh.subscribe<terrasentia_sensors::TerraGps>(topic_name, 20, boost::bind(&TerraSensorRelay::gpsCallback,this,_1,idx));
		_num_gps++;
	} else if(sensor_type == SIMULATOR_DATA_LIDAR){
		idx = _num_lidar;
		Sim_Msg_LidarData tmpSens;
		arrLidar.push_back(tmpSens);
		tmpSub = m_nh.subscribe<sensor_msgs::LaserScan>(topic_name, 2000, boost::bind(&TerraSensorRelay::lidarCallback,this,_1,idx));
		_num_lidar++;
	} else if(sensor_type == SIMULATOR_DATA_ENCODER){
		idx = _num_encoder;
		Sim_Msg_EncoderData tmpSens;
		arrEncoder.push_back(tmpSens);
		tmpSub = m_nh.subscribe<terrasentia_sensors::TerraEncoder>(topic_name, 50, boost::bind(&TerraSensorRelay::encoderCallback,this,_1,idx));
		_num_encoder++;
	} else if(sensor_type == SIMULATOR_DATA_BATTERY){
		idx = _num_battery;
		Sim_Msg_BatteryData tmpSens;
		arrBattery.push_back(tmpSens);
		tmpSub = m_nh.subscribe<terrasentia_sensors::TerraBattery>(topic_name, 10, boost::bind(&TerraSensorRelay::batteryCallback,this,_1,idx));
		_num_battery++;
		// } else if(sensor_type == SIMULATOR_DATA_ODOMETRY){
			//      idx = _num_odom;
			//      tmpSub = m_nh.subscribe<nav_msgs::Odometry>(topic_name, 1000, boost::bind(&TerraSensorRelay::odomCallback,this,_1,idx));
		// } else if(sensor_type == SIMULATOR_DATA_RGB_CAMERA){
		//      idx = _num_rgb;
		// 	tmpSub = m_nh.subscribe<sensor_msgs::Image>(topic_name, 1000, boost::bind(&TerraSensorRelay::camCallback,this,_1,idx));
	} else if(sensor_type == -11){
		idx = 1;
		tmpSub = m_nh.subscribe<visualization_msgs::MarkerArray>(topic_name, 1, boost::bind(&TerraSensorRelay::pathCallback,this,_1,idx));
	} else{
		cout << "ERROR: Sensor-type not supported yet." << endl;
		return -2;
	}

	// Store ROS-Subscriber
	arrSubs.push_back(tmpSub);
	// Update Counters
	_num_sensors++;
	return _num_sensors;
}


int TerraSensorRelay::run(){
	ROS_GREEN_STREAM("Running Terra Simulator Sensor Bridge...");

	while(ros::ok()){

		// Update ROS index
		_count++;
		// ROS_INFO_STREAM(_count);
		ros::spinOnce();
		_loop_rate->sleep();
	}
	ROS_RED_STREAM("Terra Simulator Sensor Bridge DIED!");
	return 0;
}


/** SECTION:

     ROS Sensor Callbacks

 */
void TerraSensorRelay::imuCallback(const terrasentia_sensors::TerraImu::ConstPtr& msg, const int topic_index){

	// Temporary IMU data storage
	Sim_Msg_IMUData tmpImu;
	CommunicationHeaderByte header;

	// TODO: Possibly add in timestamping functionality here to offload some of the data-logging book-keeping
	header.header = topic_index;
	header.msg_type = SIMULATOR_MESSAGE_DATA_IMU;
	header.data_type = SIMULATOR_DATA_IMU;
	header.measurement_type = SIMULATOR_MEASUREMENT_SINGLE;
	header.measurement_length = 1;

	tmpImu.accel.x = (int32_t) (msg->accel.x * 1000000);
	tmpImu.accel.y = (int32_t) (msg->accel.y * 1000000);
	tmpImu.accel.z = (int32_t) (msg->accel.z * 1000000);

	tmpImu.gyro.x = (int32_t) (msg->gyro.x * 1000000);
	tmpImu.gyro.y = (int32_t) (msg->gyro.y * 1000000);
	tmpImu.gyro.z = (int32_t) (msg->gyro.z * 1000000);

	tmpImu.accel.covariance.x = (int32_t) (msg->accel.covariance.x * 1000000);
	tmpImu.accel.covariance.y = (int32_t) (msg->accel.covariance.y * 1000000);
	tmpImu.accel.covariance.z = (int32_t) (msg->accel.covariance.z * 1000000);

	tmpImu.gyro.covariance.x = (int32_t) (msg->gyro.covariance.x * 1000000);
	tmpImu.gyro.covariance.y = (int32_t) (msg->gyro.covariance.y * 1000000);
	tmpImu.gyro.covariance.z = (int32_t) (msg->gyro.covariance.z * 1000000);

	tmpImu.orientation.x = (int32_t) (msg->orientation.x * 1000000);
	tmpImu.orientation.y = (int32_t) (msg->orientation.y * 1000000);
	tmpImu.orientation.z = (int32_t) (msg->orientation.z * 1000000);
	tmpImu.orientation.w = (int32_t) (msg->orientation.w * 1000000);

	tmpImu.orientation.covariance.roll = (int32_t) (msg->orientation.covariance.roll * 1000000);
	tmpImu.orientation.covariance.pitch = (int32_t) (msg->orientation.covariance.pitch * 1000000);
	tmpImu.orientation.covariance.yaw = (int32_t) (msg->orientation.covariance.yaw * 1000000);

	tmpImu.accel.bias.x = (int32_t) (msg->accel.bias.x * 1000000);
	tmpImu.accel.bias.y = (int32_t) (msg->accel.bias.y * 1000000);
	tmpImu.accel.bias.z = (int32_t) (msg->accel.bias.z * 1000000);

	tmpImu.gyro.bias.x = (int32_t) (msg->gyro.bias.x * 1000000);
	tmpImu.gyro.bias.y = (int32_t) (msg->gyro.bias.y * 1000000);
	tmpImu.gyro.bias.z = (int32_t) (msg->gyro.bias.z * 1000000);

	tmpImu.orientation.bias.x = (int32_t) (msg->orientation.bias.x * 1000000);
	tmpImu.orientation.bias.y = (int32_t) (msg->orientation.bias.y * 1000000);
	tmpImu.orientation.bias.z = (int32_t) (msg->orientation.bias.z * 1000000);
	tmpImu.orientation.bias.w = (int32_t) (msg->orientation.bias.w * 1000000);

	sendUdp(_port, _ip_out, &header, tmpImu);

	// Debugging
	// printUdpHeader(&header);
	// printImu(tmpImu);

	// Store sensor data into its respective spot in the sensor array
	arrImu.at(topic_index) = tmpImu;

}


void TerraSensorRelay::encoderCallback(const terrasentia_sensors::TerraEncoder::ConstPtr& msg, const int topic_index){

	// Temporary IMU data storage
	Sim_Msg_EncoderData tmpEnc;
	CommunicationHeaderByte header;

	// TODO: Possibly add in timestamping functionality here to offload some of the data-logging book-keeping
	header.header = topic_index;
	header.msg_type = SIMULATOR_MESSAGE_DATA_ENCODER;
	header.data_type = SIMULATOR_DATA_ENCODER;
	header.measurement_type = SIMULATOR_MEASUREMENT_SINGLE;
	header.measurement_length = 1;

	tmpEnc.id = (int32_t)msg->id;
	tmpEnc.position = (int32_t) (msg->position * 1000000);
	tmpEnc.speed = (int32_t) (msg->speed * 1000000);
	tmpEnc.qpps = (int32_t)(msg->qpps / 3.0 );

	sendUdp(_port, _ip_out, &header, tmpEnc);

	// Debugging
	// printUdpHeader(&header);
	// printEncoder(tmpEnc);

	// Store sensor data into its respective spot in the sensor array
	arrEncoder.at(topic_index) = tmpEnc;

}

static int dxy2dlatlon(double startLat, double startLon, double dx, double dy, double* dlat, double* dlon){
	double R = 6371000;
	static double PI = 3.14159265359;
	*dlat = (dy/R) * (180 / PI);
	double rlat1 = startLat * PI / 180;
	double rlat2 = (startLat + *dlat) * PI/180;
	*dlon = (dx/(R*cos((rlat1+rlat2)/2)))*(180/PI);

	return 0;
}

void TerraSensorRelay::gpsCallback(const terrasentia_sensors::TerraGps::ConstPtr& msg, const int topic_index){

	// Temporary Odom data storage
	Sim_Msg_GPSData tmpGps;
	CommunicationHeaderByte header;

	// TODO: Possibly add in timestamping functionality here to offload some of the data-logging book-keeping
	header.header = topic_index;
	header.msg_type = SIMULATOR_MESSAGE_DATA_GPS;
	header.data_type = SIMULATOR_DATA_GPS;
	header.measurement_type = SIMULATOR_MEASUREMENT_SINGLE;
	header.measurement_length = 1;

	// Extract ROS msg data
	tmpGps.time = (int32_t)(msg->time * 1000000);
	tmpGps.covariance_type = (int32_t) msg->covariance_type;
	tmpGps.service = (int32_t) msg->service;
	tmpGps.status = (int32_t) msg->status;

	// double ref_lat=40.1021496545;
	// double ref_lon=-88.2267974168;

	double ref_lat = msg->reference_latitude;
	double ref_lon = msg->reference_longitude;

	if(m_nh.getParam("loaded_path/gps_origin/latitude", this->terra_lat_origin)) {}
	if(m_nh.getParam("loaded_path/gps_origin/longitude", this->terra_long_origin)) {}

	tmpGps.latitude = (int32_t) ((msg->latitude - ref_lat + this->terra_lat_origin) * 1000000);
	tmpGps.longitude = (int32_t) ((msg->longitude - ref_lon + this->terra_long_origin) * 1000000);
	tmpGps.altitude = (int32_t) (msg->altitude * 1000000);

	tmpGps.velocity.x = (int32_t) (msg->velocity.x * 1000000);
	tmpGps.velocity.y = (int32_t) (msg->velocity.y * 1000000);
	tmpGps.velocity.z = (int32_t) (msg->velocity.z * 1000000);

	tmpGps.covariance.x = (int32_t) (msg->covariance.x * 1000000);
	tmpGps.covariance.y = (int32_t) (msg->covariance.y * 1000000);
	tmpGps.covariance.z = (int32_t) (msg->covariance.z * 1000000);

	// cout << sizeof(header) << ", " << sizeof(tmpGps) << endl;
	// cout << msg->latitude << ", " << tmpGps.latitude << ((float) tmpGps.latitude/1000000) << endl;
	sendUdp(_port, _ip_out, &header, tmpGps);

	// Debugging
	// printUdpHeader(&header);
	printGps(tmpGps);
	std::cout << "GPS Origin: "<< this->terra_lat_origin << " --- " << this->terra_long_origin << std::endl;
	// Store sensor data into its respective spot in the sensor array
	arrGps.at(topic_index) = tmpGps;

}

void TerraSensorRelay::lidarCallback(const sensor_msgs::LaserScan::ConstPtr& msg, const int topic_index){

	// Temporary LIDAR data storage
	CommunicationHeaderByte header;

	// Extract core LIDAR data
	int n = msg->ranges.size();
	//int m = msg->intensities.size();

	Sim_Msg_LidarData tmpLidar;

	header.header = topic_index;
	header.msg_type = SIMULATOR_MESSAGE_DATA_LIDAR;
	header.data_type = SIMULATOR_DATA_LIDAR;
	header.measurement_type = SIMULATOR_MEASUREMENT_MULTIPLE;
	header.measurement_length = n;

	tmpLidar.angle_min = (int32_t) (msg->angle_min * 1000000);
	tmpLidar.angle_max = (int32_t) (msg->angle_max * 1000000);
	tmpLidar.dAngle = (int32_t) (msg->angle_increment * 1000000);
	tmpLidar.scan_time = (int32_t) (msg->scan_time * 1000000);
	tmpLidar.dTime = (int32_t) (msg->time_increment * 1000000);
	tmpLidar.range_min = (int32_t) (msg->range_min * 1000000);
	tmpLidar.range_max = (int32_t) (msg->range_max * 1000000);

	// cout << "Lidar: ";
	for(int i = 0;i<n;i++){
		int32_t lid;
		float tmpRange;

		if(msg->ranges.at(i) > msg->range_max) tmpRange = -1;
		else if(msg->ranges.at(i) < msg->range_min) tmpRange = -2;
		else tmpRange = msg->ranges.at(i);

		lid = (int32_t)(tmpRange * 1000000);
		tmpLidar.ranges[i] = lid;
		// cout << lid << ", ";
	}
	/*
	for(int i = 0;i<m;i++){
		tmpLidar.intensities[i] = (int32_t)(msg->intensities.at(i) * 1000000);
	}*/
	// cout << endl;

	// Debugging
	// cout << "LIDAR AFTER data: " << sizeof(tmpLidar) << endl;
	// for(int i=0;i<tmpRanges.size();i++){
	// 	cout << tmpRanges.at(i) << ", ";
	// }
	// cout << "\n\r" << endl;

	sendUdp(_port, _ip_out, &header, tmpLidar);

	// printUdpHeader(&header);
	// printLidar(tmpLidar);

	// Store sensor data into its respective spot in the sensor array
	arrLidar.at(topic_index) = tmpLidar;
}

void TerraSensorRelay::batteryCallback(const terrasentia_sensors::TerraBattery::ConstPtr& msg, const int topic_index){

	// Temporary IMU data storage
	Sim_Msg_BatteryData tmpBat;
	CommunicationHeaderByte header;

	// TODO: Possibly add in timestamping functionality here to offload some of the data-logging book-keeping
	header.header = topic_index;
	header.msg_type = SIMULATOR_MESSAGE_DATA_BATTERY;
	header.data_type = SIMULATOR_DATA_BATTERY;
	header.measurement_type = SIMULATOR_MEASUREMENT_SINGLE;
	header.measurement_length = 1;

	tmpBat.voltage = (int32_t) (msg->voltage * 1000000);
	tmpBat.vmax = (int32_t) (msg->vmax * 1000000);
	tmpBat.vmin = (int32_t) (msg->vmin * 1000000);

	sendUdp(_port, _ip_out, &header, tmpBat);

	// Debugging
	// printUdpHeader(&header);
	// printBattery(tmpBat);

	// Store sensor data into its respective spot in the sensor array
	arrBattery.at(topic_index) = tmpBat;
}

// void TerraSensorRelay::odomCallback(const nav_msgs::Odometry::ConstPtr& msg, const int topic_index){
//
//      // Temporary Odom data storage
//      ROS_ODOMETRY_DATA tmpOdom;
//
//      // Extract ROS msg data
//      tmpOdom.stamp.time = msg->header.stamp.toNSec();
//      tmpOdom.stamp.seq = msg->header.seq;
//      tmpOdom.stamp.frame = msg->child_frame_id;
//
//      // Extract core Odom data
//      tmpOdom.position.x = msg->pose.pose.position.x;
//      tmpOdom.position.y = msg->pose.pose.position.y;
//      tmpOdom.position.z = msg->pose.pose.position.z;
//      tmpOdom.orientation.x = msg->pose.pose.orientation.x;
//      tmpOdom.orientation.y = msg->pose.pose.orientation.y;
//      tmpOdom.orientation.z = msg->pose.pose.orientation.z;
//      tmpOdom.orientation.w = msg->pose.pose.orientation.w;
//
//      // TODO: Extract Odom covariance
//
//      // Debugging
//      // cout << "Odometry data: " << sensors.at(topic_index).stamp.topic_name << endl;
//
//      // Store sensor data into its respective spot in the sensor array
//      sensors.at(topic_index).odom = tmpOdom;
//
// }


// void TerraSensorRelay::camCallback(const sensor_msgs::Image::ConstPtr& msg, const int topic_index){
//
// 	// Temporary LIDAR data storage
// 	ROS_CAM_DATA tmpCam;
//
// 	cv_bridge::CvImageConstPtr cv_ptr;
//
// 	try{
// 		cv_ptr = cv_bridge::toCvShare(msg, sensor_msgs::image_encodings::BGR8);
// 	} catch (cv_bridge::Exception& e) {
// 		ROS_ERROR("cv_bridge exception: %s", e.what());
// 	}
//
// 	// Extract ROS msg data
// 	tmpCam.stamp.time = msg->header.stamp.toNSec();
// 	tmpCam.stamp.seq = msg->header.seq;
//
// 	// Extract core LIDAR data
// 	tmpCam.image = cv_ptr->image;
//
// 	// Debugging
//      // cout << "Camera data: " << sensors.at(topic_index).stamp.topic_name << endl;
// 	// cv::imshow("TEST", cv_ptr->image);
// 	// cv::waitKey(3);
//
// 	// Store sensor data into its respective spot in the sensor array
// 	sensors.at(topic_index).rgb = tmpCam;
//
// }


void TerraSensorRelay::pathCallback(const visualization_msgs::MarkerArray::ConstPtr& msg, const int topic_index){

	// this->marker_.id = i;
	// this->marker_.pose.position.x = -waypoints[i].x;
	// this->marker_.pose.position.y

	// ROS_GREEN_STREAM("GPS WAYPOINTS RECIEVED...");
	this->waypoints_.clear();

	std::string s = "lftp sftp://pi:daslabterraGaussian13@192.168.1.135  -e 'get controller/loaded_trajectory.otraj; bye'";
	// ROS_INFO(s.c_str());
	system(s.c_str());

	system("cp loaded_trajectory.otraj path.txt ; rm loaded_trajectory.otraj");

	this->waypoints_file_path_ = "path.txt";


	if(this->waypoints_file_path_.empty()){

	}else{
		this->filename_ = this->waypoints_file_path_.c_str();
		std::vector<CoordinatePair> v;
		std::ifstream ifs(this->filename_);

		if(ifs) std::copy(std::istream_iterator<CoordinatePair>(ifs),std::istream_iterator<CoordinatePair>(),std::back_inserter(v));
		else	std::cerr << "Couldn't open " << this->filename_ << "\n";

		// Store the latitude and longitude
		this->lat_ = v[0].x;
		this->long_ = v[0].y;

		std::cout << "GPS Origin: "<< this->lat_ << " --- " << this->long_ << std::endl;

		ifs.close();
	}
	ROS_GREEN_STREAM("NEW GPS ORIGIN RETRIEVED...");
}

/** SECTION:

     UDP SENDING OVERLOADS

 */

int TerraSensorRelay::sendUdp(int _port, char* _add, CommunicationHeaderByte* header, Sim_Msg_IMUData data){
	char _buf[4096];
	memset(_buf, 0, sizeof(_buf));

	memcpy(&_buf[0], &header->header, sizeof(int));
	memcpy(&_buf[4], &header->msg_type, sizeof(int));
	memcpy(&_buf[8], &header->data_type, sizeof(int));
	memcpy(&_buf[12], &header->measurement_type, sizeof(int));
	memcpy(&_buf[16], &header->measurement_length, sizeof(int));
	memcpy(&_buf[20], &data, sizeof(data));

	int err = udp_sock->write(_buf,sizeof(*header)+sizeof(data),_add,_port);

	return err;
}

int TerraSensorRelay::sendUdp(int _port, char* _add, CommunicationHeaderByte* header, Sim_Msg_GPSData data){
	char _buf[4096];
	memset(_buf, 0, sizeof(_buf));

	memcpy(&_buf[0], &header->header, sizeof(int));
	memcpy(&_buf[4], &header->msg_type, sizeof(int));
	memcpy(&_buf[8], &header->data_type, sizeof(int));
	memcpy(&_buf[12], &header->measurement_type, sizeof(int));
	memcpy(&_buf[16], &header->measurement_length, sizeof(int));
	memcpy(&_buf[20], &data, sizeof(data));

	int err = udp_sock->write(_buf,sizeof(*header)+sizeof(data),_add,_port);

	return err;
}

int TerraSensorRelay::sendUdp(int _port, char* _add, CommunicationHeaderByte* header, Sim_Msg_LidarData data){
	// int num_bytes = sizeof(*header) + sizeof(data) - sizeof(data.ranges) + sizeof(data.ranges)*sizeof(int32_t);

	char _buf[10000];
	memset(_buf, 0, sizeof(_buf));

	memcpy(&_buf[0], &header->header, sizeof(int));
	memcpy(&_buf[4], &header->msg_type, sizeof(int));
	memcpy(&_buf[8], &header->data_type, sizeof(int));
	memcpy(&_buf[12], &header->measurement_type, sizeof(int));
	memcpy(&_buf[16], &header->measurement_length, sizeof(int));
	memcpy(&_buf[20], &data, sizeof(data));

	int err = udp_sock->write(_buf,sizeof(*header)+sizeof(data),_add,_port);

	return err;
}

int TerraSensorRelay::sendUdp(int _port, char* _add, CommunicationHeaderByte* header, Sim_Msg_EncoderData data){
	// int num_bytes = sizeof(*header) + sizeof(data) - sizeof(data.ranges) + sizeof(data.ranges)*sizeof(int32_t);

	char _buf[10000];
	memset(_buf, 0, sizeof(_buf));

	memcpy(&_buf[0], &header->header, sizeof(int));
	memcpy(&_buf[4], &header->msg_type, sizeof(int));
	memcpy(&_buf[8], &header->data_type, sizeof(int));
	memcpy(&_buf[12], &header->measurement_type, sizeof(int));
	memcpy(&_buf[16], &header->measurement_length, sizeof(int));
	memcpy(&_buf[20], &data, sizeof(data));

	int err = udp_sock->write(_buf,sizeof(*header)+sizeof(data),_add,_port);

	return err;
}

int TerraSensorRelay::sendUdp(int _port, char* _add, CommunicationHeaderByte* header, Sim_Msg_BatteryData data){
	// int num_bytes = sizeof(*header) + sizeof(data) - sizeof(data.ranges) + sizeof(data.ranges)*sizeof(int32_t);

	char _buf[10000];
	memset(_buf, 0, sizeof(_buf));

	memcpy(&_buf[0], &header->header, sizeof(int));
	memcpy(&_buf[4], &header->msg_type, sizeof(int));
	memcpy(&_buf[8], &header->data_type, sizeof(int));
	memcpy(&_buf[12], &header->measurement_type, sizeof(int));
	memcpy(&_buf[16], &header->measurement_length, sizeof(int));
	memcpy(&_buf[20], &data, sizeof(data));

	int err = udp_sock->write(_buf,sizeof(*header)+sizeof(data),_add,_port);

	return err;
}


/** SECTION:

     SENSOR DATA PRINT OUTS

 */

void TerraSensorRelay::printUdpHeader(CommunicationHeaderByte* _header){

	int header_byte, msg_type, data_type, measurement_type, measurement_length;

	header_byte = _header->header;
	msg_type = _header->msg_type;
	data_type = _header->data_type;
	measurement_type = _header->measurement_type;
	measurement_length = _header->measurement_length;

	printf("=========== UDP Packet Info     =================\r\n");
	printf("UDP Packet Header:\r\n");
	printf("  Header Byte: %d\r\n", header_byte);
	printf("  Message Type: %d\r\n", msg_type);
	printf("  Data Type: %d\r\n", data_type);
	printf("  Measurement Type: %d\r\n", measurement_type);
	printf("  Measurement Length: %d\r\n", measurement_length);
}

void TerraSensorRelay::printImu(Sim_Msg_IMUData data){

	float ax, ay, az, gx, gy, gz;
	float cov_ax, cov_ay, cov_az, cov_gx, cov_gy, cov_gz;
	float bias_ax, bias_ay, bias_az, bias_gx, bias_gy, bias_gz;
	float ox, oy, oz, ow;
	float cov_ox, cov_oy, cov_oz;
	float bias_ox, bias_oy, bias_oz, bias_ow;

	ax = (float) data.accel.x / 1000000; ay = (float) data.accel.y / 1000000; az = (float) data.accel.z / 1000000;
	gx = (float) data.gyro.x / 1000000; gy = (float) data.gyro.y / 1000000; gz = (float) data.gyro.z / 1000000;

	cov_ax = (float) data.accel.covariance.x / 1000000; cov_ay = (float) data.accel.covariance.y / 1000000; cov_az = (float) data.accel.covariance.z / 1000000;
	cov_gx = (float) data.gyro.covariance.x / 1000000; cov_gy = (float) data.gyro.covariance.y / 1000000; cov_gz = (float) data.gyro.covariance.z / 1000000;

	bias_ax = (float) data.accel.bias.x / 1000000; bias_ay = (float) data.accel.bias.y / 1000000; bias_az = (float) data.accel.bias.z / 1000000;
	bias_gx = (float) data.gyro.bias.x / 1000000; bias_gy = (float) data.gyro.bias.y / 1000000; bias_gz = (float) data.gyro.bias.z / 1000000;

	ox = (float) data.orientation.x / 1000000; oy = (float) data.orientation.y / 1000000; oz = (float) data.orientation.z / 1000000; ow = (float) data.orientation.w / 1000000;
	cov_ox = (float) data.orientation.covariance.roll / 1000000; cov_oy = (float) data.orientation.covariance.pitch / 1000000; cov_oz = (float) data.orientation.covariance.yaw / 1000000;
	bias_ox = (float) data.orientation.bias.x / 1000000; bias_oy = (float) data.orientation.bias.y / 1000000; bias_oz = (float) data.orientation.bias.z / 1000000; bias_ow = (float) data.orientation.bias.w / 1000000;

	printf("=========== IMU Measurement     =================\r\n");
	printf("Accelerometer Data:\r\n");
	printf("  Accelerations (X, Y, Z): %.5f,   %.5f,     %.5f\r\n", ax,ay,az);
	printf("  Covariances (X, Y, Z): %.5e,   %.5e,     %.5e\r\n", cov_ax,cov_ay,cov_az);
	printf("  Biases (X, Y, Z): %.5f,   %.5f,     %.5f\r\n", bias_ax,bias_ay,bias_az);
	printf("Gyro Data:\r\n");
	printf("  Angular Velocities (X, Y, Z): %.5f,   %.5f,     %.5f\r\n", gx,gy,gz);
	printf("  Covariances (X, Y, Z): %.5e,   %.5e,     %.5e\r\n", cov_gx,cov_gy,cov_gz);
	printf("  Biases (X, Y, Z): %.5f,   %.5f,     %.5f\r\n", bias_gx,bias_gy,bias_gz);
	printf("Orientation Data:\r\n");
	printf("  Quaternions (X, Y, Z, W): %.5f,   %.5f,     %.5f, %.5f\r\n", ox,oy,oz,ow);
	printf("  Covariances (Roll, Pitch, Yaw): %.5e,   %.5e,     %.5e\r\n", cov_ox,cov_oy,cov_oz);
	printf("  Biases (X, Y, Z, W): %.5f,   %.5f,     %.5f, %.5f\r\n", bias_ox,bias_oy,bias_oz,bias_ow);
}

void TerraSensorRelay::printGps(Sim_Msg_GPSData data){

	float t, lat, lon, alt;
	float vx, vy, vz, cov_x, cov_y, cov_z;
	uint8_t cov_type;
	uint16_t srv_type;
	int8_t status;

	t = (float) data.time / 1000000;
	cov_type = data.covariance_type; srv_type = data.service; status = data.status;

	lat = (double) data.latitude / 1000000; lon = (double) data.longitude / 1000000; alt = (double) data.altitude / 1000000;
	vx = (float) data.velocity.x / 1000000; vy = (float) data.velocity.y / 1000000; vz = (float) data.velocity.z / 1000000;
	cov_x = (float) data.covariance.x / 1000000; cov_y = (float) data.covariance.y / 1000000; cov_z = (float) data.covariance.z / 1000000;

	printf("=========== GPS Measurement     =================\r\n");
	printf("GPS Info Data:\r\n");
	printf("  Fix Status: %d\r\n", status);
	printf("  GPS Service Type: %d\r\n", srv_type);
	printf("  Covariance Type: %d\r\n", cov_type);
	printf("GPS Data:\r\n");
	printf("  Timestamp: %.4f\r\n", t);
	printf("  Coordinates (Lat, Long, Alt): %.9f,   %.9f,     %.9f\r\n", lat,lon,alt);
	printf("  Velocity (X, Y, Z): %.5e,   %.5e,     %.5e\r\n", vx, vy, vz);
	printf("  Covariances (Lat, Long, Alt): %.5e,   %.5e,     %.5e\r\n", cov_x, cov_y, cov_z);
}

void TerraSensorRelay::printLidar(Sim_Msg_LidarData data){

	float angle_min = (float) data.angle_min / 1000000;
	float angle_max = (float) data.angle_max / 1000000;
	float dAngle = (float) data.dAngle / 1000000;
	float scan_time = (float) data.scan_time / 1000000;
	float dTime = (float) data.dTime / 1000000;
	float range_min = (float) data.range_min / 1000000;
	float range_max = (float) data.range_max / 1000000;
	// float ranges[];
	// float intensities[];

	printf("=========== Lidar Measurement     =================\r\n");
	printf("LiDAR Info Data:\r\n");
	printf("  Angle Limits: %.4f  |    %.4f\r\n", angle_min,angle_max);
	printf("  Range Limits: %.4f  |    %.4f\r\n", range_min,range_max);
	printf("  Δangle, Δtime: %.4f  |    %.6f\r\n", dAngle,dTime);
	printf("LiDAR Data:\r\n");
	printf("  Ranges: ");
	// cout << "\r\nSize: " << sizeof(data.ranges);
	cout << "\r\nSize: " << sizeof(data.ranges)/sizeof(data.ranges[0]);

	for(int i=0;i<sizeof(data.ranges);i++){
		// cout << (float) data->ranges[i] / 1000000 << ", ";
	}
	printf("  Intensities: \r\n");
}


void TerraSensorRelay::printEncoder(Sim_Msg_EncoderData data){

	float ang_pos, ang_spd;
	int motor_id;
	int32_t qpps;

	motor_id = (int)data.id;
	ang_pos = (float) data.position / 1000000;
	ang_spd = (float) data.speed / 1000000;
	qpps = (int32_t) data.qpps;

	printf("===========     Encoder Measurement     =================\r\n");
	printf("Motor #%d:\r\n", motor_id);
	printf("  Angular Position (radians): %.5f\r\n", ang_pos);
	printf("  Angular Velocity (rad / sec): %.5e\r\n", ang_spd);
	printf("  QPPS (pulses / sec): %d\r\n", qpps);
}

void TerraSensorRelay::printBattery(Sim_Msg_BatteryData data){

	float max, min, voltage;

	max = (float) data.vmax / 1000000;
	min = (float) data.vmin / 1000000;
	voltage = (float) data.voltage / 1000000;

	printf("===========     Battery Measurement     =================\r\n");
	printf("	Current Voltage (V): %.3f\r\n", voltage);
	printf("	Max Voltage (V): %.3f\r\n", max);
	printf("	Min Voltage (V): %.3e\r\n", min);
}
