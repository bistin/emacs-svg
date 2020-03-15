(require 'svg)
(require 'dom)

(setq svg (svg-create 400 100))



(setq elg (dom-node 'g
                    `((cx . 100)
                      (cy . 100))))

(svg-text elg "12345")


(svg--append svg elg)

(svg-print elg)

(svg-insert-image svg)




;; (save-excursion (goto-char (point-max)) (svg-insert-image svg))
