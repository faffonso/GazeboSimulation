# Install script for directory: /home/faffonso/Documentos/IC/GazeboSimulation/catkin_ws/src/terrasentia_sensors

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/faffonso/Documentos/IC/GazeboSimulation/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/terrasentia_sensors/msg" TYPE FILE FILES
    "/home/faffonso/Documentos/IC/GazeboSimulation/catkin_ws/src/terrasentia_sensors/msg/XYZ_Base.msg"
    "/home/faffonso/Documentos/IC/GazeboSimulation/catkin_ws/src/terrasentia_sensors/msg/Euler_Base.msg"
    "/home/faffonso/Documentos/IC/GazeboSimulation/catkin_ws/src/terrasentia_sensors/msg/Quaternion_Base.msg"
    "/home/faffonso/Documentos/IC/GazeboSimulation/catkin_ws/src/terrasentia_sensors/msg/Terra_XYZ_Data.msg"
    "/home/faffonso/Documentos/IC/GazeboSimulation/catkin_ws/src/terrasentia_sensors/msg/Terra_Orientation_Data.msg"
    "/home/faffonso/Documentos/IC/GazeboSimulation/catkin_ws/src/terrasentia_sensors/msg/TerraImu.msg"
    "/home/faffonso/Documentos/IC/GazeboSimulation/catkin_ws/src/terrasentia_sensors/msg/TerraGps.msg"
    "/home/faffonso/Documentos/IC/GazeboSimulation/catkin_ws/src/terrasentia_sensors/msg/TerraEncoder.msg"
    "/home/faffonso/Documentos/IC/GazeboSimulation/catkin_ws/src/terrasentia_sensors/msg/TerraBattery.msg"
    "/home/faffonso/Documentos/IC/GazeboSimulation/catkin_ws/src/terrasentia_sensors/msg/FourWD.msg"
    "/home/faffonso/Documentos/IC/GazeboSimulation/catkin_ws/src/terrasentia_sensors/msg/Motor.msg"
    "/home/faffonso/Documentos/IC/GazeboSimulation/catkin_ws/src/terrasentia_sensors/msg/FullGPS.msg"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/terrasentia_sensors/cmake" TYPE FILE FILES "/home/faffonso/Documentos/IC/GazeboSimulation/catkin_ws/build/terrasentia_sensors/catkin_generated/installspace/terrasentia_sensors-msg-paths.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/faffonso/Documentos/IC/GazeboSimulation/catkin_ws/devel/include/terrasentia_sensors")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/faffonso/Documentos/IC/GazeboSimulation/catkin_ws/devel/share/roseus/ros/terrasentia_sensors")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/faffonso/Documentos/IC/GazeboSimulation/catkin_ws/devel/share/common-lisp/ros/terrasentia_sensors")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/faffonso/Documentos/IC/GazeboSimulation/catkin_ws/devel/share/gennodejs/ros/terrasentia_sensors")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/faffonso/Documentos/IC/GazeboSimulation/catkin_ws/devel/lib/python3/dist-packages/terrasentia_sensors")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/faffonso/Documentos/IC/GazeboSimulation/catkin_ws/devel/lib/python3/dist-packages/terrasentia_sensors")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/faffonso/Documentos/IC/GazeboSimulation/catkin_ws/build/terrasentia_sensors/catkin_generated/installspace/terrasentia_sensors.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/terrasentia_sensors/cmake" TYPE FILE FILES "/home/faffonso/Documentos/IC/GazeboSimulation/catkin_ws/build/terrasentia_sensors/catkin_generated/installspace/terrasentia_sensors-msg-extras.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/terrasentia_sensors/cmake" TYPE FILE FILES
    "/home/faffonso/Documentos/IC/GazeboSimulation/catkin_ws/build/terrasentia_sensors/catkin_generated/installspace/terrasentia_sensorsConfig.cmake"
    "/home/faffonso/Documentos/IC/GazeboSimulation/catkin_ws/build/terrasentia_sensors/catkin_generated/installspace/terrasentia_sensorsConfig-version.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/terrasentia_sensors" TYPE FILE FILES "/home/faffonso/Documentos/IC/GazeboSimulation/catkin_ws/src/terrasentia_sensors/package.xml")
endif()

