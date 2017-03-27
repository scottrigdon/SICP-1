; After considerable work, Alyssa P. Hacker delivers her finished system. 
; Several years later, after she has forgotten all about it, she gets a frenzied
; call from an irate user, Lem E. Tweakit. It seems that Lem has noticed that 
; the formula for parallel resistors can be written in two algebraically 
; equivalent ways:
;
; R1 * R2/ (R1 + R2)  <==> 1/ ((1/R1) + (1/R2))
;
; He has written the following two programs, each of which computes the 
; parallel-resistors formula differently:

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))

; Lem complains that Alyssa's program gives different answers for the two ways
; of computing. This is a serious complaint.

; Exercise 2.14. Demonstrate that Lem is right. Investigate the behavior of the
; system on a variety of arithmetic expressions. Make some intervals A and B, 
; and use them in computing the expressions A/A and A/B. You will get the most
; insight by using intervals whose width is a small percentage of the center
; value. Examine the results of the computation in center-percent form (see
; exercise 2.12).

; Bringing in the whole system from previous problems:
; constructors and selectors
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

; We will make a new printer to look at an interval in center percent form
(define (print-center-perc i)
  (display (center i))
  (display " +- ")
  (display (percent i))
  (display "%"))
; First we will look at A/A and A/B
(define x (make-center-percent 5 2))
(define z (make-center-percent 50 1))
(define y (make-center-percent 500 3))

; expect about a 4% range around 1
(print-center-perc (div-interval x x))
; expect about a 2% range around 1
(print-center-perc (div-interval z z))
; expect about a 6% range around 1
(print-center-perc (div-interval y y))
; expect about a 3% range around 10
(print-center-perc (div-interval z x))
; expect about a 4% range around 10
(print-center-perc (div-interval y z))

(print-center-perc (par1 x y))
(print-center-perc (par2 x y))

; Here we can see that Lem is right and the system does give different answers
; for the same question. You will also notice that when dividing two intervals
; by themselves, you end up with an approximation to 1 but not actually 1 
; itself.
