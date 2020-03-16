(require 'eieio)

(setq lexical-binding t)

(defclass scaleLinear () ; No superclasses
  ((domain :initarg :domain
           :type vector
           :documentation "domain")
   (range :initarg :range
          :type vector
          :documentation "range")
   )
  "scale params")



(cl-defmethod scale ((scale scaleLinear) (x number))
  ""
  (let
      ((domain (oref scale domain))
       (range (oref scale range))
       )
    (progn
      (setq start (aref domain 0))
      (setq end (aref domain 1))
      (setq t1 (aref range 0))
      (setq t2 (aref range 1))
      (+ t1 (* (- t2 t1) (/ (- x start) (- end start) )))
      )))


(setq xScale (scaleLinear :domain [1 2 ] :range [4 7]))
(scale xScale 3)


(defun scaleLinear2 (&rest params)
  "
  Create scale.

  Possible parameters:

    :domain     vector
    :range      vector

  "
  (let
      ((domain (plist-get params :domain ))
       (range (plist-get params :range))
       (value (plist-get params :value))
       )
    (progn
      (setq start (aref domain 0))
      (setq end (aref domain 1))
      (setq t1 (aref range 0))
      (setq t2 (aref range 1))

      (lambda (x) (+ t1 (* (- t2 t1) (/ (- x start) (- end start) )  )))

      )))

(setq xScale (scaleLinear
              :domain [1 2]
              :range [4 8]
              :value 1.5))


(funcall xScale 8)
