; Exercise 2.10. Ben Bitdiddle, an expert systems programmer, looks over
; Alyssa's shoulder and comments that it is not clear what it means to divide by
; an interval that spans zero. Modify Alyssa's code to check for this condition
; and to signal an error if it occurs.

; First lets pull all the code from previous exercises that we need:

; Here are the constructor and selectors:
(define (make-interval a b) (cons a b))
(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))
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
; An interval that spans zero is the following:
; [-5 5]. Lets divide the interval [5 10] by this interval and see what
; ambiguity occurs.
;
; (div-interval [5 10] [-10 5])
; (mul-interval [5 10] [0.2 -0.1]) Here the interval that is created within the
; div-interval procedure lower bound higher than its upper bound!
; To fix this, we will add a test for whether the y interval spans zero

(define (div-interval x y)
  (if (< (* (lower-bound y) (upper-bound y)) 0)
      (display "Error denominator spans 0")
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))
; tests
(define x (make-interval 5 10))
(define y (make-interval -5 10))
; should print error
(div-interval x y)

(define y (make-interval -10 -5))
; should not print error
(div-interval x y)

(define y (make-interval 5 10))
; should not print error
(div-interval x y)
