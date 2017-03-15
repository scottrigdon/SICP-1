; Exercise 1.31 The sum procedure is only the simplest of a vast number of 
; similar abstractions that can be captured as higher-order procedures. Write
; an analogous procedure called product that returns the product of values
; of a function a points over a given range. Show how to define factorial in 
; terms of product. Also use product to compute approximations to pi using the
; formula:
;         0   1   2   3   4   5      0   1   2   3   4   5
; pi/4 = (2 * 4 * 4 * 6 * 6 * 8...)/(3 * 3 * 5 * 5 * 7 * 7 ...)

; We will mimic this off of the sum operator, first the recursive version

; this was the sum recursive version
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

; here is the product recursive version
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

; here is factorial in terms of product
(define (identity x) x)
(define (inc x) (+ x 1))
(define (factorial n)
  (product identity 1 inc n))
; testing
; should be 1
(factorial 1)
; should be 6
(factorial 3)
; should be 120
(factorial 5)

; approximating pi

(define (approx-pi n)
  (define (numer x)
    (if (= (remainder x 2) 0)
        (+ x 2)
        (+ x 3)))
  (define (denom x)
    (if (= (remainder x 2) 0)
        (+ x 3)
        (+ x 2)))
  (define (term-val x)
    (/ (numer x) (denom x)))
  (* 4.0 (product term-val 0 inc n)))

(approx-pi 1)
(approx-pi 2)
(approx-pi 3)
(approx-pi 4)
(approx-pi 5)
(approx-pi 10000)

; b. If your product procedure generates a recursive process, write one that
; generates an iterative process. If it generates an iterative process, write
; one that generates a recursive process.

(define (product1 term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (identity x) x)
(define (inc x) (+ x 1))
(define (factorial n)
  (product1 identity 1 inc n))
; testing
; should be 1
(factorial 1)
; should be 6
(factorial 3)
; should be 120
(factorial 5)

; approximating pi

(define (approx-pi n)
  (define (numer x)
    (if (= (remainder x 2) 0)
        (+ x 2)
        (+ x 3)))
  (define (denom x)
    (if (= (remainder x 2) 0)
        (+ x 3)
        (+ x 2)))
  (define (term-val x)
    (/ (numer x) (denom x)))
  (* 4.0 (product1 term-val 0 inc n)))

(approx-pi 1)
(approx-pi 2)
(approx-pi 3)
(approx-pi 4)
(approx-pi 5)
(approx-pi 10000)
