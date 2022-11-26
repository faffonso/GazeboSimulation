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

class TerraGps {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.time = null;
      this.latitude = null;
      this.longitude = null;
      this.altitude = null;
      this.reference_latitude = null;
      this.reference_longitude = null;
      this.reference_altitude = null;
      this.reference_heading = null;
      this.velocity = null;
      this.covariance = null;
      this.covariance_type = null;
      this.service = null;
      this.status = null;
    }
    else {
      if (initObj.hasOwnProperty('time')) {
        this.time = initObj.time
      }
      else {
        this.time = 0.0;
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
      if (initObj.hasOwnProperty('reference_latitude')) {
        this.reference_latitude = initObj.reference_latitude
      }
      else {
        this.reference_latitude = 0.0;
      }
      if (initObj.hasOwnProperty('reference_longitude')) {
        this.reference_longitude = initObj.reference_longitude
      }
      else {
        this.reference_longitude = 0.0;
      }
      if (initObj.hasOwnProperty('reference_altitude')) {
        this.reference_altitude = initObj.reference_altitude
      }
      else {
        this.reference_altitude = 0.0;
      }
      if (initObj.hasOwnProperty('reference_heading')) {
        this.reference_heading = initObj.reference_heading
      }
      else {
        this.reference_heading = 0.0;
      }
      if (initObj.hasOwnProperty('velocity')) {
        this.velocity = initObj.velocity
      }
      else {
        this.velocity = new XYZ_Base();
      }
      if (initObj.hasOwnProperty('covariance')) {
        this.covariance = initObj.covariance
      }
      else {
        this.covariance = new XYZ_Base();
      }
      if (initObj.hasOwnProperty('covariance_type')) {
        this.covariance_type = initObj.covariance_type
      }
      else {
        this.covariance_type = 0;
      }
      if (initObj.hasOwnProperty('service')) {
        this.service = initObj.service
      }
      else {
        this.service = 0;
      }
      if (initObj.hasOwnProperty('status')) {
        this.status = initObj.status
      }
      else {
        this.status = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TerraGps
    // Serialize message field [time]
    bufferOffset = _serializer.float64(obj.time, buffer, bufferOffset);
    // Serialize message field [latitude]
    bufferOffset = _serializer.float64(obj.latitude, buffer, bufferOffset);
    // Serialize message field [longitude]
    bufferOffset = _serializer.float64(obj.longitude, buffer, bufferOffset);
    // Serialize message field [altitude]
    bufferOffset = _serializer.float64(obj.altitude, buffer, bufferOffset);
    // Serialize message field [reference_latitude]
    bufferOffset = _serializer.float64(obj.reference_latitude, buffer, bufferOffset);
    // Serialize message field [reference_longitude]
    bufferOffset = _serializer.float64(obj.reference_longitude, buffer, bufferOffset);
    // Serialize message field [reference_altitude]
    bufferOffset = _serializer.float64(obj.reference_altitude, buffer, bufferOffset);
    // Serialize message field [reference_heading]
    bufferOffset = _serializer.float64(obj.reference_heading, buffer, bufferOffset);
    // Serialize message field [velocity]
    bufferOffset = XYZ_Base.serialize(obj.velocity, buffer, bufferOffset);
    // Serialize message field [covariance]
    bufferOffset = XYZ_Base.serialize(obj.covariance, buffer, bufferOffset);
    // Serialize message field [covariance_type]
    bufferOffset = _serializer.uint8(obj.covariance_type, buffer, bufferOffset);
    // Serialize message field [service]
    bufferOffset = _serializer.uint16(obj.service, buffer, bufferOffset);
    // Serialize message field [status]
    bufferOffset = _serializer.int8(obj.status, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TerraGps
    let len;
    let data = new TerraGps(null);
    // Deserialize message field [time]
    data.time = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [latitude]
    data.latitude = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [longitude]
    data.longitude = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [altitude]
    data.altitude = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [reference_latitude]
    data.reference_latitude = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [reference_longitude]
    data.reference_longitude = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [reference_altitude]
    data.reference_altitude = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [reference_heading]
    data.reference_heading = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [velocity]
    data.velocity = XYZ_Base.deserialize(buffer, bufferOffset);
    // Deserialize message field [covariance]
    data.covariance = XYZ_Base.deserialize(buffer, bufferOffset);
    // Deserialize message field [covariance_type]
    data.covariance_type = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [service]
    data.service = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [status]
    data.status = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 116;
  }

  static datatype() {
    // Returns string type for a message object
    return 'terrasentia_sensors/TerraGps';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b34d8639cf3adf476f2bee63f46d8e96';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 time
    float64 latitude
    float64 longitude
    float64 altitude
    float64 reference_latitude
    float64 reference_longitude
    float64 reference_altitude
    float64 reference_heading
    XYZ_Base velocity
    XYZ_Base covariance
    uint8 covariance_type
    uint16 service
    int8 status
    
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
    const resolved = new TerraGps(null);
    if (msg.time !== undefined) {
      resolved.time = msg.time;
    }
    else {
      resolved.time = 0.0
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

    if (msg.reference_latitude !== undefined) {
      resolved.reference_latitude = msg.reference_latitude;
    }
    else {
      resolved.reference_latitude = 0.0
    }

    if (msg.reference_longitude !== undefined) {
      resolved.reference_longitude = msg.reference_longitude;
    }
    else {
      resolved.reference_longitude = 0.0
    }

    if (msg.reference_altitude !== undefined) {
      resolved.reference_altitude = msg.reference_altitude;
    }
    else {
      resolved.reference_altitude = 0.0
    }

    if (msg.reference_heading !== undefined) {
      resolved.reference_heading = msg.reference_heading;
    }
    else {
      resolved.reference_heading = 0.0
    }

    if (msg.velocity !== undefined) {
      resolved.velocity = XYZ_Base.Resolve(msg.velocity)
    }
    else {
      resolved.velocity = new XYZ_Base()
    }

    if (msg.covariance !== undefined) {
      resolved.covariance = XYZ_Base.Resolve(msg.covariance)
    }
    else {
      resolved.covariance = new XYZ_Base()
    }

    if (msg.covariance_type !== undefined) {
      resolved.covariance_type = msg.covariance_type;
    }
    else {
      resolved.covariance_type = 0
    }

    if (msg.service !== undefined) {
      resolved.service = msg.service;
    }
    else {
      resolved.service = 0
    }

    if (msg.status !== undefined) {
      resolved.status = msg.status;
    }
    else {
      resolved.status = 0
    }

    return resolved;
    }
};

module.exports = TerraGps;
