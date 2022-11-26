#include <ros/ros.h>
#include "../include/terra_sensor_relay.h"

using namespace std;
using namespace terra;

int main (int argc, char** argv){

     char* ip = "192.168.1.135";
     const char* imuTopic = "/terra/imu/custom";
     const char* gpsTopic = "/terra/gps";
     const char* lidarTopic = "/terra/hokuyo";
     const char* encFrTopic = "/terra/encoder/fr";
     const char* encFlTopic = "/terra/encoder/fl";
     const char* encRrTopic = "/terra/encoder/rr";
     const char* encRlTopic = "/terra/encoder/rl";
     const char* batTopic = "/terra/battery";
     const char* pathTopic = "/waypoints_vizualization";

     int recPort = 35555;

     ros::init(argc, argv, "terra_sensor_relay_node");
     ros::NodeHandle nh;
     TerraSensorRelay relay(nh, 30000,ip);

     relay.addRosSensor("Hector IMU",imuTopic, SIMULATOR_DATA_IMU);
     relay.addRosSensor("GPS", gpsTopic, SIMULATOR_DATA_GPS);

     relay.addRosSensor("Front Right Encoder", encFrTopic, SIMULATOR_DATA_ENCODER);
     relay.addRosSensor("Front Left Encoder", encFlTopic, SIMULATOR_DATA_ENCODER);
     // relay.addRosSensor("Rear Right Encoder", encRrTopic, SIMULATOR_DATA_ENCODER);
     // relay.addRosSensor("Rear Left Encoder", encRlTopic, SIMULATOR_DATA_ENCODER);

     relay.addRosSensor("Hokyu Lidar", lidarTopic, SIMULATOR_DATA_LIDAR);
     // relay.addRosSensor("Main Battery", batTopic, SIMULATOR_DATA_BATTERY);

     // TODO
     // relay.addRosSensor("Wheel Odometry", "/odom", SIMULATOR_DATA_ENCODER);
     // relay.addRosSensor("Front Camera", "/camera/image_raw", SIMULATOR_DATA_RGB_CAMERA);
     // relay.addRosSensor("GPS Path", pathTopic, -11);

     relay.run();

}
