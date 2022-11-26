#include <ros/ros.h>
#include "../include/misc/trajectory_grabber.h"

using namespace std;
using namespace terra;

int main (int argc, char** argv){

     char* ip = "192.168.1.135";

     const char* pathTopic = "/waypoints_vizualization";

     int recPort = 35555;

     ros::init(argc, argv, "trajectory_grabber_node");
     ros::NodeHandle nh;
     TrajectoryGrabber grabber(nh, 30000,ip);

     grabber.addRosSensor("GPS Path", pathTopic, -11);

     grabber.run();

}
