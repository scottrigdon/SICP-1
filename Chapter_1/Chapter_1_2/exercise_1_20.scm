; Exercise 1.20. The process that a procedure generates is of course dependent
; on the rules used by the interpreter. As an example, consider the iterative
; gcd procedure given above. Suppose we were to interpret this procedure using
; normal-order evaluation. Using substitution method (for normal order),
; illustrate the process generated in evaluating (gcd 206 40) and indicate
; the remainder operations that are actually performed. In the applicative-order
; evaluation?
;
(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

; (gcd 206 40)
;
; (if (= 40 0) ... )
;
; (gcd 40 (remainder 206 40))
;
; (if (= (remainder 206 40) 0) ...)
;
; (if (= 6 0) ...)
;
; (gcd (remainder 206 50) (remainder 40 (remainder 206 40)))
;
; (if (= (remainder 40 (remainder 206 40)) 0) ...)
;
; (if (= 4 0) ...)
;
; (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;
; and so on. Bascially it calls it alot.
;
; Here is the applicative order calls
;
; (gcd 206 40)
; (gcd 40 (remainder 206 40))
; (gcd 40 10)
; (gcd 10 (remainder 40 10))
; (gcd 10 4)
; (gcd 4 (remainder 10 4))
; (gcd 4 2)
; (gcd 2 (remainder 4 2))
; (gcd 2 0)
; 2
;
