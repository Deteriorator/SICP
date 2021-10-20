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
(/ (+ 5
      4
      (- 2
         (- 3
            (+ (/ 4 5)
               6))))
   (* 3
      (- 6 2)
      (- 2 7)))

; exam 1.3
(define (maxsum a b c)
  (cond ((and (> a c) (> b c)) (+ a b))
        ((and (> a b) (> c b)) (+ a c))
        (else (+ b c))))

(maxsum 1 2 3)

; exam 1.4
; 这个题目的意思是 a 加上 b 的绝对值， 当 b 小于零的时候， 对 b 取反 
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(a-plus-abs-b 1 -7)
(a-plus-abs-b 2 6)

; exam 1.5
(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

;(test 0 (p))

;; https://www.cnblogs.com/geckor/articles/1203520.html
;; SICP No.1.5
;; 本题为理解题

;; (define (p) (p))
;;
;; 相当于定义了一个无限递归函数p, p作为operator,以0个operant为参数。根据定义
;; 可知,(p)会被evalute为(p), 而(p)再evaluate为(p). 无穷尽。
;; p自身作为一个procedure是没有问题的,我们允许定义递归函数,但当p作用于operant
;; 时,(p)是有问题的,因为它的evaluation是无限递归的。所以,可知,在scheme中,
;; ()的作用决不仅是优先级的控制工具,而是不可忽略的语义控制工具。p 是一个函数,
;; 而(p)是函数p作用于其参数(0个)后的返回值。
;;
;; Test-it:
;; Welcome to MzScheme version 209, Copyright (c) 2004 PLT Scheme, Inc.
;; > (define (p) (p))
;; > p
;; #<procedure:p>
;; > (p)
;; 交互解释器在此失去反应

;; (define (test x y)
;;  (if (= x 0)
;;      0
;;      y))
;; (test 0 (p))
;;
;; 因此,测试函数在不同原则的evaluation顺序下的结果就很容易推测了。在
;; normal-order evaluation原则下,只有当一个表达式的值被需要的时候才
;; evaluation, (test 0 (p)) 将被evaluate 为 (if (= 0 0) 0 (p)),
;; 因为判断条件成立,最后表达式evaluate为0, 不需要计算(p)的值,从而
;; 避免了无限递归的发生; 而在applicative-order的原则下, 所有的
;; operants必须在代入前evaluate,因此(p)的计算无法避免,结果是无限递归。
;;
;; Test-it:
;; > (test 0 (p))
;; 交互解释器在此失去反应, 因为scheme使用applicative-order evaluation

;; 如果我们定义
;; (define (p) p)
;; 则是另外一个意思,它定义了一个有0个operant的函数p, 当它作用于其operant
;; 时,返回置为其自身,这样我们有(p)被evaluate为p,那么((p))被evaluate为
;; (p) 然后再evaluate为p,那么((((((p))))))
;;
;; Test-it:
;; > (define (p) p)
;; > p
;; #<procedure:p>
;; > (p)
;; #<procedure:p>
;; > ((p))
;; #<procedure:p>
;; > (((((((((((((((((((((((p)))))))))))))))))))))))
;; #<procedure:p>

; 1.1.7 实例：采用牛顿法求平方根
; 类似 Lisp 定义
;(define (sqrt x)
;  (the y (and (>= y 0)
;              (= (square y) x))))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9)
(sqrt (+ 100 37))
(sqrt (+ (sqrt 2) (sqrt 3)))
(square (sqrt 1000))
;3.00009155413138
;11.704699917758145
;1.7739279023207892
;1000.000369924366

; exam 1.6
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(new-if (= 2 3) 0 5)
(new-if (= 1 1) 0 5)
;5
;0

(define (sqrt-iter1 guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter1 (improve guess x)
                     x)))
;(sqrt-iter1 1.0 9)
; 会内存溢出

; exam 1.7
; todo

; exam 1.8


; 1.1.8

