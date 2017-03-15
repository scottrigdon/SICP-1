; Exercise 2.1 Define a better version of make-rat that handles both positive
; and negative arguments. Make-rat should normalize the sign so that if the 
; rational number is positive, both the numerator and denominator are positive,
; and if the rational number is negative, only the numerator is negative

;Taken from the text
(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (mult-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))
(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))
(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))
; next define that actual nuts and bolts of the rational number
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))
; Now my new make-rat procedure

; I originally had a bunch of conditionals, but I really liked the online
; solution here:
(define (make-rat n d)
  (let ((g ((if (< d 0) - +) (abs (gcd n d)))))
    (cons (/ n g) (/ d g))))


(define test (make-rat -1 2))
(print-rat test)
(define neg_one_half (make-rat 1 -2))
(print-rat neg_one_half)
(define one_half (make-rat -1 -2))
(print-rat one_half)
(print-rat (mult-rat neg_one_half one_half))
(print-rat (mult-rat test neg_one_half))
(print-rat (sub-rat neg_one_half one_half))
(print-rat (sub-rat test neg_one_half))


