# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from terrasentia_sensors/TerraImu.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import terrasentia_sensors.msg

class TerraImu(genpy.Message):
  _md5sum = "8ae412fe3901bdc7584ffe78434df649"
  _type = "terrasentia_sensors/TerraImu"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """Terra_XYZ_Data accel
Terra_XYZ_Data gyro
Terra_Orientation_Data orientation

================================================================================
MSG: terrasentia_sensors/Terra_XYZ_Data
float64 x
float64 y
float64 z
XYZ_Base covariance
XYZ_Base bias
XYZ_Base offset

================================================================================
MSG: terrasentia_sensors/XYZ_Base
float64 x
float64 y
float64 z

================================================================================
MSG: terrasentia_sensors/Terra_Orientation_Data
float64 x
float64 y
float64 z
float64 w
Euler_Base covariance
Quaternion_Base bias

================================================================================
MSG: terrasentia_sensors/Euler_Base
float64 roll
float64 pitch
float64 yaw

================================================================================
MSG: terrasentia_sensors/Quaternion_Base
float64 x
float64 y
float64 z
float64 w
"""
  __slots__ = ['accel','gyro','orientation']
  _slot_types = ['terrasentia_sensors/Terra_XYZ_Data','terrasentia_sensors/Terra_XYZ_Data','terrasentia_sensors/Terra_Orientation_Data']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       accel,gyro,orientation

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(TerraImu, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.accel is None:
        self.accel = terrasentia_sensors.msg.Terra_XYZ_Data()
      if self.gyro is None:
        self.gyro = terrasentia_sensors.msg.Terra_XYZ_Data()
      if self.orientation is None:
        self.orientation = terrasentia_sensors.msg.Terra_Orientation_Data()
    else:
      self.accel = terrasentia_sensors.msg.Terra_XYZ_Data()
      self.gyro = terrasentia_sensors.msg.Terra_XYZ_Data()
      self.orientation = terrasentia_sensors.msg.Terra_Orientation_Data()

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_35d().pack(_x.accel.x, _x.accel.y, _x.accel.z, _x.accel.covariance.x, _x.accel.covariance.y, _x.accel.covariance.z, _x.accel.bias.x, _x.accel.bias.y, _x.accel.bias.z, _x.accel.offset.x, _x.accel.offset.y, _x.accel.offset.z, _x.gyro.x, _x.gyro.y, _x.gyro.z, _x.gyro.covariance.x, _x.gyro.covariance.y, _x.gyro.covariance.z, _x.gyro.bias.x, _x.gyro.bias.y, _x.gyro.bias.z, _x.gyro.offset.x, _x.gyro.offset.y, _x.gyro.offset.z, _x.orientation.x, _x.orientation.y, _x.orientation.z, _x.orientation.w, _x.orientation.covariance.roll, _x.orientation.covariance.pitch, _x.orientation.covariance.yaw, _x.orientation.bias.x, _x.orientation.bias.y, _x.orientation.bias.z, _x.orientation.bias.w))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.accel is None:
        self.accel = terrasentia_sensors.msg.Terra_XYZ_Data()
      if self.gyro is None:
        self.gyro = terrasentia_sensors.msg.Terra_XYZ_Data()
      if self.orientation is None:
        self.orientation = terrasentia_sensors.msg.Terra_Orientation_Data()
      end = 0
      _x = self
      start = end
      end += 280
      (_x.accel.x, _x.accel.y, _x.accel.z, _x.accel.covariance.x, _x.accel.covariance.y, _x.accel.covariance.z, _x.accel.bias.x, _x.accel.bias.y, _x.accel.bias.z, _x.accel.offset.x, _x.accel.offset.y, _x.accel.offset.z, _x.gyro.x, _x.gyro.y, _x.gyro.z, _x.gyro.covariance.x, _x.gyro.covariance.y, _x.gyro.covariance.z, _x.gyro.bias.x, _x.gyro.bias.y, _x.gyro.bias.z, _x.gyro.offset.x, _x.gyro.offset.y, _x.gyro.offset.z, _x.orientation.x, _x.orientation.y, _x.orientation.z, _x.orientation.w, _x.orientation.covariance.roll, _x.orientation.covariance.pitch, _x.orientation.covariance.yaw, _x.orientation.bias.x, _x.orientation.bias.y, _x.orientation.bias.z, _x.orientation.bias.w,) = _get_struct_35d().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_35d().pack(_x.accel.x, _x.accel.y, _x.accel.z, _x.accel.covariance.x, _x.accel.covariance.y, _x.accel.covariance.z, _x.accel.bias.x, _x.accel.bias.y, _x.accel.bias.z, _x.accel.offset.x, _x.accel.offset.y, _x.accel.offset.z, _x.gyro.x, _x.gyro.y, _x.gyro.z, _x.gyro.covariance.x, _x.gyro.covariance.y, _x.gyro.covariance.z, _x.gyro.bias.x, _x.gyro.bias.y, _x.gyro.bias.z, _x.gyro.offset.x, _x.gyro.offset.y, _x.gyro.offset.z, _x.orientation.x, _x.orientation.y, _x.orientation.z, _x.orientation.w, _x.orientation.covariance.roll, _x.orientation.covariance.pitch, _x.orientation.covariance.yaw, _x.orientation.bias.x, _x.orientation.bias.y, _x.orientation.bias.z, _x.orientation.bias.w))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.accel is None:
        self.accel = terrasentia_sensors.msg.Terra_XYZ_Data()
      if self.gyro is None:
        self.gyro = terrasentia_sensors.msg.Terra_XYZ_Data()
      if self.orientation is None:
        self.orientation = terrasentia_sensors.msg.Terra_Orientation_Data()
      end = 0
      _x = self
      start = end
      end += 280
      (_x.accel.x, _x.accel.y, _x.accel.z, _x.accel.covariance.x, _x.accel.covariance.y, _x.accel.covariance.z, _x.accel.bias.x, _x.accel.bias.y, _x.accel.bias.z, _x.accel.offset.x, _x.accel.offset.y, _x.accel.offset.z, _x.gyro.x, _x.gyro.y, _x.gyro.z, _x.gyro.covariance.x, _x.gyro.covariance.y, _x.gyro.covariance.z, _x.gyro.bias.x, _x.gyro.bias.y, _x.gyro.bias.z, _x.gyro.offset.x, _x.gyro.offset.y, _x.gyro.offset.z, _x.orientation.x, _x.orientation.y, _x.orientation.z, _x.orientation.w, _x.orientation.covariance.roll, _x.orientation.covariance.pitch, _x.orientation.covariance.yaw, _x.orientation.bias.x, _x.orientation.bias.y, _x.orientation.bias.z, _x.orientation.bias.w,) = _get_struct_35d().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_35d = None
def _get_struct_35d():
    global _struct_35d
    if _struct_35d is None:
        _struct_35d = struct.Struct("<35d")
    return _struct_35d
