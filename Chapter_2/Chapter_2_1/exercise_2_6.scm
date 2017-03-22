; Exercise 2.6. In case representing pairs as procedures wasn't mind-boggling
; enough, consider that, in a languaged that can manipulate procedures, we can
; get by without numbers (at least insofar as nonnegative integers are
; concerned) by implementing 0 and the operation of adding 1 as

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

; This representation is known as Church numerals, after its inventor, Alonzo
; Church, the logician who invented the lambda calculus.
;
; Define one and two directly (not in terms of zero and add-1). (Hint: Use
; substitution to evalute (add-1 zero)). Give a direct definition of the
; addition procedure + (not in terms of repeated application of add-1).

; zero ends up returning a procedure that takes as input a procedure and returns
; a second procedure that doesn't do anything. To test this, I will use a 
; suggestion from
;http://www.billthelizard.com/2010/10/sicp-26-church-numerals.html
; and use the 1+ procedure to test everything with.

; test
; expect 1
((zero 1+) 1)
; Here you can see that zero is defined as the procedure that applies the passed
; procedure 0 times.

; The add-1 procedure takes another church numeral and causes the function to
; first be evaluated according to that church numeral, and then evaluated one
; more time.

;expect 2
(((add-1 zero) 1+) 1)

;expect 3
(((add-1 (add-1 zero)) 1+) 1)

; We can define one and two as the application of function f once or twice

(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

;expect 2
((one 1+) 1)

; expect 3
((two 1+) 1)

; Finally we can define addition as the composition of two church numerals
(define (add-church n1 n2)
  (lambda (f) (lambda (x) ((n1 f) ((n2 f) x)))))

; expect 4
(((add-church one two) 1+) 1)
