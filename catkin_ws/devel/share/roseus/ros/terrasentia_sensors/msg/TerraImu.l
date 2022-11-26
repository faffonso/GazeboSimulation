;; Auto-generated. Do not edit!


(when (boundp 'terrasentia_sensors::TerraImu)
  (if (not (find-package "TERRASENTIA_SENSORS"))
    (make-package "TERRASENTIA_SENSORS"))
  (shadow 'TerraImu (find-package "TERRASENTIA_SENSORS")))
(unless (find-package "TERRASENTIA_SENSORS::TERRAIMU")
  (make-package "TERRASENTIA_SENSORS::TERRAIMU"))

(in-package "ROS")
;;//! \htmlinclude TerraImu.msg.html


(defclass terrasentia_sensors::TerraImu
  :super ros::object
  :slots (_accel _gyro _orientation ))

(defmethod terrasentia_sensors::TerraImu
  (:init
   (&key
    ((:accel __accel) (instance terrasentia_sensors::Terra_XYZ_Data :init))
    ((:gyro __gyro) (instance terrasentia_sensors::Terra_XYZ_Data :init))
    ((:orientation __orientation) (instance terrasentia_sensors::Terra_Orientation_Data :init))
    )
   (send-super :init)
   (setq _accel __accel)
   (setq _gyro __gyro)
   (setq _orientation __orientation)
   self)
  (:accel
   (&rest __accel)
   (if (keywordp (car __accel))
       (send* _accel __accel)
     (progn
       (if __accel (setq _accel (car __accel)))
       _accel)))
  (:gyro
   (&rest __gyro)
   (if (keywordp (car __gyro))
       (send* _gyro __gyro)
     (progn
       (if __gyro (setq _gyro (car __gyro)))
       _gyro)))
  (:orientation
   (&rest __orientation)
   (if (keywordp (car __orientation))
       (send* _orientation __orientation)
     (progn
       (if __orientation (setq _orientation (car __orientation)))
       _orientation)))
  (:serialization-length
   ()
   (+
    ;; terrasentia_sensors/Terra_XYZ_Data _accel
    (send _accel :serialization-length)
    ;; terrasentia_sensors/Terra_XYZ_Data _gyro
    (send _gyro :serialization-length)
    ;; terrasentia_sensors/Terra_Orientation_Data _orientation
    (send _orientation :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; terrasentia_sensors/Terra_XYZ_Data _accel
       (send _accel :serialize s)
     ;; terrasentia_sensors/Terra_XYZ_Data _gyro
       (send _gyro :serialize s)
     ;; terrasentia_sensors/Terra_Orientation_Data _orientation
       (send _orientation :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; terrasentia_sensors/Terra_XYZ_Data _accel
     (send _accel :deserialize buf ptr-) (incf ptr- (send _accel :serialization-length))
   ;; terrasentia_sensors/Terra_XYZ_Data _gyro
     (send _gyro :deserialize buf ptr-) (incf ptr- (send _gyro :serialization-length))
   ;; terrasentia_sensors/Terra_Orientation_Data _orientation
     (send _orientation :deserialize buf ptr-) (incf ptr- (send _orientation :serialization-length))
   ;;
   self)
  )

(setf (get terrasentia_sensors::TerraImu :md5sum-) "8ae412fe3901bdc7584ffe78434df649")
(setf (get terrasentia_sensors::TerraImu :datatype-) "terrasentia_sensors/TerraImu")
(setf (get terrasentia_sensors::TerraImu :definition-)
      "Terra_XYZ_Data accel
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

")



(provide :terrasentia_sensors/TerraImu "8ae412fe3901bdc7584ffe78434df649")


