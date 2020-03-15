(setq lexical-binding t)

(defun scaleLinear (&rest params)
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
