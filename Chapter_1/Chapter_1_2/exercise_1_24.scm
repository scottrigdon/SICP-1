; Exercise 1.24. Modify the timed-prime-test procedure of exercise 1.22 to use
; fast-prime? (the Fermat method), and test each of the 12 primes you found in
; that exercise. Since the Fermat test has O(log n) growth, how would you expect
; the time to test primes near 1,000,000 to compare with the time needed to test
; primes near 1000? Do your data bear this out? Can you explain any discrepancy
; you find?


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

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (fast-prime? n 100)
      (report-prime n (- (runtime) start-time))))

(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes start end)
  (timed-prime-test start)
  (if (> (+ start 2) end)
    start
    (search-for-primes (if (even? start) (+ start 1) (+ start 2))
                        end)))
; tests
(search-for-primes 1000000000 1000000021)
(search-for-primes 10000000000 10000000061)
(search-for-primes 100000000000 100000000057)
(search-for-primes 1000000000000 1000000000063)
; computer is too fast to see the timing. But I would suspect it to grow 
; linearly with the number of digits (hence logarithimic growth)
