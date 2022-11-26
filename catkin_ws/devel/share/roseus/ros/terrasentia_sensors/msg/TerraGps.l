;; Auto-generated. Do not edit!


(when (boundp 'terrasentia_sensors::TerraGps)
  (if (not (find-package "TERRASENTIA_SENSORS"))
    (make-package "TERRASENTIA_SENSORS"))
  (shadow 'TerraGps (find-package "TERRASENTIA_SENSORS")))
(unless (find-package "TERRASENTIA_SENSORS::TERRAGPS")
  (make-package "TERRASENTIA_SENSORS::TERRAGPS"))

(in-package "ROS")
;;//! \htmlinclude TerraGps.msg.html


(defclass terrasentia_sensors::TerraGps
  :super ros::object
  :slots (_time _latitude _longitude _altitude _reference_latitude _reference_longitude _reference_altitude _reference_heading _velocity _covariance _covariance_type _service _status ))

(defmethod terrasentia_sensors::TerraGps
  (:init
   (&key
    ((:time __time) 0.0)
    ((:latitude __latitude) 0.0)
    ((:longitude __longitude) 0.0)
    ((:altitude __altitude) 0.0)
    ((:reference_latitude __reference_latitude) 0.0)
    ((:reference_longitude __reference_longitude) 0.0)
    ((:reference_altitude __reference_altitude) 0.0)
    ((:reference_heading __reference_heading) 0.0)
    ((:velocity __velocity) (instance terrasentia_sensors::XYZ_Base :init))
    ((:covariance __covariance) (instance terrasentia_sensors::XYZ_Base :init))
    ((:covariance_type __covariance_type) 0)
    ((:service __service) 0)
    ((:status __status) 0)
    )
   (send-super :init)
   (setq _time (float __time))
   (setq _latitude (float __latitude))
   (setq _longitude (float __longitude))
   (setq _altitude (float __altitude))
   (setq _reference_latitude (float __reference_latitude))
   (setq _reference_longitude (float __reference_longitude))
   (setq _reference_altitude (float __reference_altitude))
   (setq _reference_heading (float __reference_heading))
   (setq _velocity __velocity)
   (setq _covariance __covariance)
   (setq _covariance_type (round __covariance_type))
   (setq _service (round __service))
   (setq _status (round __status))
   self)
  (:time
   (&optional __time)
   (if __time (setq _time __time)) _time)
  (:latitude
   (&optional __latitude)
   (if __latitude (setq _latitude __latitude)) _latitude)
  (:longitude
   (&optional __longitude)
   (if __longitude (setq _longitude __longitude)) _longitude)
  (:altitude
   (&optional __altitude)
   (if __altitude (setq _altitude __altitude)) _altitude)
  (:reference_latitude
   (&optional __reference_latitude)
   (if __reference_latitude (setq _reference_latitude __reference_latitude)) _reference_latitude)
  (:reference_longitude
   (&optional __reference_longitude)
   (if __reference_longitude (setq _reference_longitude __reference_longitude)) _reference_longitude)
  (:reference_altitude
   (&optional __reference_altitude)
   (if __reference_altitude (setq _reference_altitude __reference_altitude)) _reference_altitude)
  (:reference_heading
   (&optional __reference_heading)
   (if __reference_heading (setq _reference_heading __reference_heading)) _reference_heading)
  (:velocity
   (&rest __velocity)
   (if (keywordp (car __velocity))
       (send* _velocity __velocity)
     (progn
       (if __velocity (setq _velocity (car __velocity)))
       _velocity)))
  (:covariance
   (&rest __covariance)
   (if (keywordp (car __covariance))
       (send* _covariance __covariance)
     (progn
       (if __covariance (setq _covariance (car __covariance)))
       _covariance)))
  (:covariance_type
   (&optional __covariance_type)
   (if __covariance_type (setq _covariance_type __covariance_type)) _covariance_type)
  (:service
   (&optional __service)
   (if __service (setq _service __service)) _service)
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:serialization-length
   ()
   (+
    ;; float64 _time
    8
    ;; float64 _latitude
    8
    ;; float64 _longitude
    8
    ;; float64 _altitude
    8
    ;; float64 _reference_latitude
    8
    ;; float64 _reference_longitude
    8
    ;; float64 _reference_altitude
    8
    ;; float64 _reference_heading
    8
    ;; terrasentia_sensors/XYZ_Base _velocity
    (send _velocity :serialization-length)
    ;; terrasentia_sensors/XYZ_Base _covariance
    (send _covariance :serialization-length)
    ;; uint8 _covariance_type
    1
    ;; uint16 _service
    2
    ;; int8 _status
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _time
       (sys::poke _time (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _latitude
       (sys::poke _latitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _longitude
       (sys::poke _longitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _altitude
       (sys::poke _altitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _reference_latitude
       (sys::poke _reference_latitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _reference_longitude
       (sys::poke _reference_longitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _reference_altitude
       (sys::poke _reference_altitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _reference_heading
       (sys::poke _reference_heading (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; terrasentia_sensors/XYZ_Base _velocity
       (send _velocity :serialize s)
     ;; terrasentia_sensors/XYZ_Base _covariance
       (send _covariance :serialize s)
     ;; uint8 _covariance_type
       (write-byte _covariance_type s)
     ;; uint16 _service
       (write-word _service s)
     ;; int8 _status
       (write-byte _status s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _time
     (setq _time (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _latitude
     (setq _latitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _longitude
     (setq _longitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _altitude
     (setq _altitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _reference_latitude
     (setq _reference_latitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _reference_longitude
     (setq _reference_longitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _reference_altitude
     (setq _reference_altitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _reference_heading
     (setq _reference_heading (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; terrasentia_sensors/XYZ_Base _velocity
     (send _velocity :deserialize buf ptr-) (incf ptr- (send _velocity :serialization-length))
   ;; terrasentia_sensors/XYZ_Base _covariance
     (send _covariance :deserialize buf ptr-) (incf ptr- (send _covariance :serialization-length))
   ;; uint8 _covariance_type
     (setq _covariance_type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint16 _service
     (setq _service (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int8 _status
     (setq _status (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _status 127) (setq _status (- _status 256)))
   ;;
   self)
  )

(setf (get terrasentia_sensors::TerraGps :md5sum-) "b34d8639cf3adf476f2bee63f46d8e96")
(setf (get terrasentia_sensors::TerraGps :datatype-) "terrasentia_sensors/TerraGps")
(setf (get terrasentia_sensors::TerraGps :definition-)
      "float64 time
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

")



(provide :terrasentia_sensors/TerraGps "b34d8639cf3adf476f2bee63f46d8e96")


