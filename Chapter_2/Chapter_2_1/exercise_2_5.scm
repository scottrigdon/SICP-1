; Exercise 2.5. Show that we can represent pairs of nonnegative integers using
; only numbers and arithmetic operations if we represent the pair a and b as the
; integer that is the product (2^a)*(3^b). Give the corresponding definitions of
; the procedures cons, car and cdr.

; the pair creating procedure is simple and defined in the problem statement
; above
(define (pair-cons x y)
  (* (expt 2 x) (expt 3 y)))

; To pull out a, I just repeatedly divide by 2 until the remainder of the
; resultant division and 2 is no longer 0
(define (pair-car z)
  (define (car-iter a i)
    (cond ((< a 2)
           a)
          ((= (remainder a 2) 0)
           (car-iter (/ a 2) (1+ i)))
          (else i))
  )
  (car-iter z 0))

; To pull out b, I just repeatedly divide by 3 until the remainder of the
; resultant division and 2 is no longer 0
(define (pair-cdr z)
  (define (cdr-iter a i)
    (cond ((< a 2)
           a)
          ((= (remainder a 3) 0)
           (cdr-iter (/ a 3) (1+ i)))
          (else i))
  )
  (cdr-iter z 0))

;test

(define z (pair-cons 1 1))
; should be i
(pair-car z)
; should be 1
(pair-cdr z)

(define z (pair-cons 2 4))
; should be 2
(pair-car z)
; should be 4
(pair-cdr z)

(define z (pair-cons 4 2))
; should be 4
(pair-car z)
; should be 2
(pair-cdr z)

  



