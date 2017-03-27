; Exercise 2.9 The width of an interval is half of the difference between its
; upper and lower bounds. The width is a measure of the uncertainty of the 
; number specified by the interval. For some arithmetic operations the width of
; the result of combining two intervals is a function only of the widths of the
; argument intervals. Show that the width of the sum (or difference) of two 
; intervals is a function only of the widths of the intervals being added (or
; subtracted). Give examples to show that this is not true for multiplication or
; division.

; First lets pull the definitions of the interval procedures from previous
; problems:

; First we need the constructor and selectors:
(define (make-interval a b) (cons a b))
(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))
; Here is the add-interval procedure from the book:
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))
; Here is the sub-interval procedure from 2.9
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))
; Here are the multiplication and division procedures from the book:
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))
(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))
; First lets write a procedure to return the width of an interval
; This assumes that upper-bound is always greater than the lower-bound
(define (width-interval z)
  (/ (- (upper-bound z) (lower-bound z)) 2))

;For addition and subtraction, the new interval width is equivalent to adding
;the two intervals widths together
;
;tests
(define x (make-interval 5 10))
(define y (make-interval 10 20))
; should be true
(= (+ (width-interval x) (width-interval y))
   (width-interval (add-interval x y)))
; should be true
(= (+ (width-interval x) (width-interval y))
   (width-interval (sub-interval x y)))
; This can be shown fairly easily mathmatically:
; [a b] + [c d] = [(a + c) (d + b]
; width([a b]) = (b - a) / 2
; Does width([a b]) + width([c d]) = width([a b] + [c d])?
; (b - a)/2 + (d -c)/2 = ((d + b) - (a + c))/2
; (b - a) + (d - c) = (d + b) - (a + c)
; (b - a) + (d - c) = d + b - a - c
; b - a + d - c = d + b - a - c
; d + b - a - c = d + b - a - c

; However this does not hold true for multiplication or division
; should be false
(= (+ (width-interval x) (width-interval y))
   (width-interval (mul-interval x y)))
; should be false
(= (+ (width-interval x) (width-interval y))
   (width-interval (div-interval x y)))


