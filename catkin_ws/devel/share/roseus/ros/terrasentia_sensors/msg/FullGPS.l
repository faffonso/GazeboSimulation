;; Auto-generated. Do not edit!


(when (boundp 'terrasentia_sensors::FullGPS)
  (if (not (find-package "TERRASENTIA_SENSORS"))
    (make-package "TERRASENTIA_SENSORS"))
  (shadow 'FullGPS (find-package "TERRASENTIA_SENSORS")))
(unless (find-package "TERRASENTIA_SENSORS::FULLGPS")
  (make-package "TERRASENTIA_SENSORS::FULLGPS"))

(in-package "ROS")
;;//! \htmlinclude FullGPS.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass terrasentia_sensors::FullGPS
  :super ros::object
  :slots (_header _latitude _longitude _altitude _heading _heading_accuracy _horizontal_accuracy _speed_east _speed_north _speed_accuracy _read_timestamp ))

(defmethod terrasentia_sensors::FullGPS
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:latitude __latitude) 0.0)
    ((:longitude __longitude) 0.0)
    ((:altitude __altitude) 0.0)
    ((:heading __heading) 0.0)
    ((:heading_accuracy __heading_accuracy) 0.0)
    ((:horizontal_accuracy __horizontal_accuracy) 0.0)
    ((:speed_east __speed_east) 0.0)
    ((:speed_north __speed_north) 0.0)
    ((:speed_accuracy __speed_accuracy) 0.0)
    ((:read_timestamp __read_timestamp) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _latitude (float __latitude))
   (setq _longitude (float __longitude))
   (setq _altitude (float __altitude))
   (setq _heading (float __heading))
   (setq _heading_accuracy (float __heading_accuracy))
   (setq _horizontal_accuracy (float __horizontal_accuracy))
   (setq _speed_east (float __speed_east))
   (setq _speed_north (float __speed_north))
   (setq _speed_accuracy (float __speed_accuracy))
   (setq _read_timestamp (float __read_timestamp))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:latitude
   (&optional __latitude)
   (if __latitude (setq _latitude __latitude)) _latitude)
  (:longitude
   (&optional __longitude)
   (if __longitude (setq _longitude __longitude)) _longitude)
  (:altitude
   (&optional __altitude)
   (if __altitude (setq _altitude __altitude)) _altitude)
  (:heading
   (&optional __heading)
   (if __heading (setq _heading __heading)) _heading)
  (:heading_accuracy
   (&optional __heading_accuracy)
   (if __heading_accuracy (setq _heading_accuracy __heading_accuracy)) _heading_accuracy)
  (:horizontal_accuracy
   (&optional __horizontal_accuracy)
   (if __horizontal_accuracy (setq _horizontal_accuracy __horizontal_accuracy)) _horizontal_accuracy)
  (:speed_east
   (&optional __speed_east)
   (if __speed_east (setq _speed_east __speed_east)) _speed_east)
  (:speed_north
   (&optional __speed_north)
   (if __speed_north (setq _speed_north __speed_north)) _speed_north)
  (:speed_accuracy
   (&optional __speed_accuracy)
   (if __speed_accuracy (setq _speed_accuracy __speed_accuracy)) _speed_accuracy)
  (:read_timestamp
   (&optional __read_timestamp)
   (if __read_timestamp (setq _read_timestamp __read_timestamp)) _read_timestamp)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _latitude
    8
    ;; float64 _longitude
    8
    ;; float32 _altitude
    4
    ;; float32 _heading
    4
    ;; float32 _heading_accuracy
    4
    ;; float32 _horizontal_accuracy
    4
    ;; float32 _speed_east
    4
    ;; float32 _speed_north
    4
    ;; float32 _speed_accuracy
    4
    ;; float32 _read_timestamp
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _latitude
       (sys::poke _latitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _longitude
       (sys::poke _longitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float32 _altitude
       (sys::poke _altitude (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _heading
       (sys::poke _heading (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _heading_accuracy
       (sys::poke _heading_accuracy (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _horizontal_accuracy
       (sys::poke _horizontal_accuracy (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _speed_east
       (sys::poke _speed_east (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _speed_north
       (sys::poke _speed_north (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _speed_accuracy
       (sys::poke _speed_accuracy (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _read_timestamp
       (sys::poke _read_timestamp (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _latitude
     (setq _latitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _longitude
     (setq _longitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float32 _altitude
     (setq _altitude (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _heading
     (setq _heading (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _heading_accuracy
     (setq _heading_accuracy (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _horizontal_accuracy
     (setq _horizontal_accuracy (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _speed_east
     (setq _speed_east (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _speed_north
     (setq _speed_north (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _speed_accuracy
     (setq _speed_accuracy (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _read_timestamp
     (setq _read_timestamp (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get terrasentia_sensors::FullGPS :md5sum-) "a4814892bb65a4b84a2387a8921c026e")
(setf (get terrasentia_sensors::FullGPS :datatype-) "terrasentia_sensors/FullGPS")
(setf (get terrasentia_sensors::FullGPS :definition-)
      "std_msgs/Header header
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

")



(provide :terrasentia_sensors/FullGPS "a4814892bb65a4b84a2387a8921c026e")


