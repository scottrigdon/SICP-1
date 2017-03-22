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

;tests

; should be 3
(sqrt 9)
; should be ~11.7047
(sqrt (+ 100 37))
; should be ~1.773771
(sqrt (+ (sqrt 2) (sqrt 3)))
; should be 1000
(square (sqrt 1000))
