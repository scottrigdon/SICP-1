; newtons method for determining the sqrt

; main procedure
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
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
(sqrt (+ 100 37))
(sqrt (+ (sqrt 2) (sqrt 3)))
(square (sqrt 1000))
