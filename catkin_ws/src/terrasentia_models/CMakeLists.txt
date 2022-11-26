cmake_minimum_required(VERSION 2.8.3)
project(terrasentia_models)

## Add support for C++11, supported in ROS Kinetic and newer
set(CMAKE_CXX_FLAGS "-std=c++11 ${CMAKE_CXX_FLAGS}")

set( ROS_CXX_DEPENDENCIES
     roscpp
)

find_package(catkin REQUIRED COMPONENTS ${ROS_CXX_DEPENDENCIES})

include_directories(
     ${catkin_INCLUDE_DIRS}
)
# link_directories(
#      ${GAZEBO_LIBRARY_DIRS}
#      ${OGRE_LIBRARY_DIRS}
#      ${OGRE-Terrain_LIBRARY_DIRS}
#      ${OGRE-Paging_LIBRARY_DIRS}
# )


#######################################
## Declare ROS messages and services ##
#######################################

# add_message_files(
#   FILES
#   XYZ_Base.msg
#   Euler_Base.msg
#   Quaternion_Base.msg
#   Terra_XYZ_Data.msg
#   Terra_Orientation_Data.msg
#   TerraImu.msg
#   TerraGps.msg
#   TerraEncoder.msg
#   TerraBattery.msg
# )

## Generate added messages and services with any dependencies listed here
# generate_messages(
#   DEPENDENCIES geometry_msgs visualization_msgs terrasentia_sensors
# )

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
     INCLUDE_DIRS
     LIBRARIES
     terrasentia_models
     CATKIN_DEPENDS ${ROS_CXX_DEPENDENCIES}
)
add_dependencies(${catkin_EXPORTED_TARGETS})

#####################
## Build Libraries ##
#####################
