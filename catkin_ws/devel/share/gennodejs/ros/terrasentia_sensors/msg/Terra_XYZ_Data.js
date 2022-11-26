// Auto-generated. Do not edit!

// (in-package terrasentia_sensors.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let XYZ_Base = require('./XYZ_Base.js');

//-----------------------------------------------------------

class Terra_XYZ_Data {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x = null;
      this.y = null;
      this.z = null;
      this.covariance = null;
      this.bias = null;
      this.offset = null;
    }
    else {
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = 0.0;
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = 0.0;
      }
      if (initObj.hasOwnProperty('z')) {
        this.z = initObj.z
      }
      else {
        this.z = 0.0;
      }
      if (initObj.hasOwnProperty('covariance')) {
        this.covariance = initObj.covariance
      }
      else {
        this.covariance = new XYZ_Base();
      }
      if (initObj.hasOwnProperty('bias')) {
        this.bias = initObj.bias
      }
      else {
        this.bias = new XYZ_Base();
      }
      if (initObj.hasOwnProperty('offset')) {
        this.offset = initObj.offset
      }
      else {
        this.offset = new XYZ_Base();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Terra_XYZ_Data
    // Serialize message field [x]
    bufferOffset = _serializer.float64(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.float64(obj.y, buffer, bufferOffset);
    // Serialize message field [z]
    bufferOffset = _serializer.float64(obj.z, buffer, bufferOffset);
    // Serialize message field [covariance]
    bufferOffset = XYZ_Base.serialize(obj.covariance, buffer, bufferOffset);
    // Serialize message field [bias]
    bufferOffset = XYZ_Base.serialize(obj.bias, buffer, bufferOffset);
    // Serialize message field [offset]
    bufferOffset = XYZ_Base.serialize(obj.offset, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Terra_XYZ_Data
    let len;
    let data = new Terra_XYZ_Data(null);
    // Deserialize message field [x]
    data.x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [z]
    data.z = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [covariance]
    data.covariance = XYZ_Base.deserialize(buffer, bufferOffset);
    // Deserialize message field [bias]
    data.bias = XYZ_Base.deserialize(buffer, bufferOffset);
    // Deserialize message field [offset]
    data.offset = XYZ_Base.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 96;
  }

  static datatype() {
    // Returns string type for a message object
    return 'terrasentia_sensors/Terra_XYZ_Data';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '513fdfd0e6bee20a157cc975187a992e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Terra_XYZ_Data(null);
    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = 0.0
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = 0.0
    }

    if (msg.z !== undefined) {
      resolved.z = msg.z;
    }
    else {
      resolved.z = 0.0
    }

    if (msg.covariance !== undefined) {
      resolved.covariance = XYZ_Base.Resolve(msg.covariance)
    }
    else {
      resolved.covariance = new XYZ_Base()
    }

    if (msg.bias !== undefined) {
      resolved.bias = XYZ_Base.Resolve(msg.bias)
    }
    else {
      resolved.bias = new XYZ_Base()
    }

    if (msg.offset !== undefined) {
      resolved.offset = XYZ_Base.Resolve(msg.offset)
    }
    else {
      resolved.offset = new XYZ_Base()
    }

    return resolved;
    }
};

module.exports = Terra_XYZ_Data;
