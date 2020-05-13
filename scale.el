(defclass scaleLinear ()
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

(defun x-axis-text (svg text translate color height)
  "gen g x-axis text"
  (progn
    (setq line (dom-node 'line
                         `((y2 . 6)
                           (stroke . ,color))))
    (setq g (dom-node 'g
                      `((transform . ,(concat "translate(" (number-to-string translate) "," (number-to-string height) ")")))))
    (svg-text g text :fill color  :y 9
              :dy "0.71em")
    (svg--append g line)
    (svg--append svg g)
    )
  )

(defun y-axis-text (svg text translate color offset)
  "gen g y-axis text"
  (progn
    (setq line (dom-node 'line
                         `((x2 . -6)
                           (stroke . ,color))))
    (setq g (dom-node 'g
                      `((transform . ,(concat "translate(" (number-to-string offset) "," (number-to-string translate) ")")))))
    (svg-text g text :fill color  :x -9
              :dy "0.32em")
    (svg--append g line)
    (svg--append svg g)
    )
  )

(provide 'my-scale)
;;(scale xScale 50)

































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
