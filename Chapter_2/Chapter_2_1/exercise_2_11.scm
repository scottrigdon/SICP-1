; Exercise 2.11. In passing, Ben also cryptically comments: "By testing the
; signs of the endpoints of the intervals, it is possible to break mul-interval
; into nine cases, only one of which requires more than two multiplications."
; Rewrite this procedure using Ben's suggestion.


; First we need the constructor and selectors:
(define (make-interval a b) (cons a b))
(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))

; Here is the multiplication procedure from the book
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

; We want to define a new multplication procedure that tests for the signs of
; the end points. Lets see what these cases would be:
; int1 int2   new interval psuedocode
; pos * pos   [1lo*2lo, 1hi*2hi]
; pos * span  [1hi*2lo, 1hi*2hi]
; pos * neg   [1hi*2lo, 1lo*2hi]
;
; span * pos  [1lo*2hi, 1hi*2hi]
; span * neg  [1hi*2lo, 1lo*2lo]
; span * span [normal mult-interval]
;
; neg * pos  [1lo*2hi, 1hi*2lo]
; neg * span [1lo*2hi, 1lo*2lo]
; neg * neg  [1hi*2hi, 1lo*2lo]

; To write this far more complicated procedure, we will define some helper
; functions:

(define (spans-zero? x)
  (< (* (lower-bound x) (upper-bound x)) 0))

(define (pos? x)
  (> (lower-bound x) 0))

(define (neg? x)
  (< (upper-bound x) 0))

(define (new-mul-interval x y)
  (let ((xlo (lower-bound x))
        (xhi (upper-bound x))
        (ylo (lower-bound y))
        (yhi (upper-bound y)))
    (cond ((and (pos? x) (pos? y))
           (make-interval (* xlo ylo) (* xhi yhi)))
          ((and (pos? x) (spans-zero? y))
           (make-interval (* xhi ylo) (* xhi yhi)))
          ((and (pos? x) (neg? y))
           (make-interval (* xhi ylo) (* xlo yhi)))
          ((and (spans-zero? x) (pos? y))
           (make-interval (* xlo yhi) (* xhi yhi)))
          ((and (spans-zero? x) (neg? y))
           (make-interval (* xhi ylo) (* xlo ylo)))
          ((and (spans-zero? x) (spans-zero? y))
           (mul-interval x y))
          ((and (neg? x) (pos? y))
           (make-interval (* xlo yhi) (* xhi ylo)))
          ((and (neg? x) (spans-zero? y))
           (make-interval (* xlo yhi) (* xlo ylo)))
          ((and (neg? x) (neg? y))
           (make-interval (* xhi yhi) (* xlo ylo)))
          (display "Impossible interval combo detected."))))

; test one of each multiplication combo
(define pos (make-interval 5 10))
(define span (make-interval -5 2))
(define neg (make-interval -10 -5))

; x is positive cases
; should be 25 100
(new-mul-interval pos pos)
; should be -50 20
(new-mul-interval pos span)
; should be -100 -25
(new-mul-interval pos neg)

; x spans zero cases
; should be -50 20
(new-mul-interval span pos)
; should be -20 50
(new-mul-interval span neg)
; should be -10 25, could test more combinations here
(new-mul-interval span span)

; x is negative cases
; should be -100 -25
(new-mul-interval neg pos)
; should be -20 50
(new-mul-interval neg span)
; should be 25 100
(new-mul-interval neg neg)



