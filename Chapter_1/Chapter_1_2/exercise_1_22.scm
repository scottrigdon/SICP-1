; Exercise 1.22. Most Lisp implementations include a primitive called runtime
; that returns an integer that specifies the amount of time the system has been
; running (measured, for example, in microseconds). The following
; timed-prime-test procedure, when called with an integer n, prints n and checks
; to see if n is prime. If n is prime, the procedure prints three asterisks
; followed by the amount of time used in performing the test.

(define (square x) (* x x))
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))))

(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))

; Using this procedure, write a procedure search-for-primes that checks the
; primality of consecutive odd integers in a specified range. Use your procedure
; to find the three smallest primes larger an 1000; larger than 10,000; larger
; than 100,000; larger than 1000000. Note the time needed to test each prime. 
; Since the testing algorithm has order of growth O(sqrt(n)), you should expect
; that testing for primes around 10000 should take about sqrt(10) times as long
; as testing for primes around 1000. Do your timing data bear this out? How
; well do the data for 100,000 and 1,000,000 support the sqrt(n) predicition?
; Is your result compatible with the notion that programs on your machine run in
; time proportional to the number of steps required for the computation?
(define (even? n)
  (divides? 2 n))
(define (search-for-primes start end)
  (timed-prime-test start)
  (if (> (+ start 2) end)
    start
    (search-for-primes (if (even? start) (+ start 1) (+ start 2))
                        end)))
; test the primes above 1000
(search-for-primes 1000 1100)
; test the primes above 10000
(search-for-primes 10000 10100)
; test the primes above 100000
(search-for-primes 100000 100100)
; test the primes above 1000000
(search-for-primes 1000000 1000100)
; this is too fast to get good timing data. Lets try higher
(search-for-primes 1000000000 1000000021)
(search-for-primes 10000000000 10000000061)
(search-for-primes 100000000000 100000000057)
(search-for-primes 1000000000000 1000000000063)
;1 ]=> ; this is too fast to get good timing data. Lets try higher
;(search-for-primes 1000000000 1000000021)
;1000000007 *** .04000000000000001
;1000000009 *** .03999999999999998
;1000000021 *** .03
;;Value: 1000000021
;;
;;1 ]=> (search-for-primes 10000000000 10000000061)
;;10000000019 *** .12999999999999995
;;10000000033 *** .11000000000000004
;;10000000061 *** .15000000000000002
;;;Value: 10000000061
;;;
;;;1 ]=> (search-for-primes 100000000000 100000000057)
;;;100000000003 *** .32999999999999996
;;;100000000019 *** .33000000000000007
;;;100000000057 *** .33000000000000007
;;;;Value: 100000000057
;;;
;;;1 ]=> (search-for-primes 1000000000000 1000000000063)
;;;1000000000039 *** 1.0399999999999998
;;;1000000000061 *** 1.0300000000000002
;;;1000000000063 *** 1.0300000000000002
;;;;Value: 1000000000063
; The timing data did bear out, though I had to go to much higher numbers to be
; able to see it.
