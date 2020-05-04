(require 'svg)
(require 'dom)

(setq svg (svg-create 400 100))


(defun axis-text (svg text translate color)
  "gen g text"
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

(loop for x from 1 to 8
      do (axis-text
          svg
          (number-to-string x)
          (* x 25)
          "white"
          ))

(svg-print svg)
(svg-insert-image svg)
;; (save-excursion (goto-char (point-max)) (svg-insert-image svg))
