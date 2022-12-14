; Auto-generated. Do not edit!


(cl:in-package terrasentia_sensors-msg)


;//! \htmlinclude TerraBattery.msg.html

(cl:defclass <TerraBattery> (roslisp-msg-protocol:ros-message)
  ((stamp
    :reader stamp
    :initarg :stamp
    :type cl:real
    :initform 0)
   (voltage
    :reader voltage
    :initarg :voltage
    :type cl:float
    :initform 0.0)
   (vmax
    :reader vmax
    :initarg :vmax
    :type cl:float
    :initform 0.0)
   (vmin
    :reader vmin
    :initarg :vmin
    :type cl:float
    :initform 0.0))
)

(cl:defclass TerraBattery (<TerraBattery>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TerraBattery>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TerraBattery)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name terrasentia_sensors-msg:<TerraBattery> is deprecated: use terrasentia_sensors-msg:TerraBattery instead.")))

(cl:ensure-generic-function 'stamp-val :lambda-list '(m))
(cl:defmethod stamp-val ((m <TerraBattery>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader terrasentia_sensors-msg:stamp-val is deprecated.  Use terrasentia_sensors-msg:stamp instead.")
  (stamp m))

(cl:ensure-generic-function 'voltage-val :lambda-list '(m))
(cl:defmethod voltage-val ((m <TerraBattery>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader terrasentia_sensors-msg:voltage-val is deprecated.  Use terrasentia_sensors-msg:voltage instead.")
  (voltage m))

(cl:ensure-generic-function 'vmax-val :lambda-list '(m))
(cl:defmethod vmax-val ((m <TerraBattery>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader terrasentia_sensors-msg:vmax-val is deprecated.  Use terrasentia_sensors-msg:vmax instead.")
  (vmax m))

(cl:ensure-generic-function 'vmin-val :lambda-list '(m))
(cl:defmethod vmin-val ((m <TerraBattery>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader terrasentia_sensors-msg:vmin-val is deprecated.  Use terrasentia_sensors-msg:vmin instead.")
  (vmin m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TerraBattery>) ostream)
  "Serializes a message object of type '<TerraBattery>"
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'stamp)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'stamp) (cl:floor (cl:slot-value msg 'stamp)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'voltage))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'vmax))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'vmin))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TerraBattery>) istream)
  "Deserializes a message object of type '<TerraBattery>"
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'stamp) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'voltage) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vmax) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vmin) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TerraBattery>)))
  "Returns string type for a message object of type '<TerraBattery>"
  "terrasentia_sensors/TerraBattery")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TerraBattery)))
  "Returns string type for a message object of type 'TerraBattery"
  "terrasentia_sensors/TerraBattery")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TerraBattery>)))
  "Returns md5sum for a message object of type '<TerraBattery>"
  "6a9bbba12ac00a99cf3603ae02c56555")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TerraBattery)))
  "Returns md5sum for a message object of type 'TerraBattery"
  "6a9bbba12ac00a99cf3603ae02c56555")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TerraBattery>)))
  "Returns full string definition for message of type '<TerraBattery>"
  (cl:format cl:nil "time stamp~%float64 voltage~%float64 vmax~%float64 vmin~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TerraBattery)))
  "Returns full string definition for message of type 'TerraBattery"
  (cl:format cl:nil "time stamp~%float64 voltage~%float64 vmax~%float64 vmin~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TerraBattery>))
  (cl:+ 0
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TerraBattery>))
  "Converts a ROS message object to a list"
  (cl:list 'TerraBattery
    (cl:cons ':stamp (stamp msg))
    (cl:cons ':voltage (voltage msg))
    (cl:cons ':vmax (vmax msg))
    (cl:cons ':vmin (vmin msg))
))
