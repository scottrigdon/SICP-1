; Exercise 1.4 Observe that our model of evaluation allows for combinations
; whose operators are compound expressions. Use this observation to describe
; the behavior of the following procedure:

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; expectations

; 3
(a-plus-abs-b 1 2)

; 3
(a-plus-abs-b 1 -2)

; 1
(a-plus-abs-b -1 2)

; If b < 0 then it will use the - operation, otherwise it uses
; the plus operation between a and b. The model of evaluation from the book will
; 1. evaluate the subexpression of the combination (which will result in the
;    + or - operator)
; 2. apply the procedure that is the value of the left most subexpression to the
;    arguments that are the values of the other subexpressions (the operands)
