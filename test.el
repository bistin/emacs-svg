(require 'svg)
(require 'dom)

(setq svg (svg-create 400 100))


(defun x-axis-text (svg text translate color)
  "gen g x-axis text"
  (progn
    (setq line (dom-node 'line
                         `((y2 . 6)
                           (stroke . ,color))))
    (setq g (dom-node 'g
                      `((transform . ,(concat "translate(" (number-to-string translate) ",0)")))))
    (svg-text g text :fill color  :y 9
              :dy "0.71em")
    (svg--append g line)
    (svg--append svg g)
    )
  )


(defun y-axis-text (svg text translate color)
  "gen g y-axis text"
  (progn
    (setq line (dom-node 'line
                         `((x2 . -6)
                           (stroke . ,color))))
    (setq g (dom-node 'g
                      `((transform . ,(concat "translate(50," (number-to-string translate) ")")))))
    (svg-text g text :fill color  :x -9
              :dy "0.32em")
    (svg--append g line)
    (svg--append svg g)
    )
  )


;; x-axis
(loop for x from 1 to 8
      do (x-axis-text
          svg
          (number-to-string x)
          (* x 25)
          "white"
          ))

;;y-axis
(loop for y from 1 to 8
      do (y-axis-text
          svg
          (number-to-string y)
          (* y 12.5)
          "white"
          ))


(svg-print svg)
(svg-insert-image svg)
;; (save-excursion (goto-char (point-max)) (svg-insert-image svg))
