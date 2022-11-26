// Generated by gencpp from file terrasentia_sensors/FullGPS.msg
// DO NOT EDIT!


#ifndef TERRASENTIA_SENSORS_MESSAGE_FULLGPS_H
#define TERRASENTIA_SENSORS_MESSAGE_FULLGPS_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace terrasentia_sensors
{
template <class ContainerAllocator>
struct FullGPS_
{
  typedef FullGPS_<ContainerAllocator> Type;

  FullGPS_()
    : header()
    , latitude(0.0)
    , longitude(0.0)
    , altitude(0.0)
    , heading(0.0)
    , heading_accuracy(0.0)
    , horizontal_accuracy(0.0)
    , speed_east(0.0)
    , speed_north(0.0)
    , speed_accuracy(0.0)
    , read_timestamp(0.0)  {
    }
  FullGPS_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , latitude(0.0)
    , longitude(0.0)
    , altitude(0.0)
    , heading(0.0)
    , heading_accuracy(0.0)
    , horizontal_accuracy(0.0)
    , speed_east(0.0)
    , speed_north(0.0)
    , speed_accuracy(0.0)
    , read_timestamp(0.0)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef double _latitude_type;
  _latitude_type latitude;

   typedef double _longitude_type;
  _longitude_type longitude;

   typedef float _altitude_type;
  _altitude_type altitude;

   typedef float _heading_type;
  _heading_type heading;

   typedef float _heading_accuracy_type;
  _heading_accuracy_type heading_accuracy;

   typedef float _horizontal_accuracy_type;
  _horizontal_accuracy_type horizontal_accuracy;

   typedef float _speed_east_type;
  _speed_east_type speed_east;

   typedef float _speed_north_type;
  _speed_north_type speed_north;

   typedef float _speed_accuracy_type;
  _speed_accuracy_type speed_accuracy;

   typedef float _read_timestamp_type;
  _read_timestamp_type read_timestamp;





  typedef boost::shared_ptr< ::terrasentia_sensors::FullGPS_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::terrasentia_sensors::FullGPS_<ContainerAllocator> const> ConstPtr;

}; // struct FullGPS_

typedef ::terrasentia_sensors::FullGPS_<std::allocator<void> > FullGPS;

typedef boost::shared_ptr< ::terrasentia_sensors::FullGPS > FullGPSPtr;
typedef boost::shared_ptr< ::terrasentia_sensors::FullGPS const> FullGPSConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::terrasentia_sensors::FullGPS_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::terrasentia_sensors::FullGPS_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::terrasentia_sensors::FullGPS_<ContainerAllocator1> & lhs, const ::terrasentia_sensors::FullGPS_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.latitude == rhs.latitude &&
    lhs.longitude == rhs.longitude &&
    lhs.altitude == rhs.altitude &&
    lhs.heading == rhs.heading &&
    lhs.heading_accuracy == rhs.heading_accuracy &&
    lhs.horizontal_accuracy == rhs.horizontal_accuracy &&
    lhs.speed_east == rhs.speed_east &&
    lhs.speed_north == rhs.speed_north &&
    lhs.speed_accuracy == rhs.speed_accuracy &&
    lhs.read_timestamp == rhs.read_timestamp;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::terrasentia_sensors::FullGPS_<ContainerAllocator1> & lhs, const ::terrasentia_sensors::FullGPS_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace terrasentia_sensors

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::terrasentia_sensors::FullGPS_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::terrasentia_sensors::FullGPS_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::terrasentia_sensors::FullGPS_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::terrasentia_sensors::FullGPS_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::terrasentia_sensors::FullGPS_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::terrasentia_sensors::FullGPS_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::terrasentia_sensors::FullGPS_<ContainerAllocator> >
{
  static const char* value()
  {
    return "a4814892bb65a4b84a2387a8921c026e";
  }

  static const char* value(const ::terrasentia_sensors::FullGPS_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xa4814892bb65a4b8ULL;
  static const uint64_t static_value2 = 0x4a2387a8921c026eULL;
};

template<class ContainerAllocator>
struct DataType< ::terrasentia_sensors::FullGPS_<ContainerAllocator> >
{
  static const char* value()
  {
    return "terrasentia_sensors/FullGPS";
  }

  static const char* value(const ::terrasentia_sensors::FullGPS_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::terrasentia_sensors::FullGPS_<ContainerAllocator> >
{
  static const char* value()
  {
    return "std_msgs/Header header\n"
"float64 latitude\n"
"float64 longitude\n"
"float32 altitude\n"
"float32 heading\n"
"float32 heading_accuracy\n"
"float32 horizontal_accuracy\n"
"float32 speed_east\n"
"float32 speed_north\n"
"float32 speed_accuracy\n"
"float32 read_timestamp\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
;
  }

  static const char* value(const ::terrasentia_sensors::FullGPS_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::terrasentia_sensors::FullGPS_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.latitude);
      stream.next(m.longitude);
      stream.next(m.altitude);
      stream.next(m.heading);
      stream.next(m.heading_accuracy);
      stream.next(m.horizontal_accuracy);
      stream.next(m.speed_east);
      stream.next(m.speed_north);
      stream.next(m.speed_accuracy);
      stream.next(m.read_timestamp);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct FullGPS_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::terrasentia_sensors::FullGPS_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::terrasentia_sensors::FullGPS_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "latitude: ";
    Printer<double>::stream(s, indent + "  ", v.latitude);
    s << indent << "longitude: ";
    Printer<double>::stream(s, indent + "  ", v.longitude);
    s << indent << "altitude: ";
    Printer<float>::stream(s, indent + "  ", v.altitude);
    s << indent << "heading: ";
    Printer<float>::stream(s, indent + "  ", v.heading);
    s << indent << "heading_accuracy: ";
    Printer<float>::stream(s, indent + "  ", v.heading_accuracy);
    s << indent << "horizontal_accuracy: ";
    Printer<float>::stream(s, indent + "  ", v.horizontal_accuracy);
    s << indent << "speed_east: ";
    Printer<float>::stream(s, indent + "  ", v.speed_east);
    s << indent << "speed_north: ";
    Printer<float>::stream(s, indent + "  ", v.speed_north);
    s << indent << "speed_accuracy: ";
    Printer<float>::stream(s, indent + "  ", v.speed_accuracy);
    s << indent << "read_timestamp: ";
    Printer<float>::stream(s, indent + "  ", v.read_timestamp);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TERRASENTIA_SENSORS_MESSAGE_FULLGPS_H
