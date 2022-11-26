; Auto-generated. Do not edit!


(cl:in-package terrasentia_sensors-msg)


;//! \htmlinclude Terra_XYZ_Data.msg.html

(cl:defclass <Terra_XYZ_Data> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (z
    :reader z
    :initarg :z
    :type cl:float
    :initform 0.0)
   (covariance
    :reader covariance
    :initarg :covariance
    :type terrasentia_sensors-msg:XYZ_Base
    :initform (cl:make-instance 'terrasentia_sensors-msg:XYZ_Base))
   (bias
    :reader bias
    :initarg :bias
    :type terrasentia_sensors-msg:XYZ_Base
    :initform (cl:make-instance 'terrasentia_sensors-msg:XYZ_Base))
   (offset
    :reader offset
    :initarg :offset
    :type terrasentia_sensors-msg:XYZ_Base
    :initform (cl:make-instance 'terrasentia_sensors-msg:XYZ_Base)))
)

(cl:defclass Terra_XYZ_Data (<Terra_XYZ_Data>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Terra_XYZ_Data>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Terra_XYZ_Data)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name terrasentia_sensors-msg:<Terra_XYZ_Data> is deprecated: use terrasentia_sensors-msg:Terra_XYZ_Data instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <Terra_XYZ_Data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader terrasentia_sensors-msg:x-val is deprecated.  Use terrasentia_sensors-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <Terra_XYZ_Data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader terrasentia_sensors-msg:y-val is deprecated.  Use terrasentia_sensors-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'z-val :lambda-list '(m))
(cl:defmethod z-val ((m <Terra_XYZ_Data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader terrasentia_sensors-msg:z-val is deprecated.  Use terrasentia_sensors-msg:z instead.")
  (z m))

(cl:ensure-generic-function 'covariance-val :lambda-list '(m))
(cl:defmethod covariance-val ((m <Terra_XYZ_Data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader terrasentia_sensors-msg:covariance-val is deprecated.  Use terrasentia_sensors-msg:covariance instead.")
  (covariance m))

(cl:ensure-generic-function 'bias-val :lambda-list '(m))
(cl:defmethod bias-val ((m <Terra_XYZ_Data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader terrasentia_sensors-msg:bias-val is deprecated.  Use terrasentia_sensors-msg:bias instead.")
  (bias m))

(cl:ensure-generic-function 'offset-val :lambda-list '(m))
(cl:defmethod offset-val ((m <Terra_XYZ_Data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader terrasentia_sensors-msg:offset-val is deprecated.  Use terrasentia_sensors-msg:offset instead.")
  (offset m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Terra_XYZ_Data>) ostream)
  "Serializes a message object of type '<Terra_XYZ_Data>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'covariance) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'bias) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'offset) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Terra_XYZ_Data>) istream)
  "Deserializes a message object of type '<Terra_XYZ_Data>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'z) (roslisp-utils:decode-double-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'covariance) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'bias) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'offset) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Terra_XYZ_Data>)))
  "Returns string type for a message object of type '<Terra_XYZ_Data>"
  "terrasentia_sensors/Terra_XYZ_Data")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Terra_XYZ_Data)))
  "Returns string type for a message object of type 'Terra_XYZ_Data"
  "terrasentia_sensors/Terra_XYZ_Data")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Terra_XYZ_Data>)))
  "Returns md5sum for a message object of type '<Terra_XYZ_Data>"
  "513fdfd0e6bee20a157cc975187a992e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Terra_XYZ_Data)))
  "Returns md5sum for a message object of type 'Terra_XYZ_Data"
  "513fdfd0e6bee20a157cc975187a992e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Terra_XYZ_Data>)))
  "Returns full string definition for message of type '<Terra_XYZ_Data>"
  (cl:format cl:nil "float64 x~%float64 y~%float64 z~%XYZ_Base covariance~%XYZ_Base bias~%XYZ_Base offset~%~%================================================================================~%MSG: terrasentia_sensors/XYZ_Base~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Terra_XYZ_Data)))
  "Returns full string definition for message of type 'Terra_XYZ_Data"
  (cl:format cl:nil "float64 x~%float64 y~%float64 z~%XYZ_Base covariance~%XYZ_Base bias~%XYZ_Base offset~%~%================================================================================~%MSG: terrasentia_sensors/XYZ_Base~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Terra_XYZ_Data>))
  (cl:+ 0
     8
     8
     8
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'covariance))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'bias))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'offset))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Terra_XYZ_Data>))
  "Converts a ROS message object to a list"
  (cl:list 'Terra_XYZ_Data
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':z (z msg))
    (cl:cons ':covariance (covariance msg))
    (cl:cons ':bias (bias msg))
    (cl:cons ':offset (offset msg))
))
