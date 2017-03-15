; Exercise 1.18 Using the results of exercises 1.16 and 1.17, devise a procedure
; that generates an iterative process for multiplying two integers in terms of
; adding, doubling, and halving and uses a logarithmic number of steps.

; First define halve and double:

(define (double n)
  (+ n n))

(define (halve n)
  (/ n 2))

(define (even? n)
  (= (remainder n 2) 0))

(define (fast* b n)
  (*_iter b n 0))
(define (*_iter b n a)
  (cond ((= n 0) a)
        ((even? n) (*_iter (double b) (halve n) a))
        (else (*_iter b (- n 1) (+ a b)))))
; testing
; should be 1
(fast* 1 1)
; should be 15
(fast* 5 3)
; should be 120
(fast* 10 12)
; should be 120
(fast* 12 10)
