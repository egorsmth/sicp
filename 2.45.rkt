#lang planet neil/sicp
(define wave einstein)

(define (split part1 part2)
  (lambda (painter n)
    (if (= n 0)
        painter
        (part1 painter (part2 ((split part1 part2) painter (- n 1))
                          ((split part1 part2) painter (- n 1)))))))

(define right-split (split beside below))
(define up-split (split below beside))

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left (beside up up))
              (bottom-right (below right right))
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))


(paint (up-split wave 2))