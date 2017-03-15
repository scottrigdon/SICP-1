; Exercise 1.46 Several of the numerical methods described in this chapter are
; instances of an extremely general computational strategy known as iterative
; improvement. Iterative improvement says that, to compute something, we start
; with an initial guess for the answer, test if the guess is good enough, and
; otherwise improve the guess and continue the process using the improved guess
; as the method for telling whether a guess is good enough and a mtehod for
; improving a guess.  Iterative-improve should return as its value a procedure
; that takes a guess as argument and keeps improving the guess until it is good
; enough. 
;
; Rewrite the sqrt procedure of section 1.17 and the fixed-point procedure of
; 1.3.3 in terms of iterative-improve.

(define (iterative-improve good-enough? improve)
  (lambda (first-guess) 
    (define (iter guess)
        (let ((next (improve guess)))
             (if (good-enough? guess next)
                 next
                 (iter next))))
    (iter first-guess)))

; fixed-point procedure
(define (close-enough? v1 v2)
  (let ((tolerance 0.00001))
       (< (abs (- v1 v2)) tolerance)))

(define (fixed-point f first-guess)
  ((iterative-improve close-enough? f) first-guess))

(define (sqrt x)
  (fixed-point (lambda (y) (average y (/ x y)))
               1.0))
(define (average x y)
  (/ (+ x y) 2))

(sqrt 4)
(sqrt 64)
(sqrt 3)

; sqrt procedure of 1.3.3

(define (sqrt x)
  ((iterative-improve close-enough? 
                      (lambda (y) (average y (/ x y))))
   1.0))

(sqrt 4)
(sqrt 64)
(sqrt 3)
