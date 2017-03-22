; Exercise 1.38 In 1737, the Swiss mathematician Leonhard Euler published a 
; memoir De Fractionibus Continuis, which included a continued fraction 
; expansion for e-2, where e is the base of the natural logarithms. In this
; fraction, the Ni are all 1, and the Di are successively: 
; 1  2  3  4  5  6  7  8  9 10  11
; 1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, .... Write a program that uses your cont-frac
; procedure from exercise 1.37 to approximate e, based on Euler's expansion.

; if n-2 % 3 = 0 then k = (n-2)/3*2 + 2
; else k = 1

; Here we need to define a procedure to return the denominator for i
(define (denom-euler i)
  ; If its 1 or 2 we just return those values
  (cond ((or (= i 1) (= i 2))
         i)
        ; otherwise we return that pattern I defined above
        ((= (remainder (- i 2) 3) 0)
        (+ (* (/ (- i 2) 3) 2) 2))
        (else 1)))

; this is my iterative procedure from 1.37
(define (cont-frac n d k)
  (define (cont-iter i res)
    (if (= i 0)
        res
        (cont-iter (- i 1)
                   (/ (n i) (+ (d i) res)))))
  (cont-iter k 0.0))

(define (euler-approx k)
    (+ 2 (cont-frac (lambda (x) 1.0) denom-euler  k)))
(euler-approx 20)
