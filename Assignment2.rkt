;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ChecaMarabotto_TeresaDelCarmen_PF1_Assignment2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

; AUTHOR: TERESA DEL CARMEN CHECA MARABOTTO

; ASSIGNMENT 2

;; ----------------------------------------------------------------------------------------------------------
;; ----------------------------------------------------------------------------------------------------------


;; FUNCTIONS AND DATA TYPES

; 1. Write a data type definition for a length in centimeters.

;; data types
; A cm is a number
; interpretation: a measure in centimetres


;; ----------------------------------------------------------------------------------------------------------


;2. Write a data type definition for a length in inches.

;; data types
; A inches is a number
; interpretation: a measure in inches

;; ----------------------------------------------------------------------------------------------------------


; 3. Design a function inch->cm that converts a length in inches to centimeters.
; (One inch is 2.54 centimeters: define a constant for the conversion factor.)

;; constants, definening the conversion factor
; conversion factor to convert inches into centimeters
(define INCH-FACTOR 2.54)

;; input/output
; inch-> cm : inches-> cm
; convert a measure in inches into a measure in centimetres

; header
; (define (inch->cm inches) 0)

(check-expect (inch->cm 1) 2.54)
(check-expect (inch->cm 3) 7.62)
(check-expect (inch->cm 10) 25.4)

; template
; (define (inch-> inches)
;          (... inches ...))

; code
(define(inch->cm inches)
  (* inches INCH-FACTOR))

;; ----------------------------------------------------------------------------------------------------------

; 4. Design a function mean/4 that computes the average of four numbers.

;; data types
; a n1, n2, n3 and n4 are numbers
; interpretation: the numbers we want to calculate its average

; input/output
; means/4: numbers -> mean
; calculate the average of four numbers

; header (mean/4 n1 n2 n3 n4) 0)

(check-expect (mean/4 1 1 1 1) 1)
(check-expect (mean/4 2 4 4 2) 3)
(check-expect (mean/4 20 10 20 30) 20)

; template
; (define (mean/4 n1 n2 n3 n4)
;     (... n1 ... n2 ... n3 ... n4 ...))

; code
(define (mean/4 n1 n2 n3 n4)
  (/(+ n1 n2 n3 n4) 4))


;; ----------------------------------------------------------------------------------------------------------

; 5. Design a function area-triangle that computes the area of a triangle given its
; base and height

; data types
; a area is a number
; interpretation: the area of a triangle

; a base is a number
; interpretation: the base of a triangle

; a height is a number
; interpretation: the height of a triangle

; input/output
; area-triangle: height and base -> area
; calculate the area of a triangle given by its height and base

; header
; (define (area-triangle height base) 0)

(check-expect (area-triangle 2 2) 2)
(check-expect (area-triangle 6 7) 21)
(check-expect (area-triangle 3 8) 12)

; template
; (define (area-triangle height base)
;    (... height ... base ...))

; code
(define (area-triangle height base)
  (/ (* height base) 2))
;; ----------------------------------------------------------------------------------------------------------


; 6. A perfect square is a an integer that is also the square of another integer. For
; example, 4 is a perfect square, whereas 8 is not. Design a function perfect-square?
; that returns #true if its input is a perfect square, and #false otherwise. (Hint:
; the square root of a perfect square is an integer.)

;; data types
; a x is an integer number
; interpretation: the number we want to know if it is a perfect square

; input/output
; perfect-square: x -> boolean
; it check that the number given is a perfect square

; header
; (define (perfect-square? x) #false)

(check-expect (perfect-square? 4) #true)
(check-expect (perfect-square? 16) #true)
(check-expect (perfect-square? 81) #true)
(check-expect (perfect-square? 8) #false)
(check-expect (perfect-square? 35) #false)
(check-expect (perfect-square? 61) #false)


; template
; (define (perfect-square? x)
;    (... x ...))

; code
(define (perfect-square? x)
  (integer?  (sqrt x))
  )


;; ----------------------------------------------------------------------------------------------------------

; 7. Write a data type definition for a price in CHF

;; data type
; a CHF-price is a number
; interpretation: an amount of money in CHF

;; ----------------------------------------------------------------------------------------------------------

; 8. A store has toilet paper on sale: if you buy up to 6 rolls, you pay the regular
; price of 2 francs per roll; if you buy up to 20 rolls, you get a 10% discount on
; the regular price; if you buy more than 20 rolls, you get a 15% discount on the
; regular price. Design a function final-price that computes how much you pay
; for any given number of toilet paper rolls.


;; data types
; a n_rolls is a number
; interpretation: the number of rolls bought

; input/output
; final-price: n_rolls -> number
; calculate the final price of the products with the discount apply in function of the
; number of rolls purchased

; header
; (define (final-price n_rolls) 0)

(check-expect (final-price 6) 12)
(check-expect (final-price 20) 36)
(check-expect (final-price 50) 85)

; template
; (define (final-price n_rolls)
;    (... n_rolls ...))

; code
(define (final-price n_rolls)
  (cond
    [(>= 6 n_rolls) (* n_rolls 2)]
    [(and (>= 20 n_rolls) (< 6 n_rolls)) (- (* n_rolls 2) (* n_rolls 2 0.1))]
    [(< 20 n_rolls) (- (* n_rolls 2) (* n_rolls 2 0.15))]
    )
  )

;; ----------------------------------------------------------------------------------------------------------

; 9. Design a function that inputs the name of a note in the C-major scale using
; neo-Latin naming and outputs the same note using English naming. The neoLatin names (used, for example, in Italy and France) are do, re, mi, fa, sol, la,
; and si; the corresponding English names are C, D, E, F, G, A, and B.

;; constants, definening the notes in C-major scale in English
; defining the english nams of the notes, so a constant containts a string
(define C "C")
(define D "D")
(define E "E")
(define F "F")
(define G "G")
(define A "A")
(define B "B")

; Enumerations:
; a neo-Latin note name is one of these Strings:
; -"do"
; -"re"
; -"mi"
; -"fa"
; -"sol"
; -"la"
; -"si"

; an english note name is one of these Strings:
; -"C"
; -"D"
; -"E"
; -"F"
; -"G"
; -"A"
; -"B"

;; data types
; a note is a string
; interpretation: the neo-latin name of a note

; input/output
; notes-convertion: notes -> constant string
; convert the neo-latin name of a note into the
; correspondent english name of the note 

; header
; (define (notes-convetion note) 0)

(check-expect (notes-convetion "do") "C")
(check-expect (notes-convetion "re") "D")
(check-expect (notes-convetion "mi") "E")
(check-expect (notes-convetion "fa") "F")
(check-expect (notes-convetion "sol") "G")
(check-expect (notes-convetion "la") "A")
(check-expect (notes-convetion "si") "B")

; template
; (define (notes-convetion note)
;    (... note ...))

; code
(define (notes-convetion note)
  (cond
    [(string-ci=? "do" note) C]
    [(string-ci=? "re" note) D]
    [(string-ci=? "mi" note) E]
    [(string-ci=? "fa" note) F]
    [(string-ci=? "sol" note) G]
    [(string-ci=? "la" note) A]
    [(string-ci=? "si" note) B]
    [else "not a note"]
    )
  )



;; ----------------------------------------------------------------------------------------------------------


; 10. Design a function quarter->angle that takes a time in quarter hours (an integer
; in the interval between 0 included and 4 excluded), and returns the angle (in
; degrees) of a clock’s minute hand indicating that quarter. Angles are computed
; counter-clockwise from 0 (horizontal to the right) to 360. At 0 quarter hours,
; the minute hand should point straight up (90 degrees); at 1 quarter hours, it
; should point to the right (0 degrees); at 2 quarter hours, it should point down
; (270 degrees); and at 3 quarter hours, it should point to the left (180 degrees).

;; data types:
; a quarter is an integer number
; interpretation: a time in quarter hours in an integer interval between 0 and 4

; a angle is a number
; interpretation: the representation of clock's minutes hand in degrees indicating a quarter

;; input/output
;quarter->angle: quarter -> angle
; convert a time in quarter hours into an angle in degrees

; header
; (define (quarter->angle quarter) 0)

(check-expect (quarter->angle 0) 90)
(check-expect (quarter->angle 1) 0)
(check-expect (quarter->angle 2) 270)
(check-expect (quarter->angle 3) 180)

; template
; (define (quarter->angle quarter)
;      (... quarter ...)

; code
(define (quarter->angle quarter)
  (cond
    [(= quarter 0) 90]
    [(= quarter 1) 0]
    [(= quarter 2) 270]
    [(= quarter 3) 180]
    [else "not a quarter"]
    )
  )


;; ----------------------------------------------------------------------------------------------------------


; 11. Design a function clock-minutes that takes a time in quarter hours (any nonnegative integer, not necessarily less than 4) and returns an image of a clock
; with the minute hand placed at the appropriate position. The function’s implementation should use function quarter->angle you defined above. Hints:
; • The clock face can be just a circle.
; • The minute hand can be just a narrow rectangle.
; • To handle arbitrary numbers of quarter hours, use the modulo function to
; wrap the value into the interval from 0 to 4. For instance (modulo 10 4)
; evaluates to 2, since 2 = 10 − (2 × 4).
; • Remember to include the library for drawing images with (require 2htdp/image).
; • Use function rotate from 2htdp/image to rotate the minute hand at the
; correct angle.

; contants, defining the clock size
(define BIG-CIRCLE 100)       ; The radio of the big circle of the clock
(define SMALL-CIRCLE 90)      ; The radio of the smaller circle of the clock
(define X-HAND 70)            ; The size in the x axis of the clock's hand
(define Y-HAND 5)             ; The size in the y axis of the clock's hand

; clock image
(define clock-back (overlay  (circle SMALL-CIRCLE "solid" "white")(circle BIG-CIRCLE "solid" "black")))
(define clock-hand (rectangle X-HAND Y-HAND "solid" "black"))
(define clock (overlay/offset clock-hand -30 0 clock-back))

;(define clock2 (rotate 90 clock))

;; data types:
; a quarter is an integer number
; interpretation: a time in quarter hours in an integer interval 

;; input/output
; clock-minutes quarter -> image
; convert a time in quarter hours into clock image, placing the clock in the correct position

; header
; (define (clock-minutes quarter) 0)

(check-expect (clock-minutes 0) (rotate 90 clock))
(check-expect (clock-minutes 1) clock)
(check-expect (clock-minutes 2) (rotate 270 clock))
(check-expect (clock-minutes 3) (rotate 180 clock))
(check-expect (clock-minutes 5) (rotate 0 clock))

; template
; (define (clock-mintes quarter)
;      (... quarter ...)

; code
(define (clock-minutes quarter)
  (cond
    [(= (quarter->angle (modulo quarter 4)) 90) (rotate 90 clock)]
    [(= (quarter->angle (modulo quarter 4)) 0) clock]
    [(= (quarter->angle (modulo quarter 4)) 180) (rotate 180 clock)]
    [(= (quarter->angle (modulo quarter 4)) 270) (rotate 270 clock)]
    )
  )
