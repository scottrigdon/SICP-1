; Exercise 1.37 a. An infinite continued fraction is an expression of the form
; f = N1/ (D1 + (N2/ (D2 + (N3 / (D3 + ...)))))
; As an example, one can show that the infinite continued fraction expansion
; with the Ni and the Di all equal to 1 produces 1/phi where phi is the golden
; ratio (described in section 1.2.2). One way to approximate an infinite
; continued fraction is to truncate the expansion after a given number of terms.
; Such a truncation -- a so-called k-term finite continued fraction -- has the
; form
; f = N1/ (D1 + (N2/ (D2 + (Nk / Dk))))
; Suppose that n and d are procedures of one argument (the term index i) that
; return Ni and Di of the terms of the continued fraction. Define a procedure
; cont-frac such that evaluating (cont-frac n d k) computes the value of the
; k-term finite continued fraction. Check your procedure by approximating 1/phi
; using (cont-frac (lambda (i) 1.0)
;                  (lambda (i) 1.0)
;                  k)
; for successive values of k. How large must you make k in order to get an
; approximation that is accurate to 4 decimal places?

; iterative is easier for me to think about so lets start with that
(define (cont-frac n d k)
  ; here i is a counter and res is the result
  (define (cont-iter i res)
    ; once the counter gets down to 0 we return the result
    (if (= i 0)
        res
        ; otherwise you decrement the counter by 1 and divide numerator at i by
        ; the denominator at i (+ the already accumulating result)
        (cont-iter (- i 1)
                   (/ (n i) (+ (d i) res)))))
  (cont-iter k 0.0))

(define (test-vals a b)
  (cond ((> a b)
        (newline)
        (display "End of test")
        0)
       (else  
         (newline)
         (display a)
         (display ":")
         (display (cont-frac (lambda (i) 1.0)
                             (lambda (i) 1.0)
                             a))
         (test-vals (+ a 1) b))))
(test-vals 1 10)

; b. If your cont-frac procedure generates a recursive process, write one
; that generates an iterative process. If it generates an iterative process, 
; write one that generates a recursive process

(define (cont-frac n d k)
  (define (cont-recur j)
    (if (> j k)
        0
        (/ (n j) 
           (+ (d j) 
              (cont-recur (1+ j))))))
  (cont-recur 1.0))

(test-vals 1 10)
        
