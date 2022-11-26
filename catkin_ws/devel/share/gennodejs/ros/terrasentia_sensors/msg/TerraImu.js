// Auto-generated. Do not edit!

// (in-package terrasentia_sensors.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Terra_XYZ_Data = require('./Terra_XYZ_Data.js');
let Terra_Orientation_Data = require('./Terra_Orientation_Data.js');

//-----------------------------------------------------------

class TerraImu {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.accel = null;
      this.gyro = null;
      this.orientation = null;
    }
    else {
      if (initObj.hasOwnProperty('accel')) {
        this.accel = initObj.accel
      }
      else {
        this.accel = new Terra_XYZ_Data();
      }
      if (initObj.hasOwnProperty('gyro')) {
        this.gyro = initObj.gyro
      }
      else {
        this.gyro = new Terra_XYZ_Data();
      }
      if (initObj.hasOwnProperty('orientation')) {
        this.orientation = initObj.orientation
      }
      else {
        this.orientation = new Terra_Orientation_Data();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TerraImu
    // Serialize message field [accel]
    bufferOffset = Terra_XYZ_Data.serialize(obj.accel, buffer, bufferOffset);
    // Serialize message field [gyro]
    bufferOffset = Terra_XYZ_Data.serialize(obj.gyro, buffer, bufferOffset);
    // Serialize message field [orientation]
    bufferOffset = Terra_Orientation_Data.serialize(obj.orientation, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TerraImu
    let len;
    let data = new TerraImu(null);
    // Deserialize message field [accel]
    data.accel = Terra_XYZ_Data.deserialize(buffer, bufferOffset);
    // Deserialize message field [gyro]
    data.gyro = Terra_XYZ_Data.deserialize(buffer, bufferOffset);
    // Deserialize message field [orientation]
    data.orientation = Terra_Orientation_Data.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 280;
  }

  static datatype() {
    // Returns string type for a message object
    return 'terrasentia_sensors/TerraImu';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8ae412fe3901bdc7584ffe78434df649';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Terra_XYZ_Data accel
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TerraImu(null);
    if (msg.accel !== undefined) {
      resolved.accel = Terra_XYZ_Data.Resolve(msg.accel)
    }
    else {
      resolved.accel = new Terra_XYZ_Data()
    }

    if (msg.gyro !== undefined) {
      resolved.gyro = Terra_XYZ_Data.Resolve(msg.gyro)
    }
    else {
      resolved.gyro = new Terra_XYZ_Data()
    }

    if (msg.orientation !== undefined) {
      resolved.orientation = Terra_Orientation_Data.Resolve(msg.orientation)
    }
    else {
      resolved.orientation = new Terra_Orientation_Data()
    }

    return resolved;
    }
};

module.exports = TerraImu;
