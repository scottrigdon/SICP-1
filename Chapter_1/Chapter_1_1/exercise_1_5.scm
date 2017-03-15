; Exercise 1.5 Ben Bitdiddle has invented a test to determine whether the
; interpreter is using applicative-order evaluation or normal-order evaluation.
; He defines the following two procedures:
(define (p) (p))
(define (test x y)
  (if (= x 0)
      0
      y))
;DON'T RUN THIS it gets stuck in an infinite loop if since scheme has
;applicative order evaluation. If it was normal order, then it would return
;0 since (p) would never have to be evaluated
