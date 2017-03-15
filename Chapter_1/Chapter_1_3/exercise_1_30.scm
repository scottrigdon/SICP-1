; Exercise 1.30 The sum procedure above generates a linear recursion. The 
; procedure can be rewritten so that the sum is performed iteratively. Show how
; to do this by filling in the missing expressions in the following definition.
;
; (define (sum term a next b)
;   (define (iter a result)
;     (if <??>
;         <??>
;         (iter <??> <??>)))
; (iter <??> <??>))

; here is the linear recursive version
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

; now define the new iterative version
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))
; test
(define (identity x) x)
(define (incr x) (+ x 1))
(sum identity 0 incr 10)
