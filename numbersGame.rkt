#lang racket

;List of numbers used in Countdown Game
(define numList (list 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10 25 50 75 100))

;Generate Random Number between 101 and 999
;define rand function, call the "random" library function, give it range min max.
(define rand
  (random 101 1000))


;Generate Random number with user input: Min/Max
(define (inp-rand x y)
 (random x y))

;[1]
;Select random element from a list.
(define (rand-element list)
  (list-ref list (random (length list))))
