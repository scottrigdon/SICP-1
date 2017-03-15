; Exercise 2.4 Here is an alternative procedural representation of pairs. For 
; this representation, verify that (car (cons x y)) yields x for any objects
; x and y.
;

; this creates a function that takes a function that acts on x and y
(define (cons x y)
  (lambda (m) (m x y)))

; this returns the first element by created a function that takes two values and
; returns the first value, this is then passed to the anonymous function created
; for cons which then acts on its x and y and returns y
(define (car z)
  (z (lambda (p q) p)))

; What is the corresponding definition of cdr? (Hint: To verify that this works,
; make use of the substitution model of section 1.1.5.)

(define t (cons 1 2))
(car t)

; this returns the compound procedure
; t = (lambda (m) (m 1 2))
; (car t)
; (car (lambda (m) (m 1 2)))
; ((lambda (p q) p) 1 2)
; ((1 2) 1)
; 1

(define (cdr z)
  (z (lambda (p q) q)))


