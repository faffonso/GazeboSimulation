;; Auto-generated. Do not edit!


(when (boundp 'terrasentia_sensors::FourWD)
  (if (not (find-package "TERRASENTIA_SENSORS"))
    (make-package "TERRASENTIA_SENSORS"))
  (shadow 'FourWD (find-package "TERRASENTIA_SENSORS")))
(unless (find-package "TERRASENTIA_SENSORS::FOURWD")
  (make-package "TERRASENTIA_SENSORS::FOURWD"))

(in-package "ROS")
;;//! \htmlinclude FourWD.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass terrasentia_sensors::FourWD
  :super ros::object
  :slots (_header _front_left _front_right _back_left _back_right _read_timestamp ))

(defmethod terrasentia_sensors::FourWD
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:front_left __front_left) (instance terrasentia_sensors::Motor :init))
    ((:front_right __front_right) (instance terrasentia_sensors::Motor :init))
    ((:back_left __back_left) (instance terrasentia_sensors::Motor :init))
    ((:back_right __back_right) (instance terrasentia_sensors::Motor :init))
    ((:read_timestamp __read_timestamp) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _front_left __front_left)
   (setq _front_right __front_right)
   (setq _back_left __back_left)
   (setq _back_right __back_right)
   (setq _read_timestamp (float __read_timestamp))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:front_left
   (&rest __front_left)
   (if (keywordp (car __front_left))
       (send* _front_left __front_left)
     (progn
       (if __front_left (setq _front_left (car __front_left)))
       _front_left)))
  (:front_right
   (&rest __front_right)
   (if (keywordp (car __front_right))
       (send* _front_right __front_right)
     (progn
       (if __front_right (setq _front_right (car __front_right)))
       _front_right)))
  (:back_left
   (&rest __back_left)
   (if (keywordp (car __back_left))
       (send* _back_left __back_left)
     (progn
       (if __back_left (setq _back_left (car __back_left)))
       _back_left)))
  (:back_right
   (&rest __back_right)
   (if (keywordp (car __back_right))
       (send* _back_right __back_right)
     (progn
       (if __back_right (setq _back_right (car __back_right)))
       _back_right)))
  (:read_timestamp
   (&optional __read_timestamp)
   (if __read_timestamp (setq _read_timestamp __read_timestamp)) _read_timestamp)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; terrasentia_sensors/Motor _front_left
    (send _front_left :serialization-length)
    ;; terrasentia_sensors/Motor _front_right
    (send _front_right :serialization-length)
    ;; terrasentia_sensors/Motor _back_left
    (send _back_left :serialization-length)
    ;; terrasentia_sensors/Motor _back_right
    (send _back_right :serialization-length)
    ;; float32 _read_timestamp
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; terrasentia_sensors/Motor _front_left
       (send _front_left :serialize s)
     ;; terrasentia_sensors/Motor _front_right
       (send _front_right :serialize s)
     ;; terrasentia_sensors/Motor _back_left
       (send _back_left :serialize s)
     ;; terrasentia_sensors/Motor _back_right
       (send _back_right :serialize s)
     ;; float32 _read_timestamp
       (sys::poke _read_timestamp (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; terrasentia_sensors/Motor _front_left
     (send _front_left :deserialize buf ptr-) (incf ptr- (send _front_left :serialization-length))
   ;; terrasentia_sensors/Motor _front_right
     (send _front_right :deserialize buf ptr-) (incf ptr- (send _front_right :serialization-length))
   ;; terrasentia_sensors/Motor _back_left
     (send _back_left :deserialize buf ptr-) (incf ptr- (send _back_left :serialization-length))
   ;; terrasentia_sensors/Motor _back_right
     (send _back_right :deserialize buf ptr-) (incf ptr- (send _back_right :serialization-length))
   ;; float32 _read_timestamp
     (setq _read_timestamp (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get terrasentia_sensors::FourWD :md5sum-) "039fc197805f8cfb1c0f73e3c46ee368")
(setf (get terrasentia_sensors::FourWD :datatype-) "terrasentia_sensors/FourWD")
(setf (get terrasentia_sensors::FourWD :definition-)
      "std_msgs/Header header
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
")



(provide :terrasentia_sensors/FourWD "039fc197805f8cfb1c0f73e3c46ee368")


