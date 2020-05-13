(require 'svg)
(require 'dom)
(require 'my-scale)


(setq svg (svg-create 400 100))
(setq margin '((top .  10) (left . 20) (buttom . 10) (right . 20) ))



(setq xScale (scaleLinear :domain [1 10] :range [1 100]))
;; x-axis
(loop for x from 0 to 8
      do (x-axis-text
          svg
          (number-to-string x)
          (* x 25)
          "white"
          80
          ))

;;y-axis
(loop for y from 0 to 8
      do (y-axis-text
          svg
          (number-to-string y)
          (* y 12.5)
          "white"
          10
          ))


(svg-print svg)
(svg-insert-image svg)
;; (save-excursion (goto-char (point-max)) (svg-insert-image svg))
