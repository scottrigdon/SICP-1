; Exercise 2.7. Alyssa's program is incomplete because she as not specified the
; implementation of the interval abstractio. Here is a definition of the 
; interval constructor:

(define (make-interval a b) (cons a b))

; Define selectors upper-bound and lower-bound to complet the implementation.

(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))

