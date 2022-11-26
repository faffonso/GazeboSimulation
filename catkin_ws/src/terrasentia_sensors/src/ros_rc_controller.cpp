#include <iostream>
#include "../include/control/ros_rc_controller.h"

using namespace std;
using namespace terra;

/** SECTION:

     CONSTRUCTOR & DECONSTRUCTOR

*/
RosRcController::RosRcController(ros::NodeHandle nh, ros::NodeHandle _nh, float max_speed, float max_turn_radius)
		: m_nh(nh), p_nh(_nh){

     // Declare constants
     _count = 0;

     _loop_rate = new ros::Rate(1000);

	std::string prefix;
	p_nh.getParam("target",prefix);
	// cout << "UDP TARGET COMMAND: " << prefix << endl;

     // Outputs:
     //      Everything being sent out from this node
     cmd_pub = m_nh.advertise<geometry_msgs::Twist>(prefix + "/cmd_vel", 1000);

     // Inputs:
     //      Everything coming into this node
	// char* tmp = "127.1.1.12";
	rc_in = new UDP(35555,NULL);

	_max_speed = max_speed;
	_max_omega = max_speed / max_turn_radius;
}

RosRcController::~RosRcController(){
	delete rc_in;
	delete _loop_rate;
}


int RosRcController::run(){
     cout << "Looping..." << endl;

	geometry_msgs::Twist commands;

     while(ros::ok()){
		float normV = 0;
		float normOmega = 0;
		float v = 0;
		float omega = 0;

		this->readHeader();

		this->readRC();
		normV = (float) this->controls.normalized_speed / 1000000;
		normOmega = (float) this->controls.normalized_yaw_rate / 1000000;

		v = normV * _max_speed;
		omega = normOmega * _max_omega;

		commands.linear.x = v; commands.linear.y = 0; commands.linear.z = 0;
		commands.angular.x = 0; commands.angular.y = 0; commands.angular.z = -omega;
		cmd_pub.publish(commands);

		printf("Linear, Angular:     %.5f   |    %.5f \r\n",v, omega);
		// printUdpHeader(&_header);

		// Update ROS index
		_count++;
          ros::spinOnce();
          _loop_rate->sleep();
     }

     return 0;
}

/** SECTION:

     Class Private Member Functions

*/

void RosRcController::readHeader(){
	UDP* udp_line = rc_in;
     Sim_Msg_Header* data = &_header;

	char* dat = udp_line->read(sizeof(Sim_Msg_Header));
	memcpy(data, &dat[0],sizeof(Sim_Msg_Header));
}

void RosRcController::readRC(){
	int i = 0;

     UDP* udp_line = rc_in;
     Sim_Msg_MotionCommands* data = &controls;

	char* dat = udp_line->read(sizeof(*data)+sizeof(Sim_Msg_Header));
	memcpy(data, &dat[20],sizeof(*data));
}


void RosRcController::printUdpHeader(Sim_Msg_Header* header){

     int32_t header_byte, msg_type, data_type, measurement_type, measurement_length;

     header_byte = (int32_t) header->id / 1000000;
     msg_type = (int32_t) header->msg_type / 1000000;
     data_type = (int32_t) header->data_type / 1000000;
     measurement_type = (int32_t) header->measurement_type / 1000000;
     measurement_length = (int32_t) header->measurement_length / 1000000;

	printf("=========== UDP Packet Info     =================\r\n");
     printf("UDP Packet Header:\r\n");
     printf("  Header Byte: %d\r\n", header_byte);
     printf("  Message Type: %d\r\n", msg_type);
     printf("  Data Type: %d\r\n", data_type);
     printf("  Measurement Type: %d\r\n", measurement_type);
     printf("  Measurement Length: %d\r\n", measurement_length);

}
