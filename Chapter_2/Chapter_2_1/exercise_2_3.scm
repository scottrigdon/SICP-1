; Exercise 2.3. Implement a representation for rectangles in a plane. (Hint:
; You may want to make use of exercise 2.2) In terms of your constructors and
; selectors, create procedures that compute the perimeter and the area of a
; given rectangle. Now implement a different representation for rectangles.
; Can you design your system with suitable abstraction barriers, so that the
; same perimeter and area procedures will work using either representation?

(define (rect-perimeter rectangle)
  (let ((side1 (get-width rectangle))
        (side2 (get-height rectangle)))
    (+ (* 2.0 side1) (* 2.0 side2))))

(define (rect-area rectangle)
  (let ((side1 (get-width rectangle))
        (side2 (get-height rectangle)))
    (* side1 side2)))

; representation 1, simple side lengths
(define (make-rect width height)
  (cons width height))

(define (get-width rect)
  (car rect))

(define (get-height rect)
  (cdr rect))

;testing 
(define test-rect (make-rect 4 5))
(rect-perimeter test-rect)
(rect-area test-rect)

; representation 2, use the classes from exercise 2_2

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (make-segment start end)
  (cons start end))

(define (start-segment seg)
  (car seg))

(define (end-segment seg)
  (cdr seg))

(define (make-rect width-seg height-seg)
  (cons width-seg height-seg))
(define (get-width-seg rect)
  (car rect))
(define (get-height-seg rect)
  (cdr rect))
(define (segment-length seg)
  (sqrt (+ (expt (- (x-point (start-segment seg))
                    (x-point (end-segment seg))) 2)
           (expt (- (y-point (start-segment seg))
                    (y-point (end-segment seg))) 2))))
(define (get-height rect)
  (segment-length (get-height-seg rect)))
(define (get-width rect)
  (segment-length (get-width-seg rect)))
;test
(define seg1 (make-segment (make-point 0 0) (make-point 0 5)))
(define seg2 (make-segment (make-point 0 0) (make-point 4 0)))
(define rect-test (make-rect seg1 seg2))
(rect-perimeter rect-test)
(rect-area rect-test)
