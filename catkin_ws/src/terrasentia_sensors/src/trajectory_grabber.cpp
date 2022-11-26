#include <iostream>
#include <boost/bind.hpp>
#include <stdlib.h>
#include <unistd.h>

#include "../include/misc/trajectory_grabber.h"
#include "../include/misc/ros_debug.h"

using namespace std;

/** SECTION:

     CONSTRUCTOR & DECONSTRUCTOR

 */
TrajectoryGrabber::TrajectoryGrabber(ros::NodeHandle nh, int port, char* ip)
: m_nh(nh){

	// Declare constants
	_count = 0;
	_num_path = 0;
	_loop_rate = new ros::Rate(5);
	_port = port;
	_ip_out = ip;

	udp_sock = new UDP(port,NULL);
}

TrajectoryGrabber::~TrajectoryGrabber(){
	delete udp_sock;
	delete _loop_rate;
}


/** SECTION:

     Main Class Functions

 */

int TrajectoryGrabber::addRosSensor(string sensor_name, const char* topic_name, int sensor_type){

	// Index of sensor in array for reference
	int idx;
	ros::Subscriber tmpSub;

	// Error-Checking
	if(_num_path + 1 >= MAX_NUM_SENSORS){
		cout << "WARNING: Too many sensors!" << endl;
		return -1;
	}
	cout << "NUM SENSORS: " << _num_path << endl;

	if(sensor_type == -11){
		idx = 1;
		tmpSub = m_nh.subscribe<visualization_msgs::MarkerArray>(topic_name, 1, boost::bind(&TrajectoryGrabber::pathCallback,this,_1,idx));
	} else{
		cout << "ERROR: Sensor-type not supported yet." << endl;
		return -2;
	}

	// Store ROS-Subscriber
	arrSubs.push_back(tmpSub);
	// Update Counters
	return _num_path;
}


int TrajectoryGrabber::run(){
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

static int dxy2dlatlon(double startLat, double startLon, double dx, double dy, double* dlat, double* dlon){
	double R = 6371000;
	static double PI = 3.14159265359;
	*dlat = (dy/R) * (180 / PI);
	double rlat1 = startLat * PI / 180;
	double rlat2 = (startLat + *dlat) * PI/180;
	*dlon = (dx/(R*cos((rlat1+rlat2)/2)))*(180/PI);

	return 0;
}

void TrajectoryGrabber::pathCallback(const visualization_msgs::MarkerArray::ConstPtr& msg, const int topic_index){

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
		//if(m_nh.setParam("loaded_path/gps_origin/latitude", this->lat_)) {}
		//if(m_nh.setParam("loaded_path/gps_origin/longitude", this->long_)) {}
		std::cout << "GPS Origin: "<< this->lat_ << " --- " << this->long_ << std::endl;

		ifs.close();
	}
	ROS_GREEN_STREAM("NEW GPS ORIGIN RETRIEVED...");
}
