; Exercise 1.6 Alyssa P. Hacker doesn't see why if needs to be provided as a 
; special form. "Why can't I just define it as an ordinary procedue in terms of
; cond?" she asks. Alyssa's friend Eva Lu Ator claims this can indeed be done
; , and she defines a new version of if:
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))
(new-if (= 2 3) 0 5)
(new-if (= 1 1) 0 5)

; Delighted, Alyssa uses new-if to rewrite the square-root program:
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
      guess
      (sqrt-iter(improve guess x)
                x)))

; Additional procedures needed for Alyssas square-root program:
; procedure to improve the guess. Takes a guess and the original value and
; returns back the improved guess
(define (improve guess x)
  (average guess (/ x guess)))

; procedure to compute the average between two points
(define (average x y)
  (/ (+ x y) 2))

; takes in a guess and the original value and sees if the guess is within a 
; hard-coded tolerance. Returns True if it is and False otherwise
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

; returns the square of a number
(define (square x) (* x x))

; wrapper around the iteration procedure where the starting guess is hard-coded
; to be 1
(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9)
; This gets stuck in an infinite loop because of applicative order evalutation,
; the third argument in new-if is evaluated everytime it is called resulting
; in infinite recursion
