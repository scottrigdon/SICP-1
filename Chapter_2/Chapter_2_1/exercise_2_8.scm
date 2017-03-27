; Exercise 2.8. Using reasoning analogous to Alyssa's, describe how the 
; difference of two intervals may be computed. Define a corresponding
; subtraction procedure, called sub-interval.

; First we need the constructor and selectors:
(define (make-interval a b) (cons a b))
(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))
; Here is the add-interval procedure from the book:
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

; For the sub-interval procedure, we want to return the largest possible 
; interval resulting from the subtraction of the two intervals. For the upper
; bound, the highest possible value would be to take the highest value for x
; and subtract the smallest value for y. To get the smallest possible value for
; the subtraction, we subtract the highest value for y from the lowest value for
; x

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))
; tests
(define y (make-interval 5 6))
(define x (make-interval 4 9))
(define z (sub-interval x y))
; should be -2
(lower-bound z)
;should be 4
(upper-bound z)
