;; Auto-generated. Do not edit!


(when (boundp 'terrasentia_sensors::Motor)
  (if (not (find-package "TERRASENTIA_SENSORS"))
    (make-package "TERRASENTIA_SENSORS"))
  (shadow 'Motor (find-package "TERRASENTIA_SENSORS")))
(unless (find-package "TERRASENTIA_SENSORS::MOTOR")
  (make-package "TERRASENTIA_SENSORS::MOTOR"))

(in-package "ROS")
;;//! \htmlinclude Motor.msg.html


(defclass terrasentia_sensors::Motor
  :super ros::object
  :slots (_status _current _linear_speed ))

(defmethod terrasentia_sensors::Motor
  (:init
   (&key
    ((:status __status) nil)
    ((:current __current) 0.0)
    ((:linear_speed __linear_speed) 0.0)
    )
   (send-super :init)
   (setq _status __status)
   (setq _current (float __current))
   (setq _linear_speed (float __linear_speed))
   self)
  (:status
   (&optional (__status :null))
   (if (not (eq __status :null)) (setq _status __status)) _status)
  (:current
   (&optional __current)
   (if __current (setq _current __current)) _current)
  (:linear_speed
   (&optional __linear_speed)
   (if __linear_speed (setq _linear_speed __linear_speed)) _linear_speed)
  (:serialization-length
   ()
   (+
    ;; bool _status
    1
    ;; float32 _current
    4
    ;; float32 _linear_speed
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _status
       (if _status (write-byte -1 s) (write-byte 0 s))
     ;; float32 _current
       (sys::poke _current (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _linear_speed
       (sys::poke _linear_speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _status
     (setq _status (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float32 _current
     (setq _current (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _linear_speed
     (setq _linear_speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get terrasentia_sensors::Motor :md5sum-) "ddcdf3f155fb96dd57ae968eded5ace9")
(setf (get terrasentia_sensors::Motor :datatype-) "terrasentia_sensors/Motor")
(setf (get terrasentia_sensors::Motor :definition-)
      "bool status
float32 current
float32 linear_speed
")



(provide :terrasentia_sensors/Motor "ddcdf3f155fb96dd57ae968eded5ace9")


