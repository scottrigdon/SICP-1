; Exercise 1.6 Alyssa P. Hacker doesn't see why if needs to be provided as a 
; special form. "Why can't I just define it as an ordinary procedue in terms
; of cond?" she asks. Alyssa's friend Eva Lu Ator claims this can indeed be done
; , and she defines a new version of if:
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))
(new-if (= 2 3) 0 5)
(new-if (= 1 1) 0 5)

; Delighted, Alyssa uses new-if to rewrite the square-root program:

; newtons method for determining the sqrt

; main procedure
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
      guess
      (sqrt-iter(improve guess x)
                x)))
; improve function
(define (improve guess x)
  (average guess (/ x guess)))
; average function
(define (average x y)
  (/ (+ x y) 2))
; good enough? function
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
; square function
(define (square x) (* x x))
; finally define start point
(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9)
; This gets stuck in an infinite loop because of applicative order evalutation,
; the third argument in new-if is evaluated everytime it is called resulting
; in infinite recursion
