; Exercise 1.43. If f is a numerical function and n is a positive integer, then
; we can form the nth repeated application of f, which is defined to be the
; function whose value at x is f(f(...(f(x))...)). For example, if f is the
; function x :--> x + 1, then the nth repeated application of f is the function
; x |--> x+ n. If f is the operation of squaring a number, then the nth repeated
; application of f is the function that raises its argument to the 2^nth power.
; Write a procedure that takes as inputs a procedure that computes f and a 
; positive integer n and returns the procedure that computes the nth repeated
; application of f. Your procedure should be able to be used as follows:
; ((repeated square 2) 5) 625

(define (compose f g)
  (lambda (x) (f (g x))))

; this was my original solution and it works but is unneccesarily complex, and
; does not deal with the condition that n is less than 1
(define (repeated f n)
  (define (rep-iter new_f counter)
    (if (= counter n)
        new_f
        (rep-iter (compose f new_f) (1+ counter))))
  (rep-iter f 1))

; new solution, recursive and simpler, with error handling
(define (repeated f n)
  (if (< n 2)
      f
      (compose f (repeated f (- n 1)))))


(define (square x)
  (* x x))

; should be 625
((repeated square 2) 5)
