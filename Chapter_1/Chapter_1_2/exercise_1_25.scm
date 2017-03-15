; Exercise 1.25 Alyssa P. Hacker complains that we went to a lot of extra work
; in writing expmod. After all, she says, since we already know how to compute
; exponentials, we could have siply written:
;
(define (expmod base exp m)
  (remainder (fast-expt base exp) m))
; Is she correct? Would this procedure serve as well for our fast prime tester?
; Explain.
;
; No, she is not correct as this would cause the procedure to calculate large
; exponentials which is avoided with expmod. This is alluded to in the footnote
