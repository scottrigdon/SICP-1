; Exercise 1.34: Suppose we define the procedure

(define (f g)
  (g 2))

; Then we have
(f square)
;4

(f (lambda (z) (* z (+ z 1))))
;6

; What happens if we (perversely) ask the interpreter to evaluate the
; combination (f f)? Explain.
;
; Lets see what happens with our substitution model:
; (f f)
; (f 2)
; (2 2)
; error since 2 is not a procedure, but a number
(f f)
