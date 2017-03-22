; Exercise 1.45. We saw in section 1.3.3 that attempting to compute square roots
; by naively finding a fixed point of y |--> x/y does not converge, and that
; this can be fixed by average damping. The same method works for finding cube
; roots as fixed points of the average-damped y |--> x/y^2. Unfortunately, the
; process does not work for fourth roots -- a single average damp is not enough
; to make a fixed-point search for y |--> x/y^3 converge. On the other hand, if
; we average damp twice (i.e., use the average damp of the average damp of
; y |--> x/y^3) the fixed-point search does converge. Do some experiments to
; determine how many average damps are required to compute nth roots as
; a fixed-point search based upon repeated average damping of y |--> x/y^n-1.
; Use this to implement a simple procedure for computing nth roots using
; fixed-point, average-damp, and the repeated procedure of exercise 1.43. Assume
; that any arithmetic operations you need are available as primitives.

; average-damp
(define (average x y)
  (/ (+ x y) 2))
(define (average-damp f)
  (lambda (x) (average x (f x))))

; fixed-point
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

; repeated
(define (compose f g)
  (lambda (x) (f (g x))))
(define (repeated f n)
  (if (< n 2)
      f
      (compose f (repeated f (- n 1)))))

; create a procedure to calculate the power of anything
(define (power b p)
  (define (iter res a n)
    (if (= n 0)
        res
        (if (even? n)
            (iter res (* a a) (/ n 2))
            (iter (* res a) a (- n 1)))))
  (iter 1 b p))

; test 16
(power 2 4)

(define (nth-root-opt n x)
  (lambda (y) (/ x (power y (- n 1)))))
(define (nth-root n x av_rp)
  (fixed-point ((repeated average-damp av_rp) (nth-root-opt n x)) 1.0))
; The general pattern that I see with this is the following:
; Number averages needed: 1   2   3   4
; Root :                  2   4   8   16
; We essentially need the highest power of 2 that fits in the root number of
; times of averaging for it to work. We can find that by flooring log2
(define (log2 x) (/ (log x) (log 2)))
(define (nth-root n x)
  (fixed-point ((repeated average-damp (floor (log2 n)))
                (nth-root-opt n x))
               1.0))
(nth-root 2 32)
(nth-root 4 32)
(nth-root 8 32)
(nth-root 16 32)
(nth-root 32 32)
