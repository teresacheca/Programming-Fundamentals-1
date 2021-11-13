;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ChecaMarabotto_TeresaDelCarmen_PF1_Assignment1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(require 2htdp/image)

; AUTHOR: TERESA DEL CARMEN CHECA MARABOTTO

; ASSIGNMENT 1

;; ----------------------------------------------------------------------------------------------------------

; EXPRESSIONS AND BASIC TYPES

; 1. Sam is a first-year informatics student at USI, who’s working very hard on her
; PF1 assignments. She programs for 5 hours the first week, for 8 hours the second
; week, for 12 hours the third week, and for 10 hours the fourth week. For
; how many hours did she program in total during these four weeks?

; Define constants:
(define first-week 5)
(define second-week 8)
(define third-week 12)
(define fourth-week 10)

; Solution: the result should be the sum of hours of each week
(define TOTAL-HOURS (+ first-week second-week third-week fourth-week))


; 2. The weekly average working hours are the total number of hours divided by
; the number of weeks. How many hours did Sam work on average per week?

; Define constantes:
(define num_weeks 4)
; Solution: is the total number of hours divided by the number of weeks
(define AVERAGE-HOURS (/ TOTAL-HOURS num_weeks))


; 3. A train travels at 80 km/h for 22 minutes, then at 120 km/h for 1 hour, and
;then at 90 km/h for 1 hour 20 minutes. How much distance (in km) did the
;train travel in total

; Define function that convert minutes to hours
(define (minutes-to-hours minutes)
  (/ minutes 60))

; Define a function that multiplies hours and kilometers
(define (hours-km hours kms)
  (* hours kms))
         
; Define constants for each part of the travel

; In the first part of the travel, the train travels at 80km/h for 22 minuntes
(define part1 (hours-km (minutes-to-hours 22) 80))

; In the second part, the train travels at 120km/h for 1 hour
(define part2 (hours-km 1 120))

; And in the third part the train travels at 90 km/h for 1 hour and 20 minutes
(define part3 (hours-km (+ 1 (minutes-to-hours 20)) 90))


; Solution: is the sum of each part of the journey
(define DISTANCE-TRAVELED (+ part1 part2 part3))

; 4. local pizzeria offers pizzas in two sizes: standard and baby. A standard-
; size pizza costs 12 francs and is 33 cm in diameter; a baby-size pizza costs 9
; francs and is 18 cm in diameter. Which size provides the better value?

; Define constants:
(define standard-price 12)    ; in francs
(define baby-price 9)         ; in francs
(define standard-diameter 33)     ; in cm
(define baby-diameter 18)         ; in cm

; Define the function to calculate the area of a circle
(define (area diameter)
             (/ (* pi   (* diameter diameter)) 4))

; Define pizza's areas:
(define standard-area  (area standard-diameter))
(define baby-area (area baby-diameter))

; Define relation between size (square centimeter) and prize
(define standard-price-size (/ standard-price standard-area))
(define baby-price-size (/ baby-price baby-area))


; Solution: we have to compare the relations between size and prize for each pizza
(define STANDARD-BETTER (<= standard-price-size baby-price-size))



; 5. Write an expression that builds a string "Hello [YourName], welcome to PF1!" ,
; where [YourName] is your first name.

; Define constants:
(define MyName "Teresa")

; Solution: we need to save the string in a constant called HI-TO-ME
(define HI-TO-ME (string-append "Hello" " " MyName "," " " "welcome" " " "to" " " "PF1!"))


; 6. Define a function greet that inputs a string representing a person’s name and
; outputs the string "Hello [InputName], welcome to PF1!" , where [InputName]
; is the input string.

; Solution: I have define a function called greet which parameter is the input string that contains
; a person's name. And the output of the function is "Hello [InputName], welcome to PF1!"
(define (greet InputName)
   (string-append "Hello" " " InputName"," " " "welcome" " " "to" " " "PF1!"))


;; ----------------------------------------------------------------------------------------------------------

; DRAWING SHAPES

; This page describes the road signs that you can find in Switzerland. Pick three of
;them that you like; for each of them, write an expression that evaluates to an image
;of the sign, and save the expression in a constant named after the sign.


; TRAFFIC LIGHTS SIGNAL:

; Parts:
(define background-triangle (overlay (triangle 120 "solid" "White")
(triangle 160 "solid" "Red")))

(define red-ligth (overlay (circle 10 "solid" "Red") (circle 12 "solid" "Black") ))

(define yellow-ligth (overlay (circle 10 "solid" "Gold") (circle 12 "solid" "Black") ) )

(define green-ligth  (overlay (circle 10 "solid" "Forest Green") (circle 12 "solid" "Black") ))

(define traffic-ligth (overlay/offset red-ligth 0 42 (overlay/offset yellow-ligth 0 28 green-ligth)))

; Final signal:
(define TRAFFIC-LIGTH-SIGN (overlay/offset traffic-ligth 0 -5 background-triangle))


; Oncoming traffic signal:

; Parts
(define one_arrow (overlay/offset (rectangle 8 40 "solid" "Black") 0 -20 (triangle 20 "solid" "Black")))

(define two_arrows (overlay/offset one_arrow -25 0 (rotate 180 one_arrow)))

; Final signal:
(define ONCOMING-SIGN (overlay/offset two_arrows 0 -15 background-triangle))


; DEAD END SIGNAL:

; Parts:
(define background-square (overlay  (square 176 "solid" "Royal blue") (overlay (square 178 "solid" "White")(square 180 "solid" "black"))))

(define T-head (overlay (rectangle 98 28 "solid" "red") (rectangle 102 32 "solid" "white")))
                         
(define T-line (overlay/offset T-head 0 45 (rectangle 30 120 "solid" "white")))

; Final signal:
(define DEAD-END-SIGN (overlay/offset T-line 0 -28 background-square))