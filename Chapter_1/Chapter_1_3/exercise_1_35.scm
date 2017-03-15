; Exercise 1.35. Show that the golden ratio phi (section 1.2.2) is a fixed point
; of the transformation x |--> 1 + 1/x, and use this fact to compute phi by
; means of the fixed-point procedure. The golden ratio satifies the equation
; phi^2 = phi + 1. If thats the case then phi = 1 + 1/phi. Therefore if we find
; the point where phi(x) = 1 + 1/phi(x) then we have found the golden ratio

; fixed point as defined by the book:
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

; should be 1.6180
(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)


