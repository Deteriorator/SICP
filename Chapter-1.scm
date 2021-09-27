#lang sicp

; 1.1.1
; 加
(+ 100 1)
; 乘
(* 3.14 3)
; 连加
(+ 21 35 12 7)
; 连乘
(* 25 4 12)
; 混合运算
(+ (* 3 5) (- 10 6))
(+ (* 3 (+ (* 2 4) (+ 3 5))) (+ (- 10 7) 6))

(+ (* 3
      (+ (* 2 4)
         (+ 3 5)))
   (+ (- 10 7)
      6))

(display "hello scheme")

; 1.1.2

(define size 2)
size

(* 5 size)

(define pi 3.14159)
(define radius 10)
(* pi (* radius radius))

(define circumference (* 2 pi radius))
circumference

; 1.1.3
(* (+ 2 (* 4 6))
   (+ 3 5 7))


; 1.1.4
(define (square x) (* x x))

(square 21)

(square ( + 2 5))

(square (square 3))

; x*x + y*y
;(+ (square x) (square y))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(sum-of-squares 3 4)

(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))

(f 5)

; 1.1.6

(define (abs1 x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))

(define (abs2 x)
  (cond (( < x 0) (- x))
        (else x)))

(define (abs3 x)
  (if (< x 0)
      (- x)
      x))

; 5 < x < 10
;(and ( > x 5) (< x 10))

(define (>=1 x y)
  (or (> x y) (= x y)))

(define (>=2 x y)
  (not (< x y)))

; exam 1.1
10

(+ 5 3 4)

(- 9 1)

(/ 6 2)

(+ (* 2 4) (- 4 6))

(define a 3)

(define b (+ a 1))

(+ a b (* a b))

(= a b)

(if (and (> a b) (< b (* a b)))
    b
    a)

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))

(+ 2 (if (> b a) b a))

(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))

; exam 1.2
(/ () ())