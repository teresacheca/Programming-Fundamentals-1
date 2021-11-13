;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ChecaMarabotto_TeresaDelCarmen_PF1_Assignment3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; AUTHOR: TERESA DEL CARMEN CHECA MARABOTTO

; ASSIGNMENT 3

;; ----------------------------------------------------------------------------------------------------------
;; ----------------------------------------------------------------------------------------------------------

; 1. Design a function median that takes three numbers and returns their median—
; that is, the number that lies in the middle once the three numbers are ordered
; from smallest to largest. For example, the median of 4, 2, 8 is 4.

; FEEDBACK: You do not need to define a structure here.
; The function takes three numbers and returns a number.
; So, the signature is Number Number Number -> Number.


;; Data types
; a Triplet is a structure (make-triplet Number Number Number)
; interpretation: a set of three numbers (n1 n2 n3)
(define-struct triplet [n1 n2 n3])

;; Examples of data
(define T1 (make-triplet 4 2 8))
(define T2 (make-triplet 2 8 4))
(define T3 (make-triplet 3 2 1))

;; Input/output
; median: Triplet -> Number
; calculates the median of three numbers (n1, n2 and n3)

;; header:
; (define (median t) 0))

(check-expect (median T1) 4)
(check-expect (median T2) 4)
(check-expect (median T3) 2)

;; Template:
; (define (median t)
;          (... (triplet-n1 t) ... (triplet-n2 t)... (triplet-n3 t)))

;; Code
(define (median t)
   (max (min (triplet-n1 t) (triplet-n2 t) )
        (min (triplet-n1 t) (triplet-n3 t))
        (min (triplet-n2 t) (triplet-n3 t))
  )
  )

;; ----------------------------------------------------------------------------------------------------------

; 2. Design a function 3-max that takes three numbers and returns their maximum—
; that is, the largest number among them. (You cannot use Racket’s built-in
; function max to implement 3-max.)

; FEEDBACK: The same problem I mentioned in the previous example.
; Also, the code has bugs. The following test does not pass:
; (check-expect (3-max (make-triplet 3 3 3)) 3)
; The template is not correct.

;; Data types
;   a Triplet is a structure (make-triplet Number Number Number)
; interpretation: a set of three numbers (n1 n2 n3)
;(define-struct triplet [n1 n2 n3]) -> same as exercise 1

;; Examples of data
(define T4 (make-triplet 7 9 8))
(define T5 (make-triplet 12 21 40))
(define T6 (make-triplet 6 5 4))

;; Input/output
; 3-max: Triplet -> Number
; calculate the largest number amoug three numbers (n1, n2 and n3)

;; header:
; (define (3-max t) 0))

(check-expect (3-max T4) 9)
(check-expect (3-max T5) 40)
(check-expect (3-max T6) 6)

;; Template:
; (define (3-max t)
;    (cond
;          [(and (...(triplet-n1 t) (triplet-n2 t))(...(triplet-n1 t)(triplet-n3 t))) (...) ]
;          [(and (...(triplet-n1 t) (triplet-n2 t))(...(triplet-n2 t)(triplet-n3 t))) (...) ]
;          [(and (...(triplet-n1 t) (triplet-n3 t))(...(triplet-n2 t)(triplet-n3 t))) (...) ]
;))

;; Code
 (define (3-max t)
    (cond
          [(and (>(triplet-n1 t) (triplet-n2 t))(>(triplet-n1 t)(triplet-n3 t))) (triplet-n1 t) ]
          [(and (<(triplet-n1 t) (triplet-n2 t))(>(triplet-n2 t)(triplet-n3 t))) (triplet-n2 t) ]
          [(and (<(triplet-n1 t) (triplet-n3 t))(<(triplet-n2 t)(triplet-n3 t))) (triplet-n3 t) ]
))

;; ----------------------------------------------------------------------------------------------------------
;; ----------------------------------------------------------------------------------------------------------
; DATA TYPE POSN

;  The following exercises use built-in structure type Posn to model points given as
;  bidimensional coordinates.


;; ----------------------------------------------------------------------------------------------------------

; 3. Design a function left-of? that inputs two points, and determines if the second lies to the left of the first. Hint: compare the x coordinates of the two
; points.

; FEEDBACK: Posn is a built-in type. You do not need to define it.
; Also, you do not need to use cond. Your function can simply be
; the predicate (> (posn-x p1) (posn-x p2)).


;; Data types
;   a Posn is a structure (make-posn Number Number)
; interpretation: point at coordinates (x, y)
; (define-struct posn [x y]) 

;; Examples of data
(define P1 (make-posn 3 4))
(define P2 (make-posn 1 1))
(define P3 (make-posn 2 4))
(define P4 (make-posn 7 2))

;; Input/output
; left-of?: Posn Posn -> Boolean
; determines if the second point lies to the left of the first point

;; header:
; (define (left-of? p1 p2) #false))

(check-expect (left-of? P1 P2) #true)
(check-expect (left-of? P2 P3) #false)
(check-expect (left-of? P3 P4) #false)

;; Template:
;(define (left-of? p1 p2) 
;  (cond
;          [(... (posn-x p1) (posn-x p2)) .... ]
;          [else ...]
;))

;; Code
(define (left-of? p1 p2) 
  (cond
          [(> (posn-x p1) (posn-x p2)) #true ]
          [else #false]
))

;; ----------------------------------------------------------------------------------------------------------

; 4. Design a function mirror-vertical that inputs a point a returns the point that
; lies at the same height as the input but at the opposite horizontal coordinate.
; For example the vertical mirror of (3, 7) is (−3, 7).

; FEEDBACK: The header is not correct. Remember, if you uncomment a header, it must
; not produce errors.


;; Data types
;   a Posn is a structure (make-posn Number Number)
; interpretation: point at coordinates (x, y)
; (define-struct posn [x y]) -> same as exercise 3

;; Examples of data
(define P5 (make-posn 3 4))
(define P6 (make-posn -3 4))
(define P7 (make-posn 2 -4))
(define P8 (make-posn -2 -4))
(define P9 (make-posn 2 1))
(define P10 (make-posn -2 1))

;; Input/output
; mirror-vertical: Posn -> Posn
; calculate the point that lies at the same height as the input but at the opposite horizontal coordinate (x).

;; header:
; (define (mirror-vertical p) (0,0)))

(check-expect (mirror-vertical P5) P6)
(check-expect (mirror-vertical P6) P5)
(check-expect (mirror-vertical P7) P8)
(check-expect (mirror-vertical P8) P7)
(check-expect (mirror-vertical P9) P10)
(check-expect (mirror-vertical P10) P9)

;; Template:
;(define (mirror-vertical p) 
;  (... (posn-x p) ... (posn-y p) ...)
;)

;; Code
(define (mirror-vertical p) 
  (make-posn (*(posn-x p) -1) (posn-y p))
)

;; ----------------------------------------------------------------------------------------------------------
;; ----------------------------------------------------------------------------------------------------------
; DATES

;; ----------------------------------------------------------------------------------------------------------

; 5. Write a data type definition for the months of the year, represented as Strings:
; "January", "February", . ..

;;Data type
; a Month is one of these Strings:
; - "January"
; - "February"
; - "March"
; - "April"
; - "May"
; - "June"
; - "July"
; - "August"
; - "September"
; - "October"
; - "November"
; - "December"
; interpretation: names of the moths of the year



;; ----------------------------------------------------------------------------------------------------------

; 6. Design a function number->month that takes a month number (an integer from
; 1 to 12) and converts it to the month’s name. For example, it should output
; "March" when the input is 3.

; FEEDBACK: Great!

;; Data type -> defined in exercise 5

;; Input/output
; number->month: Number -> Month
; calculate the month's name from the number given

;; header:
; (define (number->month 0) ""))

(check-expect (number->month 1) "January")
(check-expect (number->month 2) "February")
(check-expect (number->month 3) "March")
(check-expect (number->month 4) "April")
(check-expect (number->month 5) "May")
(check-expect (number->month 6) "June")
(check-expect (number->month 7) "July")
(check-expect (number->month 8) "August")
(check-expect (number->month 9) "September")
(check-expect (number->month 10) "October")
(check-expect (number->month 11) "November")
(check-expect (number->month 12) "December")

;; Template:
;(define (number->month n) 
;  (cond
;    [(= n 1) ... ]
;    [(= n 2) ... ]
;    [(= n 3) ... ]
;    [(= n 4) ... ]
;    [(= n 5) ... ]
;    [(= n 6) ... ]
;    [(= n 7) ... ]
;    [(= n 8) ... ]
;    [(= n 9) ... ]
;    [(= n 10) ... ]
;    [(= n 11) ... ]
;    [(= n 12) ... ]
;    [else ... ]
;    )
;)

;; Code
(define (number->month n) 
  (cond
    [(= n 1) "January" ]
    [(= n 2) "February" ]
    [(= n 3) "March" ]
    [(= n 4) "April" ]
    [(= n 5) "May" ]
    [(= n 6) "June" ]
    [(= n 7) "July" ]
    [(= n 8) "August" ]
    [(= n 9)  "September" ]
    [(= n 10) "October"  ]
    [(= n 11) "November"  ]
    [(= n 12) "December" ]
    [else "not a month"]
    )
)

;; ----------------------------------------------------------------------------------------------------------

; 7. Design a function leap-year? that takes a year (an integer) and determines
; whether it is a leap year.
; A year is a leap year if it is an integer multiple of 4 but not of 100 (unless it
; is also an integer multiple of 400). For example: 1868 is a leap year (multiple
; of 4); 1900 is not (multiple of 4 but also of 100 and not of 400); 1904 is a leap
; year (multiple of 4 and not of 100) and so is 2000 (multiple of 4, 100, and 400).
; Use function modulo to determine if a number is an integer multiple of another
; one.

; FEEDBACK: Your code has bugs. The following test does not pass:
; (check-expect (leap-year? 2000) #true)


;; Input/output
; leap-year?: Number -> Boolean
; determines if the year introduced is leap or not

;; header:
; (define (leap-year? year) #false))

(check-expect (leap-year? 2020) #true)
(check-expect (leap-year? 2021) #false)
(check-expect (leap-year? 2100) #false)

;; Template:
;(define (leap-year? year)
;  (... (modulo year 4)... (modulo year 100)...)
;     ...)
;)

;; Code
(define (leap-year? year)
  (if (and(=(modulo year 4)0) (not (= (modulo year 100)0)))
      #true
      #false)
)

;; ----------------------------------------------------------------------------------------------------------

; 8. Write a data type definition for a Date of the year, consisting of: a day (an
; integer between 1 and 31), a month (an integer between 1 and 12), and a year
; (any integer except 0, which is not a valid year).

;; Data types
; a Date is a structure (make-date day month year)
; where:
;        day   : Number
;        month : Number
;        year  : Number
;interpretation: a date of the year with a `day`, a `month` and a `year`
(define-struct date [day month year])

; a day is a Number that falls into these interval:
;   - between 1 (included) and 31 (included)
; interpretation: a day of the month

;a month is a Number that falls into these interval:
;  - between 1 (included) and 12 (included)
;interpretation: a month of the year

;a year is a Number that falls into these interval:
;  - any number except 0
; interpretation: the number of a year

;; ----------------------------------------------------------------------------------------------------------

; 9. Design a function date->string that takes a Date and returns a String with a
; representation of the date of the form "[Day] [Month] [Year]". The day in the
; output should be a number; the month should be a name; the year should be
; a positive integer, with "BCE" appended if the year is negative. For example,
; date 30 3 −1204 should render as "30 March 1204 BCE"; date 14 9 2020 should
; render as "14 September 2020". Use function number->month defined above in
; the definition of date->string.

; FEEDBACK: Great!

;; Data type -> defined in exercise 8

;; Examples of data
(define date1 (make-date 30 3 -1204))
(define date2 (make-date 14 9 2020))
(define date3 (make-date 2 8 -1890))
(define date4 (make-date 16 5 2021))


;; Input/output
; date->string: Date -> String
; calculate the correspondent string form of the date 

;; header:
; (define (date->string d) ""))

(check-expect (date->string date1) "30 March 1204 BCE")
(check-expect (date->string date2) "14 September 2020" )
(check-expect (date->string date3) "2 August 1890 BCE")
(check-expect (date->string date4) "16 May 2021")

;; Template:
;(define (date->string d)
;  (cond
;    [(< (date-year d) 0) ... ]
;    [(> (date-year d) 0) ... ]
;    [else ... ]
;    )  
;)

;; Code
(define (date->string d)
  (cond
    [(< (date-year d) 0) (string-append (number->string (date-day d)) " " (number->month (date-month d)) " " (number->string (*(date-year d)-1)) " BCE") ]
    [(> (date-year d) 0) (string-append (number->string (date-day d)) " " (number->month (date-month d)) " " (number->string (date-year d))) ]
    [else "wrong definition"]
    )  
)

;; ----------------------------------------------------------------------------------------------------------

; 10. Design a function days-in-month that takes a month number (an integer from
; 1 to 12) and returns the number of days in that month in a non-leap year. Remember that there are 30 days in November, April, and June, and September;
; 28 days in February (in a non-leap year); and 31 days in all other months.

; FEEDBACK: You do not need to use modulo in your code.
; Also, the template is not totally correct.

;; Input/output
; days-in-month: Number -> Number
; calculate the number of days in the month passed as a parameter

;; header:
; (define (days-in-month month) 0))

(check-expect (days-in-month 1) 31)
(check-expect (days-in-month 2) 28)
(check-expect (days-in-month 3) 31)
(check-expect (days-in-month 4) 30)
(check-expect (days-in-month 5) 31)
(check-expect (days-in-month 6) 30)
(check-expect (days-in-month 7) 31)
(check-expect (days-in-month 8) 31)
(check-expect (days-in-month 9) 30)
(check-expect (days-in-month 10) 31)
(check-expect (days-in-month 11) 30)
(check-expect (days-in-month 12) 31)

;; Template:
;(define (days-in-month month)
;  (cond
;    [(... (=(modulo month 2)0)) (< month 8) ...]
;    [... (modulo month 2)0) (< month 8)...]
;    [... (and(=(modulo month 2)0)(>= month 8)) ... ]
;    [... (and(not(=(modulo month 2)0))(> month 8)) ... ]
;    [(= month 2) ...]
;    )  
;)

;; Code
(define (days-in-month month)
  (cond
    [(and(not(=(modulo month 2)0))(< month 8)) 31 ]
    [(and(=(modulo month 2)0)(< month 8) (not(= month 2))) 30 ]
    [(and(=(modulo month 2)0)(>= month 8)) 31 ]
    [(and(not(=(modulo month 2)0))(> month 8)) 30 ]
    [(= month 2) 28]
    )  
)

;; ----------------------------------------------------------------------------------------------------------

; 11. Design a function date-valid? that takes a Date and determines if the date
; is valid, that is if the month number is between 1 and 12; the day number is
; consistent with the month; and the year number is not zero. Remember that 29
; is a valid day number in February only in leap years. Use any functions defined
; above in the implementation of date-valid?.

; FEEDBACK: Your function has bugs. the following test does not pass:
; (check-expect (date-valid? (make-date 1 4 0)) #false)

;; Examples of data
(define date5 (make-date 30 3 2003))
(define date6 (make-date -1 9 2020))
(define date7 (make-date 29 2 2020))
(define date8 (make-date 34 4 1990))
(define date9 (make-date 5 14 1980))

;; Input/output
; date-valid?: Date -> Boolean
; determines that the date is correct, that is the parameters are into the defined intervals

;; header:
; (define (date-valid? d) #false))

(check-expect (date-valid? date5) #true)
(check-expect (date-valid? date6) #false)
(check-expect (date-valid? date7) #true)
(check-expect (date-valid? date8) #false)
(check-expect (date-valid? date9) #false)

;; Template:
;(define (date-valid? d)
;  (cond
;   [...(not (leap-year? (date-year d))) ... #true]
;   [... (leap-year? (date-year d))... #true]
;   [else #false]
;   )  
;)

;; Code
(define (date-valid? d)
  (cond
   [(and (not (leap-year? (date-year d))) (>= (date-day d) 1) (<= (date-day d) (days-in-month (date-month d))) (>= (date-month d) 1) (<= (date-month d) 12)) #true]
   [(and (leap-year? (date-year d))  (>= (date-day d) 1) (= (date-month d) 2) (<= (date-month d) 29) ) #true]
   [else #false]
   )  
)
