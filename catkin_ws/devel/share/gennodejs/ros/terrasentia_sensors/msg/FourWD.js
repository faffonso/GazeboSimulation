// Auto-generated. Do not edit!

// (in-package terrasentia_sensors.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Motor = require('./Motor.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class FourWD {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.front_left = null;
      this.front_right = null;
      this.back_left = null;
      this.back_right = null;
      this.read_timestamp = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('front_left')) {
        this.front_left = initObj.front_left
      }
      else {
        this.front_left = new Motor();
      }
      if (initObj.hasOwnProperty('front_right')) {
        this.front_right = initObj.front_right
      }
      else {
        this.front_right = new Motor();
      }
      if (initObj.hasOwnProperty('back_left')) {
        this.back_left = initObj.back_left
      }
      else {
        this.back_left = new Motor();
      }
      if (initObj.hasOwnProperty('back_right')) {
        this.back_right = initObj.back_right
      }
      else {
        this.back_right = new Motor();
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
    // Serializes a message object of type FourWD
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [front_left]
    bufferOffset = Motor.serialize(obj.front_left, buffer, bufferOffset);
    // Serialize message field [front_right]
    bufferOffset = Motor.serialize(obj.front_right, buffer, bufferOffset);
    // Serialize message field [back_left]
    bufferOffset = Motor.serialize(obj.back_left, buffer, bufferOffset);
    // Serialize message field [back_right]
    bufferOffset = Motor.serialize(obj.back_right, buffer, bufferOffset);
    // Serialize message field [read_timestamp]
    bufferOffset = _serializer.float32(obj.read_timestamp, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FourWD
    let len;
    let data = new FourWD(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [front_left]
    data.front_left = Motor.deserialize(buffer, bufferOffset);
    // Deserialize message field [front_right]
    data.front_right = Motor.deserialize(buffer, bufferOffset);
    // Deserialize message field [back_left]
    data.back_left = Motor.deserialize(buffer, bufferOffset);
    // Deserialize message field [back_right]
    data.back_right = Motor.deserialize(buffer, bufferOffset);
    // Deserialize message field [read_timestamp]
    data.read_timestamp = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 40;
  }

  static datatype() {
    // Returns string type for a message object
    return 'terrasentia_sensors/FourWD';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '039fc197805f8cfb1c0f73e3c46ee368';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
    terrasentia_sensors/Motor front_left
    terrasentia_sensors/Motor front_right
    terrasentia_sensors/Motor back_left
    terrasentia_sensors/Motor back_right
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
    
    ================================================================================
    MSG: terrasentia_sensors/Motor
    bool status
    float32 current
    float32 linear_speed
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new FourWD(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.front_left !== undefined) {
      resolved.front_left = Motor.Resolve(msg.front_left)
    }
    else {
      resolved.front_left = new Motor()
    }

    if (msg.front_right !== undefined) {
      resolved.front_right = Motor.Resolve(msg.front_right)
    }
    else {
      resolved.front_right = new Motor()
    }

    if (msg.back_left !== undefined) {
      resolved.back_left = Motor.Resolve(msg.back_left)
    }
    else {
      resolved.back_left = new Motor()
    }

    if (msg.back_right !== undefined) {
      resolved.back_right = Motor.Resolve(msg.back_right)
    }
    else {
      resolved.back_right = new Motor()
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

module.exports = FourWD;
