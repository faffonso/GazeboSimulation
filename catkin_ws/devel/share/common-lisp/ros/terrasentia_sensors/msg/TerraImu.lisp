; Auto-generated. Do not edit!


(cl:in-package terrasentia_sensors-msg)


;//! \htmlinclude TerraImu.msg.html

(cl:defclass <TerraImu> (roslisp-msg-protocol:ros-message)
  ((accel
    :reader accel
    :initarg :accel
    :type terrasentia_sensors-msg:Terra_XYZ_Data
    :initform (cl:make-instance 'terrasentia_sensors-msg:Terra_XYZ_Data))
   (gyro
    :reader gyro
    :initarg :gyro
    :type terrasentia_sensors-msg:Terra_XYZ_Data
    :initform (cl:make-instance 'terrasentia_sensors-msg:Terra_XYZ_Data))
   (orientation
    :reader orientation
    :initarg :orientation
    :type terrasentia_sensors-msg:Terra_Orientation_Data
    :initform (cl:make-instance 'terrasentia_sensors-msg:Terra_Orientation_Data)))
)

(cl:defclass TerraImu (<TerraImu>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TerraImu>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TerraImu)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name terrasentia_sensors-msg:<TerraImu> is deprecated: use terrasentia_sensors-msg:TerraImu instead.")))

(cl:ensure-generic-function 'accel-val :lambda-list '(m))
(cl:defmethod accel-val ((m <TerraImu>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader terrasentia_sensors-msg:accel-val is deprecated.  Use terrasentia_sensors-msg:accel instead.")
  (accel m))

(cl:ensure-generic-function 'gyro-val :lambda-list '(m))
(cl:defmethod gyro-val ((m <TerraImu>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader terrasentia_sensors-msg:gyro-val is deprecated.  Use terrasentia_sensors-msg:gyro instead.")
  (gyro m))

(cl:ensure-generic-function 'orientation-val :lambda-list '(m))
(cl:defmethod orientation-val ((m <TerraImu>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader terrasentia_sensors-msg:orientation-val is deprecated.  Use terrasentia_sensors-msg:orientation instead.")
  (orientation m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TerraImu>) ostream)
  "Serializes a message object of type '<TerraImu>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'accel) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'gyro) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'orientation) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TerraImu>) istream)
  "Deserializes a message object of type '<TerraImu>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'accel) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'gyro) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'orientation) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TerraImu>)))
  "Returns string type for a message object of type '<TerraImu>"
  "terrasentia_sensors/TerraImu")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TerraImu)))
  "Returns string type for a message object of type 'TerraImu"
  "terrasentia_sensors/TerraImu")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TerraImu>)))
  "Returns md5sum for a message object of type '<TerraImu>"
  "8ae412fe3901bdc7584ffe78434df649")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TerraImu)))
  "Returns md5sum for a message object of type 'TerraImu"
  "8ae412fe3901bdc7584ffe78434df649")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TerraImu>)))
  "Returns full string definition for message of type '<TerraImu>"
  (cl:format cl:nil "Terra_XYZ_Data accel~%Terra_XYZ_Data gyro~%Terra_Orientation_Data orientation~%~%================================================================================~%MSG: terrasentia_sensors/Terra_XYZ_Data~%float64 x~%float64 y~%float64 z~%XYZ_Base covariance~%XYZ_Base bias~%XYZ_Base offset~%~%================================================================================~%MSG: terrasentia_sensors/XYZ_Base~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: terrasentia_sensors/Terra_Orientation_Data~%float64 x~%float64 y~%float64 z~%float64 w~%Euler_Base covariance~%Quaternion_Base bias~%~%================================================================================~%MSG: terrasentia_sensors/Euler_Base~%float64 roll~%float64 pitch~%float64 yaw~%~%================================================================================~%MSG: terrasentia_sensors/Quaternion_Base~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TerraImu)))
  "Returns full string definition for message of type 'TerraImu"
  (cl:format cl:nil "Terra_XYZ_Data accel~%Terra_XYZ_Data gyro~%Terra_Orientation_Data orientation~%~%================================================================================~%MSG: terrasentia_sensors/Terra_XYZ_Data~%float64 x~%float64 y~%float64 z~%XYZ_Base covariance~%XYZ_Base bias~%XYZ_Base offset~%~%================================================================================~%MSG: terrasentia_sensors/XYZ_Base~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: terrasentia_sensors/Terra_Orientation_Data~%float64 x~%float64 y~%float64 z~%float64 w~%Euler_Base covariance~%Quaternion_Base bias~%~%================================================================================~%MSG: terrasentia_sensors/Euler_Base~%float64 roll~%float64 pitch~%float64 yaw~%~%================================================================================~%MSG: terrasentia_sensors/Quaternion_Base~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TerraImu>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'accel))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'gyro))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'orientation))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TerraImu>))
  "Converts a ROS message object to a list"
  (cl:list 'TerraImu
    (cl:cons ':accel (accel msg))
    (cl:cons ':gyro (gyro msg))
    (cl:cons ':orientation (orientation msg))
))
