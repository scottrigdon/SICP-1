; Exercise 1.28. One variant of the Fermat test that cannot be fooled is called
; the Miller-Rabin test. This starts from an alternate form of Fermat's Little
; Theorem, which states that if n is a prime number and a is any positive
; integer less than n, then a raised to the (n-1)st power is congruent to
; 1 modulo n. To test the primality of a number n by the Miller-Rabin test, we
; pick a random number a<n and raise a to the (n-1)st power modulo n using the
; expmod procedure. However, whenever we perform the squaring step in expmod, we
; check to see if we have discovered a "nontrivial square root of 1 modulo n,"
; that is, a number not equal to 1 or n-1 whose square is prime. It is also
; possible to prove that if n is an odd number that is not prime, then, for at
; least half the numbers a<n, computing a^n-1 in this way will reveal
; a nontrivial square root of 1 modulo n.(This is why the Miller-Rabin test
; cannot be fooled.) Modify the expmod procedure to signal if it discovers
; a nontrivial square root of 1, and use this to implement the Miller-Rabin test
; with a procedure analogous to fermat-test. Check your procedure by testing
; various known primes and non-primes. Hint: One convenient way to make expmod
; signal is to have it return 0.


(define (square x) (* x x))

(define (even? n)
  (= (remainder n 2) 0))
; had to take this from an SICP blog to get this. To check for a "nontrivial
; square root of 1 modulo n" You can add a check to every time you would
; normally square the value. You return 0 if the value is not 1 or n-1 and
; it is prime
(define (square-check x m)
    (if (and (not (or (= x 1) (= x (- m 1))))
             (= (remainder (* x x) m) 1))
            0
        (remainder (* x x) m)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (square-check (expmod base (/ exp 2) m)
                        m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((miller-rabin-test n) (fast-prime? n (- times 1)))
        (else false)))
(fast-prime? 7 10)
(fast-prime? 10 10)
(fast-prime? 561 10)
(fast-prime? 1105 10)
(fast-prime? 1729 10)
(fast-prime? 2465 10)
(fast-prime? 2821 10)
(fast-prime? 6601 10)
