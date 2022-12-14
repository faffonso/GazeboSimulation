// Generated by gencpp from file terrasentia_sensors/TerraImu.msg
// DO NOT EDIT!


#ifndef TERRASENTIA_SENSORS_MESSAGE_TERRAIMU_H
#define TERRASENTIA_SENSORS_MESSAGE_TERRAIMU_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <terrasentia_sensors/Terra_XYZ_Data.h>
#include <terrasentia_sensors/Terra_XYZ_Data.h>
#include <terrasentia_sensors/Terra_Orientation_Data.h>

namespace terrasentia_sensors
{
template <class ContainerAllocator>
struct TerraImu_
{
  typedef TerraImu_<ContainerAllocator> Type;

  TerraImu_()
    : accel()
    , gyro()
    , orientation()  {
    }
  TerraImu_(const ContainerAllocator& _alloc)
    : accel(_alloc)
    , gyro(_alloc)
    , orientation(_alloc)  {
  (void)_alloc;
    }



   typedef  ::terrasentia_sensors::Terra_XYZ_Data_<ContainerAllocator>  _accel_type;
  _accel_type accel;

   typedef  ::terrasentia_sensors::Terra_XYZ_Data_<ContainerAllocator>  _gyro_type;
  _gyro_type gyro;

   typedef  ::terrasentia_sensors::Terra_Orientation_Data_<ContainerAllocator>  _orientation_type;
  _orientation_type orientation;





  typedef boost::shared_ptr< ::terrasentia_sensors::TerraImu_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::terrasentia_sensors::TerraImu_<ContainerAllocator> const> ConstPtr;

}; // struct TerraImu_

typedef ::terrasentia_sensors::TerraImu_<std::allocator<void> > TerraImu;

typedef boost::shared_ptr< ::terrasentia_sensors::TerraImu > TerraImuPtr;
typedef boost::shared_ptr< ::terrasentia_sensors::TerraImu const> TerraImuConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::terrasentia_sensors::TerraImu_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::terrasentia_sensors::TerraImu_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::terrasentia_sensors::TerraImu_<ContainerAllocator1> & lhs, const ::terrasentia_sensors::TerraImu_<ContainerAllocator2> & rhs)
{
  return lhs.accel == rhs.accel &&
    lhs.gyro == rhs.gyro &&
    lhs.orientation == rhs.orientation;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::terrasentia_sensors::TerraImu_<ContainerAllocator1> & lhs, const ::terrasentia_sensors::TerraImu_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace terrasentia_sensors

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::terrasentia_sensors::TerraImu_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::terrasentia_sensors::TerraImu_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::terrasentia_sensors::TerraImu_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::terrasentia_sensors::TerraImu_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::terrasentia_sensors::TerraImu_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::terrasentia_sensors::TerraImu_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::terrasentia_sensors::TerraImu_<ContainerAllocator> >
{
  static const char* value()
  {
    return "8ae412fe3901bdc7584ffe78434df649";
  }

  static const char* value(const ::terrasentia_sensors::TerraImu_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x8ae412fe3901bdc7ULL;
  static const uint64_t static_value2 = 0x584ffe78434df649ULL;
};

template<class ContainerAllocator>
struct DataType< ::terrasentia_sensors::TerraImu_<ContainerAllocator> >
{
  static const char* value()
  {
    return "terrasentia_sensors/TerraImu";
  }

  static const char* value(const ::terrasentia_sensors::TerraImu_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::terrasentia_sensors::TerraImu_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Terra_XYZ_Data accel\n"
"Terra_XYZ_Data gyro\n"
"Terra_Orientation_Data orientation\n"
"\n"
"================================================================================\n"
"MSG: terrasentia_sensors/Terra_XYZ_Data\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"XYZ_Base covariance\n"
"XYZ_Base bias\n"
"XYZ_Base offset\n"
"\n"
"================================================================================\n"
"MSG: terrasentia_sensors/XYZ_Base\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"\n"
"================================================================================\n"
"MSG: terrasentia_sensors/Terra_Orientation_Data\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"float64 w\n"
"Euler_Base covariance\n"
"Quaternion_Base bias\n"
"\n"
"================================================================================\n"
"MSG: terrasentia_sensors/Euler_Base\n"
"float64 roll\n"
"float64 pitch\n"
"float64 yaw\n"
"\n"
"================================================================================\n"
"MSG: terrasentia_sensors/Quaternion_Base\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"float64 w\n"
;
  }

  static const char* value(const ::terrasentia_sensors::TerraImu_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::terrasentia_sensors::TerraImu_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.accel);
      stream.next(m.gyro);
      stream.next(m.orientation);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct TerraImu_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::terrasentia_sensors::TerraImu_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::terrasentia_sensors::TerraImu_<ContainerAllocator>& v)
  {
    s << indent << "accel: ";
    s << std::endl;
    Printer< ::terrasentia_sensors::Terra_XYZ_Data_<ContainerAllocator> >::stream(s, indent + "  ", v.accel);
    s << indent << "gyro: ";
    s << std::endl;
    Printer< ::terrasentia_sensors::Terra_XYZ_Data_<ContainerAllocator> >::stream(s, indent + "  ", v.gyro);
    s << indent << "orientation: ";
    s << std::endl;
    Printer< ::terrasentia_sensors::Terra_Orientation_Data_<ContainerAllocator> >::stream(s, indent + "  ", v.orientation);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TERRASENTIA_SENSORS_MESSAGE_TERRAIMU_H
