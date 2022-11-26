#include "../include/control/ros_rc_controller.h"

using namespace std;

int main (int argc, char** argv){

     float max_vel, max_turn_radius;

     max_vel = 1.2;
     max_turn_radius = 0.381;

     ros::init(argc, argv, "terra_rc_controller_node");
     ros::NodeHandle nh;
     ros::NodeHandle _nh("~");
     RosRcController ss(nh,_nh,max_vel,max_turn_radius);
     ss.run();

}
