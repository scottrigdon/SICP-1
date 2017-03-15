; Exercise 1.41. Define a procedure double that takes a procedure of one
; argument as an argument and returns a procedure that applies the original
; procedure twice. For example, if inc is a procedure that adds 1 to its
; argument then (double inc) should be a procedure that adds 2. What value is
; returned by (((double (double double)) inc) 5)

(define (double f)
  (lambda (x) (f (f x))))

(define (inc x)
  (+ x 1))

; first test that double works
; should return 5
( (double inc) 3)

; this increments by 16 instead of 1
(((double (double double)) inc) 5)
; (double (inc (inc (inc (inc x)))))
;  (inc (inc (inc (inc (  (inc (inc (inc (inc x))))  )))))

; lets break it down:
; This increments by 4 instead of 2
(((double double) inc) 5)
; (inc (inc (inc (inc x))))

