; Exercise 1.26. Louis Reasoner is having great difficulty doing exercise 1.24
; His fast-prime? test seems to run more slowly than his prime? test. Louis 
; calls his firend Eva Lu Ator over to help. When they examine Louis's code,
; they find that he has rewritten the expmod procedure to use an explicit 
; multiplication, rather than calling square:

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

; Here, instead of making one call to expmod and returning the value to be
; squared, this calls expmod twice. This turns it from a linear recursive
; process that was O(log n) into a tree recursive process that grows 
; exponetially with depth of the tree. In this case the depth of the tree is
; log n therefore this converts the O(log n) process into a O(n) process.

