; Exercise 1.33 You can obtain an even more general version of accumulate
; (exercise 1.32) by introducing the notion of a filter on the terms to be
; combined. That is, combine only those terms derived from values in the range
; that satisfy a specified condition. The resulting filtered-accumulate
; abstraction takes the same arguments as accumulate, together with an
; additional predicate of one argument that specifies the filter. Write
; filtered-accumulate as a procedure.

; iterative version is better in terms of resources
(define (filtered-accumulate filt combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) 
              (cond ((filt  a) (combiner result (term a)))
                    (else result)))))
  (iter a null-value))

; test filtered-accumulate
(define (ident x) x)
(define (filt-sum filt a b)
  (filtered-accumulate filt + 0 ident a 1+ b))
(define (ident-filt x) #t)
; expect 15
(filt-sum ident-filt 1 5)
; expect 6
(filt-sum even? 1 5)
; expect 9
(filt-sum odd? 1 5)

; Show how to express the following using filtered-accumulate:
; a. the sum of squares of the prime numbers in the interval a to b (assuming
; that you have a prime? predicate already written)
; 

; code taken from exercise_1_22, uses inefficient test to calculate if something
; is prime or not

(define (square x) (* x x))
(define (smallest-divisor n)
    (define (divides? a b)
        (= (remainder b a) 0))
    (define (find-divisor n test-divisor)
        (cond ((> (square test-divisor) n) n)
              ((divides? test-divisor n) test-divisor)
              (else (find-divisor n (+ test-divisor 1)))))
    (find-divisor n 2))


(define (prime? n)
  (if (= n 1) false (= n (smallest-divisor n))))

; now new code
(define (sum-square-prime a b)
  (filtered-accumulate prime? + 0 square a 1+ b))
; should be 2^2 + 3^2 + 5^2 + 7^2 = 4 + 9 + 25 + 49 = 38 + 49 = 87
(sum-square-prime 1 10)

; b. the product of all the positive integers less than n that are relatively
; prime to n (i.e., all positive integers i < n such that the GCD(i, n) = 1)

; taken from the text book:

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
; now new code
(define (product-relative-prime n)
    (define (gcd? x)
      (= 1 (gcd x n)))
    (filtered-accumulate gcd? * 1 ident 1 1+ n))
; should be 189
(product-relative-prime 10)
