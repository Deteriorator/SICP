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

