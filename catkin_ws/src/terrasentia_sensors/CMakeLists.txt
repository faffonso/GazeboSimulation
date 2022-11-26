cmake_minimum_required(VERSION 2.8.3)
project(terrasentia_sensors)

## Add support for C++11, supported in ROS Kinetic and newer
set(CMAKE_CXX_FLAGS "-std=c++11 ${CMAKE_CXX_FLAGS}")

set( ROS_CXX_DEPENDENCIES
     roscpp
     sensor_msgs
     geometry_msgs
     visualization_msgs
     std_msgs
     std_srvs
     dynamic_reconfigure
     message_generation
     message_runtime
     nav_msgs
     gazebo_dev
     gazebo_plugins
     gazebo_ros
     gazebo_msgs
     tf
     urdf
     xacro
     cv_bridge
     image_transport
     message_filters
     camera_info_manager
     genmsg
     hector_gazebo_plugins
)

# Excerpt from gazebo_ros_plugins package repo
include (FindPkgConfig)
include (SwarmbotsConfig.user.cmake)
if (PKG_CONFIG_FOUND)
  pkg_check_modules(XML libxml-2.0)
  pkg_check_modules(OGRE OGRE)
  pkg_check_modules(OGRE-Terrain OGRE-Terrain)
  pkg_check_modules(OGRE-Paging OGRE-Paging)
else()
  message(FATAL_ERROR "pkg-config is required; please install it")
endif()

find_package(catkin REQUIRED COMPONENTS ${ROS_CXX_DEPENDENCIES})
find_package(Boost REQUIRED COMPONENTS thread)
find_package(gazebo REQUIRED)

execute_process(COMMAND
  pkg-config --variable=plugindir OGRE
  OUTPUT_VARIABLE OGRE_PLUGIN_PATH
  OUTPUT_STRIP_TRAILING_WHITESPACE
)

include_directories(
     include
     ${SWARMBOTS_DIRS}
     ${catkin_INCLUDE_DIRS}
     ${Boost_INCLUDE_DIRS}
     ${GAZEBO_INCLUDE_DIRS}
     ${OGRE_INCLUDE_DIRS}
     ${OGRE-Terrain_INCLUDE_DIRS}
     ${OGRE-Paging_INCLUDE_DIRS}
)
link_directories(
     ${GAZEBO_LIBRARY_DIRS}
     ${OGRE_LIBRARY_DIRS}
     ${OGRE-Terrain_LIBRARY_DIRS}
     ${OGRE-Paging_LIBRARY_DIRS}
)


#######################################
## Declare ROS messages and services ##
#######################################

add_message_files(
  FILES
  XYZ_Base.msg
  Euler_Base.msg
  Quaternion_Base.msg
  Terra_XYZ_Data.msg
  Terra_Orientation_Data.msg
  TerraImu.msg
  TerraGps.msg
  TerraEncoder.msg
  TerraBattery.msg
  FourWD.msg
  Motor.msg
  FullGPS.msg
)

## Generate added messages and services with any dependencies listed here
generate_messages(
  DEPENDENCIES geometry_msgs visualization_msgs terrasentia_sensors
)

###################################
## catkin specific configuration ##
###################################
## The catkin_package macro generates cmake config files for your package
## Declare things to be passed to dependent projects
## INCLUDE_DIRS: uncomment this if you package contains header files
## LIBRARIES: libraries you create in this project that dependent projects also need
## CATKIN_DEPENDS: catkin_packages dependent projects also need
## DEPENDS: system dependencies of this project that dependent projects also need

catkin_package(
     INCLUDE_DIRS include
     LIBRARIES
     terrasentia_sensors
     CATKIN_DEPENDS ${ROS_CXX_DEPENDENCIES}
     DEPENDS Boost
)
add_dependencies(${catkin_EXPORTED_TARGETS})

#####################
## Build Libraries ##
#####################

# add_library(libudp src/udp.cpp)
# target_link_libraries(libudp ${catkin_LIBRARIES})
# add_dependencies(libudp ${catkin_EXPORTED_TARGETS} ${PROJECT_NAME}_gencpp)
#
# add_library(libterra_sensor_relay src/terra_sensor_relay.cpp)
# target_link_libraries(libterra_sensor_relay libudp ${Boost_LIBRARIES} ${GAZEBO_LIBRARIES} ${catkin_LIBRARIES})
# add_dependencies(libterra_sensor_relay ${PROJECT_NAME}_generate_messages_cpp)
#
# add_library(librccontroller src/ros_rc_controller.cpp)
# target_link_libraries(librccontroller ${catkin_LIBRARIES} ${Boost_LIBRARIES} libudp)
# add_dependencies(librccontroller ${catkin_EXPORTED_TARGETS} ${PROJECT_NAME}_gencpp)
#
# add_library(libtrajectory_grabber src/trajectory_grabber.cpp)
# target_link_libraries(libtrajectory_grabber libudp ${Boost_LIBRARIES} ${GAZEBO_LIBRARIES} ${catkin_LIBRARIES})
# add_dependencies(libtrajectory_grabber ${PROJECT_NAME}_generate_messages_cpp)

###################
## Build Plugins ##
###################

# Hector-gazebo repo based plugins
add_library(terra_ros_imu plugins/terra_ros_imu.cpp)
target_link_libraries(terra_ros_imu ${Boost_LIBRARIES} ${GAZEBO_LIBRARIES} ${catkin_LIBRARIES})
add_dependencies(terra_ros_imu ${PROJECT_NAME}_generate_messages_cpp)

add_library(terra_ros_gps_with_dropout plugins/terra_ros_gps_with_dropout.cpp)
target_link_libraries(terra_ros_gps_with_dropout ${GAZEBO_LIBRARIES} ${catkin_LIBRARIES})
add_dependencies(terra_ros_gps_with_dropout ${PROJECT_NAME}_generate_messages_cpp)

# add_library(terra_ros_gps_simple plugins/terra_ros_gps_simple.cpp)
# target_link_libraries(terra_ros_gps_simple ${GAZEBO_LIBRARIES} ${catkin_LIBRARIES})
# add_dependencies(terra_ros_gps_simple ${PROJECT_NAME}_generate_messages_cpp)

# add_library(terra_ros_sonar plugins/terra_ros_sonar.cpp)
# target_link_libraries(terra_ros_sonar ${GAZEBO_LIBRARIES} ${catkin_LIBRARIES})
# add_dependencies(terra_ros_sonar ${PROJECT_NAME}_generate_messages_cpp)
#
# ### Gazebo-Ros repo based plugins
# add_library(terra_ros_rgb_cam plugins/terra_ros_rgb_cam.cpp)
# target_link_libraries(terra_ros_rgb_cam ${GAZEBO_LIBRARIES} CameraPlugin ${catkin_LIBRARIES})
# add_dependencies(terra_ros_rgb_cam ${PROJECT_NAME}_generate_messages_cpp)
#
# add_library(terra_ros_rgbd_cam plugins/terra_ros_rgbd_cam.cpp)
# target_link_libraries(terra_ros_rgbd_cam ${GAZEBO_LIBRARIES} DepthCameraPlugin ${catkin_LIBRARIES})
# add_dependencies(terra_ros_rgbd_cam ${PROJECT_NAME}_generate_messages_cpp)
#
# add_library(terra_ros_2d_laser plugins/terra_ros_2d_laser.cpp)
# target_link_libraries(terra_ros_2d_laser RayPlugin ${catkin_LIBRARIES})
# add_dependencies(terra_ros_2d_laser ${PROJECT_NAME}_generate_messages_cpp)
#
# add_library(terra_ros_3d_laser plugins/terra_ros_3d_laser.cpp)
# target_link_libraries(terra_ros_3d_laser RayPlugin ${catkin_LIBRARIES})
# add_dependencies(terra_ros_3d_laser ${PROJECT_NAME}_generate_messages_cpp)
#
# add_library(terra_ros_3d_gpu_laser plugins/terra_ros_3d_gpu_laser.cpp)
# target_link_libraries(terra_ros_3d_gpu_laser GpuRayPlugin ${catkin_LIBRARIES})
# add_dependencies(terra_ros_3d_gpu_laser ${PROJECT_NAME}_generate_messages_cpp)
#
# add_library(terra_ros_2d_gpu_laser plugins/terra_ros_2d_gpu_laser.cpp)
# target_link_libraries(terra_ros_2d_gpu_laser GpuRayPlugin ${catkin_LIBRARIES})
# add_dependencies(terra_ros_2d_gpu_laser ${PROJECT_NAME}_generate_messages_cpp)

add_library(terra_ros_skid_steer plugins/terra_skid_steering_with_encoder.cpp)
target_link_libraries(terra_ros_skid_steer ${catkin_LIBRARIES})
add_dependencies(terra_ros_skid_steer ${PROJECT_NAME}_generate_messages_cpp)

add_library(terra_ros_encoder plugins/terra_encoder.cpp)
target_link_libraries(terra_ros_encoder ${catkin_LIBRARIES})
add_dependencies(terra_ros_encoder ${PROJECT_NAME}_generate_messages_cpp)

add_library(terra_ros_battery plugins/terra_sim_battery.cpp)
target_link_libraries(terra_ros_battery ${catkin_LIBRARIES})
add_dependencies(terra_ros_battery ${PROJECT_NAME}_generate_messages_cpp)

##################
## Build Nodes ###
##################

# add_executable(terra_rc_controller_node src/emulate_rc_control_node.cpp)
# target_link_libraries(terra_rc_controller_node librccontroller)
# add_dependencies(terra_rc_controller_node ${PROJECT_NAME}_gencpp)
#
# add_executable(terra_sensor_relay_node src/terra_sensor_relay_node.cpp)
# target_link_libraries(terra_sensor_relay_node libterra_sensor_relay)
# add_dependencies(terra_sensor_relay_node ${PROJECT_NAME}_gencpp)
#
# add_executable(trajectory_grabber_node src/trajectory_grabber_node.cpp)
# target_link_libraries(trajectory_grabber_node libtrajectory_grabber)
# add_dependencies(trajectory_grabber_node ${PROJECT_NAME}_gencpp)
