(in-package :wa)

(defstruct clock
  minute
  second
  millisecond)

(defparameter current-clock (make-clock))

(defun next-clock ()
  (setf (minute current-clock) (local-time:timestamp-minute (local-time:now))
        (second current-clock) (local-time:timestamp-second (local-time:now))
        (millisecond current-clock) (local-time:timestamp-millisecond (local-time:now))))


(defstruct wacom-event-point
  abs-x
  abs-y
  abs-pressure
  clock-time)

(defparameter wacom-event-points '())

(defun next-wacom-event-point (x y pressure)
  (push (make-wacom-event-point :abs-x x
				:abs-y y
				:abs-pressure pressure
				:clock-time current-clock)))

(defun pen-draw (event x y pressure)
  (let ((color (/ pressure 700.0)))
    (set-grid  (round (* x .020))	   
	       (round (* y .040))
	       (list 0 0 color))))

;; PEN-DOWN,UP state register
(defun pen-up-event ()
  "change states accordingly as tablet pen leaves surface"
  nil)
(defun pen-down-event ()
  "given some pressure threashold, change state as pen touches surface"
  nil)

  
(defun classifier (domain)
  ;; domain = time t, # seconds since unix epoch (local-time:unix-to-timestamp n)
  ;; codomain = tuple (abs-x abs-y abs-pressure)
  ;; abs-x discrete f of t
  ;; abs-y discrete f of t
  ;; t discrete increasing
  
  ;; domain of t : t_n - t_0, nth time slice
  ;; clock resets every 60 minutes
  ;; starts from 0, incf 1 every millisecond

  ;; (next-clock) called every Absolute-Event
  ;; (next-wacom-event-point) called every Absolute-Event
  ;; every PEN-UP end letter data points collect and test set against classifier
  ;; every PEN-DOWN + ABS_PRESSURE threashold, begin letter collect data points until PEN-UP
  
  ;; want stroke to be every n*100 milliseconds
  ;; metrics:
  ;; * statistical point_n to point_n+1 slope
  ;; * ^ up vs down up = (pen press, Y++, pen off)
  ;; patterns (discrete stroke)
  ;; (up up left right) -> t
  
  )
