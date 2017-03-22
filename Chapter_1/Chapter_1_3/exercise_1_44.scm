; Exercise 1.44. The idea of smoothing a function is an important concept in
; signal processing. If f is a function and dx is some small number, then the
; smoothed version of f is the function whose value at a point x is the average
; of f(x-dx) , f(x) and f(x+dx). Write a procedure smooth that takes as input
; a procedure that computes f and returns a procedure that computes smoothed f.
; It is sometimes valueable to repeatedly smooth a function (that is, smooth the
; smoothed function, and so on) to obtain the n-fold smoothed function. Show how
; to generate the n-fold smoothed function of any given function using smooth
; and repeated from exercise 1.43.

(define dx 0.000001)
; smooth is just a simple average of the three points with dx defined above
(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx)) 
                    (f x) 
                    (f (+ x dx))) 
                 3)))

; compose and repeated from previous exercises
(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (< n 2)
      f
      (compose f (repeated f (- n 1)))))

(define (repeat-smooth f n)
  ((repeated smooth n) f))


