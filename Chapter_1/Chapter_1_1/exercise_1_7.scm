; Exercise 1.7 The good-enough? test used in computing square roots will not be
; very effective for finding the square roots of very small numbers. Also,
; in real computers, arithmetic operations are almost always performed with
; limited precision. This makes our test inadequate for very large numbers.
; Explain these staements, with examples showing how the test fails for small
; and large numbers:

; newtons method for determining the sqrt from the textbook

; main iteration procedure. This will keep improving the guess until it is
; considered "good enough" by the good-enough procedure. Once it is good enough
; it will return the best guess
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter(improve guess x)
                x)))

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

; for the case of very small numbers, the tolerance ends up being greater than
; the number we are testing
(square (sqrt 0.000001))
; for very large numbers, the precision of the operations is limited and can
; result in the iteration getting stuck in an infinite recursion
;(square (sqrt 9999999999998))

; An alternative strategy for implementing good-enough? is to watch how guess
; changes from one iteration to the next and stop when the change is a very
; small fraction of the guess. Design a square-root procedure that uses this
; kind of end test. Does this work better for small and large numbers?

; new_good enough? function takes in last_guess instead of the original number
(define (new_good-enough? guess last_guess)
  (<= (abs (- guess last_guess)) 
     (* guess 0.001)))

; main procedure
(define (new_sqrt-iter guess last_guess x)
  (if (new_good-enough? guess last_guess)
      guess
      (new_sqrt-iter (improve guess x)
                 guess x)))
; finally define the new wrapper for the function
(define (new_sqrt x)
  (new_sqrt-iter 1.0 2.0 x))

(square (new_sqrt 0.000001))
(square (new_sqrt 9999999999998))
; here we can see this improves the issue with small and large numbers
