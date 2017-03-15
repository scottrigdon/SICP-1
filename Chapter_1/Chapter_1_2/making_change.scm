; Apparently making change for any amount a for n kinds of coins can be reduced
; to the following:
; 1. the number of ways to change amount a using all but the first kind of coin,
; plus
; 2. the number of ways to change amount a-d using all n kinds of coins, where
; d is the denomination of the first kind of coin.
;
; Recursively defined boundary conditions:
; 1. If a is exactly 0, that counts as 1 way to make change.
; 2. If a is less than 0, that counts as 0 ways to make change.
; 3. If n is 0, that counts as 0 ways to make change.

(define (count-change amount)
    (cc amount 5)
(define (cc amount kinds-of-coins))
    (cond ((= amount 0) 1)
          ((or (< amount 0) (= kinds-of-coins 0)) 0)
          (else (+ (cc amount
                       (- kinds-of-coins 1))
                   (cc (- amount
                          (first-denomination kinds-of-coins))
                       kinds-of-coins)))))
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

