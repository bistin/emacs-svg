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
                      `((transform . ,(concat "translate(" translate ",0)")))))
    (svg-text g text :fill color  :y 9
              :dy "0.71em")
    (svg--append g line)
    (svg--append svg g)
    )
  )


(axis-text svg "1" "25" "red")
(axis-text svg "2" "50" "red")
(axis-text svg "3" "75" "red")
(axis-text svg "4" "100" "red")
(axis-text svg "5" "125" "red")
(axis-text svg "6" "150" "red")
(axis-text svg "7" "175" "red")
(axis-text svg "8" "200" "red")


(svg--append svg elg)



(svg-print elg)
(svg-print svg)
(svg-insert-image svg)
;; (save-excursion (goto-char (point-max)) (svg-insert-image svg))
