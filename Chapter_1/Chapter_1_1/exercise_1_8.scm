; Exercise 1.8 Newton's method for cube roots is based on the fact that if y is
; an approximation to the cube root of x, then a better approximation is given 
; by the value x/y^2 + 2y/3
; Use this formula to implement a cube-root procedure analogous to the square
; root procedure.

; newtons method for determining the sqrt

; main procedure
(define (cubert-iter guess last_guess x)
  (if (good-enough? guess last_guess)
      guess
      (cubert-iter (improve guess x)
                 guess x)))
; improve function
(define (improve guess x)
  (/ (+ (/ x (* guess guess))
        (* 2 guess))
     3))
; good enough? function
(define (good-enough? guess last_guess)
  (<= (abs (- guess last_guess)) 
     (* guess 0.001)))
; cube function
(define (cube x) (* x x x))

; finally define start point
(define (cubert x)
  (if (< x 0)
    (* -1 (cubert-iter 1.0 2.0 (abs x)))
    (cubert-iter 1.0 2.0 x)))

(cube (cubert 40))
(cube (cubert 0.000001))
(cube (cubert 10000000))
(cube (cubert -5))


