; Auto-generated. Do not edit!


(cl:in-package terrasentia_sensors-msg)


;//! \htmlinclude FourWD.msg.html

(cl:defclass <FourWD> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (front_left
    :reader front_left
    :initarg :front_left
    :type terrasentia_sensors-msg:Motor
    :initform (cl:make-instance 'terrasentia_sensors-msg:Motor))
   (front_right
    :reader front_right
    :initarg :front_right
    :type terrasentia_sensors-msg:Motor
    :initform (cl:make-instance 'terrasentia_sensors-msg:Motor))
   (back_left
    :reader back_left
    :initarg :back_left
    :type terrasentia_sensors-msg:Motor
    :initform (cl:make-instance 'terrasentia_sensors-msg:Motor))
   (back_right
    :reader back_right
    :initarg :back_right
    :type terrasentia_sensors-msg:Motor
    :initform (cl:make-instance 'terrasentia_sensors-msg:Motor))
   (read_timestamp
    :reader read_timestamp
    :initarg :read_timestamp
    :type cl:float
    :initform 0.0))
)

(cl:defclass FourWD (<FourWD>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FourWD>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FourWD)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name terrasentia_sensors-msg:<FourWD> is deprecated: use terrasentia_sensors-msg:FourWD instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <FourWD>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader terrasentia_sensors-msg:header-val is deprecated.  Use terrasentia_sensors-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'front_left-val :lambda-list '(m))
(cl:defmethod front_left-val ((m <FourWD>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader terrasentia_sensors-msg:front_left-val is deprecated.  Use terrasentia_sensors-msg:front_left instead.")
  (front_left m))

(cl:ensure-generic-function 'front_right-val :lambda-list '(m))
(cl:defmethod front_right-val ((m <FourWD>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader terrasentia_sensors-msg:front_right-val is deprecated.  Use terrasentia_sensors-msg:front_right instead.")
  (front_right m))

(cl:ensure-generic-function 'back_left-val :lambda-list '(m))
(cl:defmethod back_left-val ((m <FourWD>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader terrasentia_sensors-msg:back_left-val is deprecated.  Use terrasentia_sensors-msg:back_left instead.")
  (back_left m))

(cl:ensure-generic-function 'back_right-val :lambda-list '(m))
(cl:defmethod back_right-val ((m <FourWD>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader terrasentia_sensors-msg:back_right-val is deprecated.  Use terrasentia_sensors-msg:back_right instead.")
  (back_right m))

(cl:ensure-generic-function 'read_timestamp-val :lambda-list '(m))
(cl:defmethod read_timestamp-val ((m <FourWD>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader terrasentia_sensors-msg:read_timestamp-val is deprecated.  Use terrasentia_sensors-msg:read_timestamp instead.")
  (read_timestamp m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FourWD>) ostream)
  "Serializes a message object of type '<FourWD>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'front_left) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'front_right) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'back_left) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'back_right) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'read_timestamp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FourWD>) istream)
  "Deserializes a message object of type '<FourWD>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'front_left) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'front_right) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'back_left) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'back_right) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'read_timestamp) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FourWD>)))
  "Returns string type for a message object of type '<FourWD>"
  "terrasentia_sensors/FourWD")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FourWD)))
  "Returns string type for a message object of type 'FourWD"
  "terrasentia_sensors/FourWD")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FourWD>)))
  "Returns md5sum for a message object of type '<FourWD>"
  "039fc197805f8cfb1c0f73e3c46ee368")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FourWD)))
  "Returns md5sum for a message object of type 'FourWD"
  "039fc197805f8cfb1c0f73e3c46ee368")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FourWD>)))
  "Returns full string definition for message of type '<FourWD>"
  (cl:format cl:nil "std_msgs/Header header~%terrasentia_sensors/Motor front_left~%terrasentia_sensors/Motor front_right~%terrasentia_sensors/Motor back_left~%terrasentia_sensors/Motor back_right~%float32 read_timestamp~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: terrasentia_sensors/Motor~%bool status~%float32 current~%float32 linear_speed~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FourWD)))
  "Returns full string definition for message of type 'FourWD"
  (cl:format cl:nil "std_msgs/Header header~%terrasentia_sensors/Motor front_left~%terrasentia_sensors/Motor front_right~%terrasentia_sensors/Motor back_left~%terrasentia_sensors/Motor back_right~%float32 read_timestamp~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: terrasentia_sensors/Motor~%bool status~%float32 current~%float32 linear_speed~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FourWD>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'front_left))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'front_right))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'back_left))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'back_right))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FourWD>))
  "Converts a ROS message object to a list"
  (cl:list 'FourWD
    (cl:cons ':header (header msg))
    (cl:cons ':front_left (front_left msg))
    (cl:cons ':front_right (front_right msg))
    (cl:cons ':back_left (back_left msg))
    (cl:cons ':back_right (back_right msg))
    (cl:cons ':read_timestamp (read_timestamp msg))
))
