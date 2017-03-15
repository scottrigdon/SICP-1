; Exercise 1.23. The smallest-divisor procedure shown at the start of this
; section does lots of needless testing: After it checks to see if the number
; is divisible by 2 there is no point in checking to see if it is divisible by
; any larger even numbers. This suggests that the values used for test-divisor
; should not be 2,3,4,5,6,..., but rather 2,3,5,7,9,.... To implement this 
; change, define a procedure next that returns 3 if its input is equal to 2 and
; otherwise returns its input plus 2. Modify the smallest-divisor procedure to
; use (next test-divisor) instead of (+ test-divisor 1). With timed-prime-test
; incorporating this modified version of smallest-divisor, run the test for
; each of the 12 primes found in exercise 1.22. Since this modification halves
; the number of test steps, you should expect it to run about twice as fast. Is
; this expectation confirmed? If not, what is the observed ratio of the speeds
; of the two algorithms, and how do you explain the fact that it is different
; from 3?

(define (next x) 
  (if (= x 2) 
    3
    (+ x 2)))

(define (square x) (* x x))
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

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

(define (even? n)
  (divides? 2 n))
(define (search-for-primes start end)
  (timed-prime-test start)
  (if (> (+ start 2) end)
    start
    (search-for-primes (if (even? start) (+ start 1) (+ start 2))
                        end)))
; this is too fast to get good timing data. Lets try higher
(search-for-primes 1000000000 1000000021)
(search-for-primes 10000000000 10000000061)
(search-for-primes 100000000000 100000000057)
(search-for-primes 1000000000000 1000000000063)

;(search-for-primes 1000000000 1000000021)
;1000000007 *** 2.0000000000000004e-2
;1000000009 *** .01999999999999999
;1000000021 *** .01999999999999999
;;Value: 1000000021
;;
;;1 ]=> (search-for-primes 10000000000 10000000061)
;;10000000019 *** .06
;;10000000033 *** .07
;;10000000061 *** .07
;;;Value: 10000000061
;;;
;;;1 ]=> (search-for-primes 100000000000 100000000057)
;;;100000000003 *** .19999999999999996
;;;100000000019 *** .21000000000000008
;;;100000000057 *** .20000000000000007
;;;;Value: 100000000057
;;;
;;;1 ]=> (search-for-primes 1000000000000 1000000000063)
;;;1000000000039 *** .6399999999999999
;;;1000000000061 *** .6599999999999999
;;;1000000000063 *** .6699999999999999
;;;;Value: 1000000000063
;The observed ratio is not quite 2 but is closer to 1.5. This may be do to the
;extra if statement added in next.
