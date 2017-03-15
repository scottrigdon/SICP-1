; Exercise 1.29 Simpsons Rule is a more accurate method of numerical integration
; than the method illustrated above. Using Simpson's Rule, the integral of a 
; function f between a and b is approximated as
; h/3 [y0 + 4y1 + 2y2 + 4y3 + 2y4 + ... + 2yn-2 + 4yn-1 + yn]
;
; where h= (b-a)/n for some even integer n and yk = f(a+kh). (Increasing n
; increases the accuracy of the approximation.) Define a procedure that takes
; as arguments f, a, b, and n and returns the value of the integral, computed 
; using Simpson's Rule. Use your procedure to integrate cube between 0 and 1
; (with n = 100 and n = 1000), and compare the results to those of the integral
; procedure shown above.

; first define a sigma sum from the text. Where term is a procedure for getting
; the current term and next is a procedure for getting the next term. a and b
; are the bounds (linear recursive algorithm)
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

; next define the integral function from the text which uses the following to
; compute an integral
;[f(a + dx/2) + f(a + dx + dx/2) + f(a + 2dx + dx/2) + ...]dx

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b) dx))
; next define the function we are integrating
(define (cube x)
  (* x x x))
; test the integral function at two different levels of precision
(integral cube 0 1 0.01)
(integral cube 0 1 0.001)

(define (integral-simpsons f a b n)
  ; first define h
  (define h (/ (- b a) n))
  ; next define getting each term
  (define (get-term k)
    ; here we define yk for term k
    (define yk (f (+ a (* k h))))
    ; we then get the total term, if k is 0 or n then we just return yk
    ; if it is even we return 2*yk
    ; if it is odd we return 4*yk
    (cond ((or (= k 0) (= k n)) yk) 
          ((= (remainder k 2) 0) (* 2 yk))
          (else (* 4 yk))))
  ; the get-next procedure just goes up by one term
  (define (get-next x)
    (+ x 1))
  ; finally we define the sum by summing from 0 to n
  (* (/ h 3) (sum get-term 0 get-next n)))

(integral-simpsons cube 0 1 100.0)
(integral-simpsons cube 0 1 1000.0)

; here we can see that simpsons is much more accurate than the integral function
; before.


