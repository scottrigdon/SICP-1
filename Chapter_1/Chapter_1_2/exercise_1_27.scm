; Exercise 1.27. Demonstrate that the Carmichael numbers listed in footnote 47
; really do fool the Fermat test. That is, write a procedure that takes an
; integer n and tests whether a^n is congruent to a modulo n for every a<n, and
; try your procedure on the given Carmichael numbers: 561, 1105, 1729, 2465,
; 2821, 6601.


(define (square x) (* x x))

(define (even? n)
  (= (remainder n 2) 0))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

(define (full-fermat-test n)
  (try-it (- n 1) n))
(define (try-it a n)
    (cond ((= a 0) true)
          ((= (expmod a n n) a) (try-it (- a 1) n))
          (else false)))
; test a false value
(full-fermat-test 10)
; test the given Carmichael numbers
(full-fermat-test 561)
(full-fermat-test 1105)
(full-fermat-test 1729)
(full-fermat-test 2465)
(full-fermat-test 2821)
(full-fermat-test 6601)

