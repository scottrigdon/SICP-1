; Exercise 1.11 A function f is defined by the rule that f(n) = n if
; n < 3 and f(n) = f(n-1) + 2*f(n-2) + 3*f(n-3) if n>= 3. Write a procedure
; that computes f by means of a recursive process. Write a procedure that
; computes f by means of an iterative process

; recursively defined
(define (f n)
  (cond ((< n 3) n)
  (else (+ (f (- n 1)) 
           (* 2 (f (- n 2)))
           (* 3 (f (- n 3)))))))

; iteratively defined
(define (f2 n)
    (define (f_iter a b c count)
        (if (= count 0)
          a
          (f_iter b 
                  c
                  (+ c (* 2 b) (* 3 a))
                  (- count 1))))
    (f_iter 0 1 2 n))
; end of functions

(f 1)
(f 2)
(f 3)
(f 4)
(f2 1)
(f2 2)
(f2 3)
(f2 4)
