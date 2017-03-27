; Exercise 2.13. Show that under the assumption of small percentage tolerances
; there is a simple forumal for the approximate percentage tolerance of the 
; product of two intervals in terms of the tolerances of the factors. You may
; simplify the problem by assuming that all numbers are positive.

; Pulling all many procedures from previous problems
(define (make-interval a b) (cons a b))
(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
  (let ((w (* c (/ p 100.0))))
    (make-center-width c w)))
(define (percent i)
  (* (/ (width i) (center i)) 100.0))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

; First lets test a couple intervals and see if we can see a pattern
(define w (make-center-percent 20 1))
(define x (make-center-percent 60 2))
(define y (make-center-percent 50 3))
(define z (make-center-percent 42 4))
(define a (make-center-percent 35 5))

; tests
; 1 *2
(percent (mul-interval w x))
; 2 * 3
(percent (mul-interval x y))
; 3 * 4
(percent (mul-interval y z))
; 4 * 5
(percent (mul-interval z a))
; 5 * 1
(percent (mul-interval a w))

; It appears that, under the assumption of small percentage tolerances, when
; you multiply two intervals, the tolerances simply add.
