; Exercise 1.3 Define a procedure that takes three numbers as arguments and
; returns the sum of the squares of the two larger numbers.

; helper function to return the larger of two numbers
(define (larger x y) (if (< x y) 
                       y 
                       x))

; helper function to return the smaller of two numbers
(define (smaller x y) (if (> x y) 
                       y 
                       x))

; helper functions to return the sum of squares of two numbers
(define (square x) (* x x))
(define (sum_of_squares x y) (+ (square x) 
                                (square y)))

; Now finally the main function
; (larger x (larger y z)) gives you the largest of the 3 numbers
; (larger (smaller x y) (smaller y z)) gives you the second largest number of
; the 3 by first getting the 2 smallest numbers, and then returning the largest
; of those two.
(define (final x y z) (sum_of_squares (larger x y)
                                      (larger (smaller x y) z)))
;tests
; expect 13 for all
(final 1 2 3)
(final 3 2 1)
(final 1 3 2)
(final 2 3 1)
