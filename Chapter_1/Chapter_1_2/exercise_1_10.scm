; Exercise 1.10 The following procedure computes a mathematical function 
; called Ackermann's function.

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

; What are the values of the following expressions?
(A 1 10)
; only way to figure this out is to lay it out
; (A 1 10)
; (A 0 (A 1 9))
; (A 0 (A 0 (A 1 8)))
; (A 0 (A 0 (A 0 (A 1 7))))
; (A 0 (A 0 (A 0 (A 0 (A 1 6)))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 5))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 4)))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 3))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 2)))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 1))))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2)))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 4))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 8)))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 16))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 32)))))
; (A 0 (A 0 (A 0 (A 0 64))))
; (A 0 (A 0 (A 0 128)))
; (A 0 (A 0 256))
; (A 0 512)
; 1024

(A 2 4)
; once again lets go through how this is called
; (A 2 4)
; (A 1 (A 2 3))
; (A 1 (A 1 (A 2 2)))
; (A 1 (A 1 (A 1 (A 2 1))))
; (A 1 (A 1 (A 1 2)))
; (A 1 (A 1 (A 0 (A 1 1))))
; (A 1 (A 1 (A 0 2)))
; (A 1 (A 1 4))
; (A 1 (A 0 (A 1 3)))
; (A 1 (A 0 (A 0 (A 1 2))))
; (A 1 (A 0 (A 0 (A 0 (A 1 1)))))
; (A 1 (A 0 (A 0 (A 0 2))))
; (A 1 (A 0 (A 0 4)))
; (A 1 (A 0 8))
; (A 1 16)
; equivalent to 2^16
; 65536

(A 3 3)
; once again lets go through how this is called
; (A 3 3)
; (A 2 (A 3 2))
; (A 2 (A 2 (A 3 1)))
; (A 2 (A 2 2))
; (A 2 (A 1 (A 2 1)))
; (A 2 (A 1 2))
; (A 2 (A 0 (A 1 1)))
; (A 2 (A 0 2))
; (A 2 4)
; 65536

; Consider the following procedures, where A is the procedure defined above, 
; give precise mathematical definitions for the functions computed by the
; procedures f, g, h for the positive integer values of n.

(define (f n) (A 0 n))
; should be 4
(f 2)
; should be 20
(f 10)
; f(n) = 2*n

(define (g n) (A 1 n))
; should be 4
(g 2)
; should be 16
(g 4)
; g(n) = 2^n

(define (k n) (A 2 n))
; should be 4
(k 2)
; should be 16
(k 3)
; should be 65536
(k 4)
; k(n) = 2^2^...^(n-1 times)
