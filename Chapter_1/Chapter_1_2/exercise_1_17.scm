; Exercise 1.17. The exponentiation algorithms in this section are based on
; performing exponentiation by means of repeated multiplication. In a similar
; way, one can perform integer multiplication by means of repeated addition.
; The following multiplication procedure (in which it is assumed that our
; language can only add, not multiply) is analogous to the expt procedure:

(define (* a b)
  (if (= b 0)
    0
    (+ a (* a (- b 1)))))
; This algorithm takes a number of steps that is linear in b. Now suppose we
; include, together with addition, operations double, which doubles an integer,
; and halve, which divides an (even) integer by 2. Using these, design
; a multiplication procedure analogous to fast-expt that uses a logarithimic
; number of steps

; First define halve and double:

(define (double n)
  (+ n n))

(define (halve n)
  (/ n 2))

(define (even? n)
  (= (remainder n 2) 0))

; Now define recursive algorithim for multiplication
; this looks almost identical to the recursive algorithm defined for fast-expt
(define (fast* b n)
  (cond ((= n 0) 0)
        ((even? n) (double (fast* b (halve n))))
        (else (+ b (fast* b (- n 1))))))
; testing
; should be 1
(fast* 1 1)
; should be 15
(fast* 5 3)
; should be 120
(fast* 10 12)
; should be 120
(fast* 12 10)

                   
