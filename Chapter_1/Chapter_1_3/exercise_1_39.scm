; Exercise 1.39 A continued fraction representation of the tangent function was
; published in 1770 by the German mathematician J.H. Lambert:
; 
; tan r = x/ (1-x^2/(3-x^2/(5-...))) where x is in radians. 
;
; Define a procedure (tan-cf x k) that computes an approximation to the tangent
; function based on Lambert's formula. K specifies the number of terms to
; compute, as in exercise 1.37.

(define (cont-frac n d k)
  (define (cont-iter i res)
    (if (= i 0)
        res
        (cont-iter (- i 1)
                   (/ (n i) (+ (d i) res)))))
  (cont-iter k 0.0))

(define (square x) (* x x))
(define (tan-cf x k)
  (cont-frac (lambda (i) (if (= i 1)
                             x
                             (- (* x x))))
             (lambda (i) (- (* i 2) 1))
             k))

(tan-cf (/ 3.14 4) 2000)

