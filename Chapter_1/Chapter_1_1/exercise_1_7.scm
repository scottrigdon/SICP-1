; Exercise 1.7 The good-enough? test used in computing square roots will not be
; very effective for finding the square roots of very small numbers. Also,
; in real computers, arithmetic operations are almost always performed with
; limited precision. This makes our test inadequate for very large numbers.
; Explain these staements, with examples showing how the test fails for small
; and large numbers:

; newtons method for determining the sqrt

; main procedure
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
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

; for the case of very small numbers, the tolerance ends up being greater than
; the number we are testing
(square (sqrt 0.000001))
; for very large numbers, the precision of the operations is limited
(square (sqrt 100000))

; An alternative strategy for implementing good-enough? is to watch how guess
; changes from one iteration to the next and stop when the change is a very
; small fraction of the guess. Design a square-root procedure that uses this
; kind of end test. Does this work better for small and large numbers?

; new_good enough? function
(define (new_good-enough? guess last_guess)
  (<= (abs (- guess last_guess)) 
     (* guess 0.001)))

; main procedure
(define (new_sqrt-iter guess last_guess x)
  (if (new_good-enough? guess last_guess)
      guess
      (new_sqrt-iter (improve guess x)
                 guess x)))
; finally define start point
(define (new_sqrt x)
  (new_sqrt-iter 1.0 2.0 x))

(square (new_sqrt 0.000001))
(square (new_sqrt 100000))
; here we can see this improves the issue with small and large numbers
