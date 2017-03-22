; Exercise 1.8 Newton's method for cube roots is based on the fact that if y is
; an approximation to the cube root of x, then a better approximation is given 
; by the value x/y^2 + 2y/3
; Use this formula to implement a cube-root procedure analogous to the square
; root procedure.

; main iterative procedure, pretty much identical to Newton's method for square
; roots
(define (cubert-iter guess last_guess x)
  (if (good-enough? guess last_guess)
      guess
      (cubert-iter (improve guess x)
                 guess x)))
; improve function, this is given from the newtons method for cube roots
(define (improve guess x)
  (/ (+ (/ x (* guess guess))
        (* 2 guess))
     3))
; good enough? function, using the good enough function from exercise 1.7
(define (good-enough? guess last_guess)
  (<= (abs (- guess last_guess)) 
     (* guess 0.001)))

; returns the cube of a number
(define (cube x) (* x x x))

; finally define the wrapper for the cubert. We have to deal with the fact that
; numbers can be positive or negative in cube roots. Here we just take the abs
; value of x and add the negative when it is needed. Initial guesses are 1 and
; 2.
(define (cubert x)
  (if (< x 0)
    (* -1 (cubert-iter 1.0 2.0 (abs x)))
    (cubert-iter 1.0 2.0 x)))

; tests
; expect 40
(cube (cubert 40))
; 0.000001
(cube (cubert 0.000001))
; 10000000
(cube (cubert 10000000))
; -5
(cube (cubert -5))


