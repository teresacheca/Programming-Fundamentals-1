;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Examples07-list_recipe_) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;; COUNT THE ELEMENTS IN A LIST OF STRINGS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Data types
; a List<String> is one of:
;  - '()                         ; empty list
;  - (cons String List<String>)  ; nonempty list
; interpretation: a list of Strings


;; Data examples
(define L0 '())
(define L1
  (cons "el" '()))
(define L2
  (cons "a"
        (cons "b" '())))
(define L3
  (cons "programming"
        (cons "fundamentals"
              (cons "1" '()))))


;; Input/output
; how-many : List<String> -> Number
; number of Strings in `los`
; header: (define (how-many los) 0)
(define (how-many los)
  (cond
    [(empty? los) 0]   ; empty list (base case)
                       ; the empty list has 0 elements
    [(cons? los)       ; nonempty list (recursive case)
     (+ 1                         ; los has one element as (first los)
        (how-many (rest los)))])) ; plus the elements in (rest los)

;; Examples
(check-expect (how-many L0) 0)
(check-expect (how-many L1) 1)
(check-expect (how-many L2) 2)
(check-expect (how-many L3) 3)

;; Template
;(define (how-many los)
;  (cond
;    [(empty? los) ... los ...]   ; empty list    (base case)
;    [(cons? los) ... los ...     ; nonempty list (recursive case)
;                 (first los) ...
;                 (how-many (rest los)) ...])) ; natural recursion



;;; SUM OF NUMBERS
;;;;;;;;;;;;;;;;;;;

;; Data types
; a List<Number> is one of:
;  - '()                         ; empty list
;  - (cons Number List<Number>)  ; nonempty list
; interpretation: a sequence of numbers

; Data examples
(define LN0 '())
(define LN1 (cons 1 (cons 2 '())))
(define LN2 (cons 7 '()))
(define LN3 (cons -5 (cons 12.3 (cons -2 '()))))

;; Input/output
; sum : List<Number> -> Number
; sum of all numbers in `lon`
; header: (define (sum lon) 0)
(define (sum lon)
  (cond
    [(empty? lon) 0]                ; empty list: sums to 0
    [(cons? lon)                    ; nonempty list
     (+ (first lon)                 ;   sum first element
        (sum (rest lon)))]))        ;   to sum of remaining elements


;; Examples
(check-expect (sum LN0) 0)
(check-expect (sum LN1) 3)
(check-expect (sum LN2) 7)
(check-expect (sum LN3) 5.3)


;; Template
;(define (sum lon)
;  (cond
;    [(empty? lon) ... lon ...]                ; empty list
;    [(cons? lon) ... lon ...                  ; nonempty list
;                     (first lon) ...
;                     (rest lon)  ...
;                     (sum (rest lon)) ...]))



;;; IS NAME PRESENT?
;;;;;;;;;;;;;;;;;;;;;

;; Data types

; a Person is a structure
;  (make-person first last)
; where first, last: String
; interpretation: a person's first and last names
(define-struct person [first last])

; a List<Person> is one of:
;  - '()                        ; empty list
;  - (cons Person List<Person>) ; nonempty list
; intepretation: a list of persons

; Data examples
(define HOMER (make-person "Homer" "Simpson"))
(define MARGE (make-person "Marge" "Simpson"))
(define BURNS (make-person "Monty" "Burns"))
(define CARL (make-person "Carl" "Carlson"))
(define LENNY (make-person "Lenny" "Leonard"))
(define EDNA (make-person "Edna" "Krabappel"))

(define PL0 '())
(define PL1 (cons HOMER '()))
(define PL2 (cons CARL '()))
(define PL3 (cons BURNS (cons MARGE '())))
(define PL4 (cons CARL (cons LENNY (cons EDNA '()))))


;; Input/output
; has-person? : String List<Person> -> Boolean
; does lop include a person with last name `name`?
; header: (define (has-person? name lop) #false)
(define (has-person? name lop)
  (cond
    [(empty? lop) #false]  ; empty list: no person is found
    [else                  ; nonempty list
     (or (string=? name (person-last (first lop)))   ; either the person is the list's first
         (has-person? name (rest lop)))]))           ; or it is in the rest of the list

;; Examples
(check-expect (has-person? "Simpson" PL0) #false)
(check-expect (has-person? "Simpson" PL1) #true)
(check-expect (has-person? "Simpson" PL2) #false)
(check-expect (has-person? "Burns" PL3) #true)
(check-expect (has-person? "Simpson" PL3) #true)
(check-expect (has-person? "Leonard" PL4) #true)
(check-expect (has-person? "Krabappel" PL4) #true)
(check-expect (has-person? "Simpson" PL4) #false)

;; Template
;(define (has-person? name lop)
;  (cond
;    [(empty? lop) ... lop ... name ...]                 ; empty list
;    [else        ... lop ... name ...                   ; nonempty list
;                     (first lop) ...
;                     (rest lop)  ...
;                     (person-first (first lop)) ...
;                     (person-last (first lop)) ...
;                     (has-person? ... (rest lop)) ...]))



;;; FIND PERSON
;;;;;;;;;;;;;;;;

;; Data types
; as in the previous example, including data examples,
; plus type Maybe<Person>

; a Maybe<Person> is one of
;  - #false
;  - a Person
; interpretation: a valid person, or a default value


;; Input/output
; find-person String List<Person> -> Maybe<Person>
; the first person in lop with last `name`;
; if one such person doesn't exist, #false
; header: (define (find-person name lop) #false)
(define (find-person name lop)
  (cond
    [(empty? lop) #false]    ; empty list: no person in it
    [(cons? lop)             ; nonempty list
     (if                     
      (string=? name         ; if `name` is the first element
                (person-last (first lop)))
                (first lop)  ; return the first element
                             ; otherwise: search in the list's tail
                (find-person name (rest lop)))]))


;; Examples
(check-expect (find-person "Simpson" PL0) #false)
(check-expect (find-person "Simpson" PL1) HOMER)
(check-expect (find-person "Simpson" PL2) #false)
(check-expect (find-person "Burns" PL3) BURNS)
(check-expect (find-person "Simpson" PL3) MARGE)
(check-expect (find-person "Leonard" PL4) LENNY)
(check-expect (find-person "Krabappel" PL4) EDNA)
(check-expect (find-person "Simpson" PL4) #false)
; one more example, with more than one person with the same last name in a list
(check-expect (find-person "Simpson"
                           (cons HOMER (cons BURNS (cons MARGE '()))))
              HOMER)


;; Template
;(define (find-person name lop)
;  (cond
;    [(empty? lop) ... lop ... name ...]                 ; empty list
;    [(cons? lop) ... lop ... name ...                   ; nonempty list
;                     (first lop) ...
;                     (rest lop)  ...
;                     (person-first (first lop)) ...
;                     (person-last (first lop)) ...
;                     (find-person ... (rest lop)) ...]))
