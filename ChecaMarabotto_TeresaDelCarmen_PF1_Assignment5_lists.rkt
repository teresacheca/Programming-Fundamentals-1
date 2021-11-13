;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ChecaMarabotto_TeresaDelCarmen_PF1_Assignment5_lists) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; AUTHOR: TERESA DEL CARMEN CHECA MARABOTTO

; ASSIGNMENT 5 - LISTS 

;; ----------------------------------------------------------------------------------------------------------
;; ----------------------------------------------------------------------------------------------------------


;1. Write a data type definition List<Number> for a list of numbers.
;Include examples of instances of this type.

;; Data types
; a List<Number> is one of:
;   -'()                           ; empty list
;   - (cons Number List<Number>)   ; nonempty list
; interpretation: list of numbers

;; Data examples:
(define L0 '())
(define L1 (list 1))
(define L2 (list 1 2))
(define L3 (list 1 2 3 -4))

;; ----------------------------------------------------------------------------------------------------------

;2. Design a function add-5 that takes a list of numbers and adds 5 to each of them.

;; Input/output
; add-5: List<Number> -> List<Number>
; adds 5 to each number of the given list

;; header
; (define (add-5 l) '() )

(check-expect (add-5 L0) '())
(check-expect (add-5 L1) (list 6))
(check-expect (add-5 L2) (list 6 7))
(check-expect (add-5 L3) (list 6 7 8 1))

;; Template
;(define (add-5 l)
;   (if (null? l)... )
;       (cons ... (first l) ... (second l) ...)
;)

;; Code
(define (add-5 l)
   (if (null? l)
       '()
       (cons (+ 5 (first l))
             (add-5 (rest l))))
)

;; ----------------------------------------------------------------------------------------------------------


;3. Write a data type definition List<Name> for a list of person names. Include
;examples of instances of this type.

;; Data types
; a Name is a string
; interpretation: represent proper name of a person

; a List<Name> is one of:
;   -'()                           ; empty list
;   - (cons Name List<Name>)       ; nonempty list
; interpretation: list of names

;;Data examples
(define N0 '())
(define N1 (list "Strange"))
(define N2 (list "Foster" "Frankenstein"))
(define N3 (list "Twain" "Dickens" "Shakespeare"))

;; ----------------------------------------------------------------------------------------------------------


;4. Design a function add-title that takes a List<Name> and a string representing a title, and returns a list of the input names with the title added as a
;prefix of every name. For example, given the names "Strange", "Foster", and
;"Frankenstein" and the title "Dr.", it outputs the strings "Dr. Strange",
;"Dr. Foster", and "Dr. Frankenstein".


;; Input/output
; add-title: List<Names> String -> List<Names>
; add a string which represent a title to the names of the given list

;; Header
; (define (add-title names title) '() )

(check-expect (add-title N0 "") '())
(check-expect (add-title N1 "Dr.") (list "Dr. Strange"))
(check-expect (add-title N2 "Dr.") (list "Dr. Foster" "Dr. Frankenstein"))
(check-expect (add-title N3 "Sr.") (list "Sr. Twain" "Sr. Dickens" "Sr. Shakespeare"))

;; Template
;(define (add-title names title)
;   (if (null? names)... )
;       (cons ... (first names) ... (second names) ...)
;)

;; Code
(define (add-title names title)
   (if (null? names)
       '()
       (cons (string-append title " " (first names))
             (add-title (rest names) title)))
)

;; ----------------------------------------------------------------------------------------------------------


;5. Design a function min-list that returns the minimum number in a non-empty
;list of numbers. (Note: you should not sort the input list to find the minimum.)

;; Data types
; a NonemptyList<Number> is one of:
;   - '(cons Number '())                   ; one-element list
;   - (cons Number NonemptyList<Number>)   ; > 1-element list
; interpretation: list of numbers with al least one element

;; Data examples:
(define list1 (list 1))
(define list2 (list 2 1))
(define list3 (list 1 2))
(define list4 (list 1 2 3 -4))
(define list5 (list 20 7 3 0))

;; Input/output
; min-list: NonemptyList<Number> -> Number
; returns the minimum number in the non-empty given list of numbers

;; Header
; (define (min-list l min) 0 )

(check-expect (min-list (rest list1) (first list1)) 1)
(check-expect (min-list (rest list2) (first list2)) 1)
(check-expect (min-list (rest list3) (first list3)) 1)
(check-expect (min-list (rest list4) (first list4)) -4)
(check-expect (min-list (rest list5) (first list5)) 0)

;; Template
;(define (min-list lst min)
;      (cond
;        [...(null? lst) ...]
;        [...(first lst) ...]
;        [...(second lst) ...]
;        [...(third lst) ...]
;        ...
;        [else ...]
;      )
;) 

;; Code
(define (min-list lst min)
      (cond
        [(null? lst) min]
        [(< (first lst) min) (min-list (rest lst) (first lst))]
        [else (min-list (rest lst) min)]
      )
)      


;; ----------------------------------------------------------------------------------------------------------

;6. Design a function 2min-list that returns the two smallest numbers in a list of
;numbers with at least two elements. (Note: you should not sort the input list
;to find the two minima.)

;; Data types
; a 2ElementList<Number> is one of:
;   - '(cons Number (cons Number'()))                   ; two-element list
;   - (cons Number 2ElementList<Number>)   ; > 2-element list
; interpretation: list of numbers with al least two elements


;; Data examples:
(define 2list1 (list 1 4))
(define 2list2 (list 8 9 10))
(define 2list3 (list 5 6 7 4 3 0))
(define 2list4 (list 1 0 3 -4 20 8))
(define 2list5 (list 10 5 3 0 9))
(define 2list6 (list 0 0 4 8 0 7))

;; Input/output
; 2min-list: 2ElementList<Number> -> Number Number
; returns the two smallest number in the given list of numbers

;; Header
; (define (2min-list l min1 min2) 0 0 )

(check-expect (2min-list (rest 2list1) (first 2list1) (second 2list1)) (list 1 4))
(check-expect (2min-list (rest 2list2) (first 2list2) (second 2list2)) (list 8 9))
(check-expect (2min-list (rest 2list3) (first 2list3) (second 2list3)) (list 0 3))
(check-expect (2min-list (rest 2list4) (first 2list4) (second 2list4)) (list -4 0))
(check-expect (2min-list (rest 2list5) (first 2list5) (second 2list5)) (list 0 3))
(check-expect (2min-list (rest 2list6) (first 2list6) (second 2list6)) (list 0 0))

;; Template
;(define (min-list lst min)
;      (cond
;        [...(null? lst) ...]
;        [...(first lst) ...]
;        [...(second lst) ...]
;        [...(third lst) ...]
;        ...
;        [else ...]
;      )
;) 

;; Code
(define (2min-list lst min1 min2)
      (cond
         [(and (null? lst) (<= min1 min2)) (list min1 min2)]
         [ (< (first lst) min1) (2min-list (rest lst) (first lst) min1) ]
         [(< (first lst) min2) (2min-list (rest lst) min1 (first lst)) ]
         [else (2min-list (rest lst) min1 min2)]
         )
)  
;; ----------------------------------------------------------------------------------------------------------


;7. Write a data type definition NEList<Posn> for a non-empty list of Posn. Include
;examples of instances of this type.

;; Data types
; a NEList<Posn> is one of:
;   -'(cons Posn '())                       ; one-element list
;   - (cons Posn NonemptyList<Number> )     ; > 1-element list
; interpretation: a list of points with two coordinates with at least one element


;; Data examples
(define P0 (make-posn 0 0 ))
(define P1 (make-posn 3 8 ))
(define P2 (make-posn 4 20 ))
(define P3 (make-posn -6 -7))
(define P4 (make-posn 4 0 ))


;; ----------------------------------------------------------------------------------------------------------



;8. Design a function min-x that takes a NEList<Posn> and outputs the input’s element
; with the smallest x component. For example, given a list with elements
;(5, 3), (3, 2), and (2, 3) it outputs (2, 3).

;; Data types
; a NEList<Posn> is one of:
;   - '(cons Posn '())           ; one-element list
;   - (cons Posn NEList<Posn>)   ; > 1-element list
; interpretation: list of points (posn) with al least one element

;; Data examples:
(define pl1 (list P1 P2))
(define pl2 (list P2 P3 P4))
(define pl3 (list P1 P3 P0))
(define pl4 (list P2 P4 P0))
(define pl5 (list P1 P2 P3 P4 P0))

;; Input/output
; min-x: NEList<Posn> -> Posn
; returns the element with the smallest x component

;; Header
; (define (min-x pl pmin) (make-posn 0 0) )

(check-expect (min-x (rest pl1) (first pl1)) P1)
(check-expect (min-x (rest pl2) (first pl2)) P3)
(check-expect (min-x (rest pl3) (first pl3)) P3)
(check-expect (min-x (rest pl4) (first pl4)) P0)
(check-expect (min-x (rest pl5) (first pl5)) P3)

;; Template
;(define (min-x pl pmin)
;      (cond
;        [...(null? pl) ...]
;        [...(posn-x (first pl)) ...]
;        [...(posn-x (second pl)) ...]
;        [...(posn-x (third pl)) ...]
;        ...
;        [else ...]
;      )
;) 

;; Code
(define (min-x pl pmin)
      (cond
        [(null? pl) pmin]
        [(< (posn-x (first pl)) (posn-x pmin)) (min-x (rest pl) (first pl))]
        [else (min-x (rest pl) pmin)]
      )
)      


;; ----------------------------------------------------------------------------------------------------------


;9. Design a function self-powers that takes a natural number n and outputs a list
;of numbers n^n, (n-1)^n-1 , . . . , 2^2, 1^1.
;For example, given 4 it outputs the list with
;numbers 256, 27, 4, 1. Hint: (expt x y) computes x to the yth power.


;; Input/output
; self-powers: Number -> List<Number>
; takes a natural number n and outputs a list of numbers

;; Header
; (define (self-powers n) '() )

(check-expect (self-powers 1) (list 1))
(check-expect (self-powers 2) (list 4 1))
(check-expect (self-powers 3) (list 27 4 1))
(check-expect (self-powers 4) (list 256 27 4 1))
(check-expect (self-powers 5) (list 3125 256 27 4 1))
(check-expect (self-powers 6) (list 46656 3125 256 27 4 1))


;; Template
;(define (self-powers n)
;   (cons
;    ... (expt n n) ...
;    ... (expt n-1 n-1) ...
;    ... (expt n-2 n-2) ...
;    ... )
;)

;; Code
(define (self-powers n)
   (if (= n 0)
   '()
    (cons (expt n n)
            (self-powers (- n 1)) )
    )
)
