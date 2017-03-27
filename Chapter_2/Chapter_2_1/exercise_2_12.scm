; Exercise 2.12. Define a constructor make-center-percent that takes a center
; and a percentage tolerance and produces the desired interval. You must also
; define a selector perent that produces the percentage tolerance for a given
; interval. The center selector is the same as the one shown above.

; New definitions from the text book
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

; Old definitions from previous exercises
(define (make-interval a b) (cons a b))
(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))

; This is easiest to define by first finding the width from the percentage and
; then using the make-center-width constructor
(define (make-center-percent c p)
  (let ((w (* c (/ p 100.0))))
    (make-center-width c w)))
; To get back the percentage we can just do the inverse of finding the width
; from the percent. Divide the width by the center
(define (percent i)
  (* (/ (width i) (center i)) 100.0))

; tests
(define z (make-center-percent 5 5))
; should be .25
(width z)
; should be 5
(percent z)
; should be 4.75
(lower-bound z)
; should be 5.25
(upper-bound z)
; should be 5
(center z)


