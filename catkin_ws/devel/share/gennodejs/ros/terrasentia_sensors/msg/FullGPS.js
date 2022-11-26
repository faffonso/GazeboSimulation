// Auto-generated. Do not edit!

// (in-package terrasentia_sensors.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class FullGPS {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.latitude = null;
      this.longitude = null;
      this.altitude = null;
      this.heading = null;
      this.heading_accuracy = null;
      this.horizontal_accuracy = null;
      this.speed_east = null;
      this.speed_north = null;
      this.speed_accuracy = null;
      this.read_timestamp = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('latitude')) {
        this.latitude = initObj.latitude
      }
      else {
        this.latitude = 0.0;
      }
      if (initObj.hasOwnProperty('longitude')) {
        this.longitude = initObj.longitude
      }
      else {
        this.longitude = 0.0;
      }
      if (initObj.hasOwnProperty('altitude')) {
        this.altitude = initObj.altitude
      }
      else {
        this.altitude = 0.0;
      }
      if (initObj.hasOwnProperty('heading')) {
        this.heading = initObj.heading
      }
      else {
        this.heading = 0.0;
      }
      if (initObj.hasOwnProperty('heading_accuracy')) {
        this.heading_accuracy = initObj.heading_accuracy
      }
      else {
        this.heading_accuracy = 0.0;
      }
      if (initObj.hasOwnProperty('horizontal_accuracy')) {
        this.horizontal_accuracy = initObj.horizontal_accuracy
      }
      else {
        this.horizontal_accuracy = 0.0;
      }
      if (initObj.hasOwnProperty('speed_east')) {
        this.speed_east = initObj.speed_east
      }
      else {
        this.speed_east = 0.0;
      }
      if (initObj.hasOwnProperty('speed_north')) {
        this.speed_north = initObj.speed_north
      }
      else {
        this.speed_north = 0.0;
      }
      if (initObj.hasOwnProperty('speed_accuracy')) {
        this.speed_accuracy = initObj.speed_accuracy
      }
      else {
        this.speed_accuracy = 0.0;
      }
      if (initObj.hasOwnProperty('read_timestamp')) {
        this.read_timestamp = initObj.read_timestamp
      }
      else {
        this.read_timestamp = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type FullGPS
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [latitude]
    bufferOffset = _serializer.float64(obj.latitude, buffer, bufferOffset);
    // Serialize message field [longitude]
    bufferOffset = _serializer.float64(obj.longitude, buffer, bufferOffset);
    // Serialize message field [altitude]
    bufferOffset = _serializer.float32(obj.altitude, buffer, bufferOffset);
    // Serialize message field [heading]
    bufferOffset = _serializer.float32(obj.heading, buffer, bufferOffset);
    // Serialize message field [heading_accuracy]
    bufferOffset = _serializer.float32(obj.heading_accuracy, buffer, bufferOffset);
    // Serialize message field [horizontal_accuracy]
    bufferOffset = _serializer.float32(obj.horizontal_accuracy, buffer, bufferOffset);
    // Serialize message field [speed_east]
    bufferOffset = _serializer.float32(obj.speed_east, buffer, bufferOffset);
    // Serialize message field [speed_north]
    bufferOffset = _serializer.float32(obj.speed_north, buffer, bufferOffset);
    // Serialize message field [speed_accuracy]
    bufferOffset = _serializer.float32(obj.speed_accuracy, buffer, bufferOffset);
    // Serialize message field [read_timestamp]
    bufferOffset = _serializer.float32(obj.read_timestamp, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FullGPS
    let len;
    let data = new FullGPS(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [latitude]
    data.latitude = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [longitude]
    data.longitude = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [altitude]
    data.altitude = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [heading]
    data.heading = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [heading_accuracy]
    data.heading_accuracy = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [horizontal_accuracy]
    data.horizontal_accuracy = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [speed_east]
    data.speed_east = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [speed_north]
    data.speed_north = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [speed_accuracy]
    data.speed_accuracy = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [read_timestamp]
    data.read_timestamp = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 48;
  }

  static datatype() {
    // Returns string type for a message object
    return 'terrasentia_sensors/FullGPS';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a4814892bb65a4b84a2387a8921c026e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
    float64 latitude
    float64 longitude
    float32 altitude
    float32 heading
    float32 heading_accuracy
    float32 horizontal_accuracy
    float32 speed_east
    float32 speed_north
    float32 speed_accuracy
    float32 read_timestamp
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new FullGPS(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.latitude !== undefined) {
      resolved.latitude = msg.latitude;
    }
    else {
      resolved.latitude = 0.0
    }

    if (msg.longitude !== undefined) {
      resolved.longitude = msg.longitude;
    }
    else {
      resolved.longitude = 0.0
    }

    if (msg.altitude !== undefined) {
      resolved.altitude = msg.altitude;
    }
    else {
      resolved.altitude = 0.0
    }

    if (msg.heading !== undefined) {
      resolved.heading = msg.heading;
    }
    else {
      resolved.heading = 0.0
    }

    if (msg.heading_accuracy !== undefined) {
      resolved.heading_accuracy = msg.heading_accuracy;
    }
    else {
      resolved.heading_accuracy = 0.0
    }

    if (msg.horizontal_accuracy !== undefined) {
      resolved.horizontal_accuracy = msg.horizontal_accuracy;
    }
    else {
      resolved.horizontal_accuracy = 0.0
    }

    if (msg.speed_east !== undefined) {
      resolved.speed_east = msg.speed_east;
    }
    else {
      resolved.speed_east = 0.0
    }

    if (msg.speed_north !== undefined) {
      resolved.speed_north = msg.speed_north;
    }
    else {
      resolved.speed_north = 0.0
    }

    if (msg.speed_accuracy !== undefined) {
      resolved.speed_accuracy = msg.speed_accuracy;
    }
    else {
      resolved.speed_accuracy = 0.0
    }

    if (msg.read_timestamp !== undefined) {
      resolved.read_timestamp = msg.read_timestamp;
    }
    else {
      resolved.read_timestamp = 0.0
    }

    return resolved;
    }
};

module.exports = FullGPS;
