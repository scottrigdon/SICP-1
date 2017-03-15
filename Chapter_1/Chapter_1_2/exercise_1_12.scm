; Exercise 1.12 The following pattern of numbers is called Pascal's Triangle   
;                             1                                                
;                           1   1                                              
;                         1   2   1                                            
;                       1   3   3   1                                          
;                     1   4   6   4   1                                        
; The numbers at the edge of the triangle are all 1, and each number inside the
; triangle is the sum of the two numbers above it. Write a procedure that 
; computes Pascal's triangle by means of a recursive process

(define (pascal row column)
  (cond ((> column row) 0)
        ((< column 0) 0)
        ((= column 1) 1)
        ((+ (pascal (- row 1) column)
           (pascal (- row 1) (- column 1))))))
; should be 0
(pascal 0 0)
; should be 1
(pascal 1 1)
; should be 1
(pascal 2 1)
; should be 1
(pascal 2 2)
; should be 1
(pascal 3 1)
; should be 2
(pascal 3 2)
; should be 1
(pascal 3 3)
; should be 1
(pascal 4 1)
; should be 3
(pascal 4 2)
; should be 3
(pascal 4 3)
; should be 1
(pascal 4 4)
; should be 1
(pascal 5 1)
; should be 4
(pascal 5 2)
; should be 6
(pascal 5 3)
; should be 4
(pascal 5 4)
; should be 1
(pascal 5 5)



