;; Auto-generated. Do not edit!


(when (boundp 'terrasentia_sensors::Terra_Orientation_Data)
  (if (not (find-package "TERRASENTIA_SENSORS"))
    (make-package "TERRASENTIA_SENSORS"))
  (shadow 'Terra_Orientation_Data (find-package "TERRASENTIA_SENSORS")))
(unless (find-package "TERRASENTIA_SENSORS::TERRA_ORIENTATION_DATA")
  (make-package "TERRASENTIA_SENSORS::TERRA_ORIENTATION_DATA"))

(in-package "ROS")
;;//! \htmlinclude Terra_Orientation_Data.msg.html


(defclass terrasentia_sensors::Terra_Orientation_Data
  :super ros::object
  :slots (_x _y _z _w _covariance _bias ))

(defmethod terrasentia_sensors::Terra_Orientation_Data
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    ((:w __w) 0.0)
    ((:covariance __covariance) (instance terrasentia_sensors::Euler_Base :init))
    ((:bias __bias) (instance terrasentia_sensors::Quaternion_Base :init))
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   (setq _w (float __w))
   (setq _covariance __covariance)
   (setq _bias __bias)
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:w
   (&optional __w)
   (if __w (setq _w __w)) _w)
  (:covariance
   (&rest __covariance)
   (if (keywordp (car __covariance))
       (send* _covariance __covariance)
     (progn
       (if __covariance (setq _covariance (car __covariance)))
       _covariance)))
  (:bias
   (&rest __bias)
   (if (keywordp (car __bias))
       (send* _bias __bias)
     (progn
       (if __bias (setq _bias (car __bias)))
       _bias)))
  (:serialization-length
   ()
   (+
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _z
    8
    ;; float64 _w
    8
    ;; terrasentia_sensors/Euler_Base _covariance
    (send _covariance :serialization-length)
    ;; terrasentia_sensors/Quaternion_Base _bias
    (send _bias :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _z
       (sys::poke _z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _w
       (sys::poke _w (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; terrasentia_sensors/Euler_Base _covariance
       (send _covariance :serialize s)
     ;; terrasentia_sensors/Quaternion_Base _bias
       (send _bias :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _z
     (setq _z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _w
     (setq _w (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; terrasentia_sensors/Euler_Base _covariance
     (send _covariance :deserialize buf ptr-) (incf ptr- (send _covariance :serialization-length))
   ;; terrasentia_sensors/Quaternion_Base _bias
     (send _bias :deserialize buf ptr-) (incf ptr- (send _bias :serialization-length))
   ;;
   self)
  )

(setf (get terrasentia_sensors::Terra_Orientation_Data :md5sum-) "e34d80bf8481ce2ab0668f1f26f72964")
(setf (get terrasentia_sensors::Terra_Orientation_Data :datatype-) "terrasentia_sensors/Terra_Orientation_Data")
(setf (get terrasentia_sensors::Terra_Orientation_Data :definition-)
      "float64 x
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

")



(provide :terrasentia_sensors/Terra_Orientation_Data "e34d80bf8481ce2ab0668f1f26f72964")


