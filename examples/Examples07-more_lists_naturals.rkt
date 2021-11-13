;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Examples07-more_lists_naturals_) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;; MAXIMUM NUMBER IN A LIST
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Data types
; a NonemptyList<Number> is one of:
;  - '(cons Number '())                  ; one-element list
;  - (cons Number NonemptyList<Number>)  ; > 1-element list
; interpretation: a list of Numbers with at least one element


;; Data examples
(define L1 (cons 1 '()))
(define L2 (cons -8 '()))
(define L3 (cons 2 (cons 5 '())))
(define L4 (cons 5 (cons 2 '())))
(define L5 (cons -4 (cons 8 (cons -1 '()))))


; max-num : NonemptyList<Number> -> Number
; maximum number in `lon`
; header: (define (max-num lon) 0)
(define (max-num lon)
  (cond
    [(empty? (rest lon))   ; one-element list:
     (first lon)]          ;    the only element is the max
    [else                  ; > 1 element list:
     (if
      (> (first lon)        ;    if the first element is larger than all the rest
         (max-num (rest lon)))
      (first lon)           ;    then the first element is the max
      (max-num (rest lon)))])) ; otherwise, the max is in the rest

;; alternative implementation: using built-in function `max`
(define (max-num-2 lon)
  (cond
    [(empty? (rest lon))   ; one-element list:
     (first lon)]          ;    the only element is the max
    [else                  ; > 1 element list:
     (max                  ;    larger element between 
      (first lon)                ;   - first element
      (max-num-2 (rest lon)))])) ;   - max of rest


;; Examples
(check-expect (max-num L1) 1)
(check-expect (max-num L2) -8)
(check-expect (max-num L3) 5)
(check-expect (max-num L4) 5)
(check-expect (max-num L5) 8)

;; max-num-2 should compute the same results as max-num
(check-expect (max-num-2 L1) (max-num L1))
(check-expect (max-num-2 L2) (max-num L2))
(check-expect (max-num-2 L3) (max-num L3))
(check-expect (max-num-2 L4) (max-num L4))
(check-expect (max-num-2 L5) (max-num L5))


;; Template
;(define (max-num lon)
;  (cond
;    [(empty? (rest lon))   ; one-element list 
;         ... lon ...
;             (first lon) ...] 
;    [else                  ; > 1 element list
;     ... lon ...
;         (first lon) ...
;         (rest lon) ...
;         (max-num (rest lon)) ...   ]))



;;; FACTORIALS
;;;;;;;;;;;;;;;

;; Data types
; a Natural is one of:
;  - 0              ; zero
;  - (add1 Natural) ; positive


;; Input/output
; ! : Natural -> Natural
; factorial of `n`
; header: (define (! n) 1)
(define (! n)
  (cond
    [(zero? n) 1]          ; zero: base case
    [(positive? n)         ; positive:
     (* n (! (sub1 n)))])) ;   n! = n * (n-1)!


;; Examples
(check-expect (! 0) 1)
(check-expect (! 1) 1)
(check-expect (! 3) 6)
(check-expect (! 5) 120)


;; Template
;(define (! n)
;  (cond
;    [(zero? n) ... n ...]      ; zero
;    [(positive? n) ... n ...   ; positive
;                       (sub1 n) ...
;                       (! (sub1 n)) ...]))



;;; WAGES
;;;;;;;;;;

;; hourly pay of employees
(define HOURLY 12.0)


;; Data types
; an Employee is a structure
;  (make-employee name hours)
; where name: String, hours: Number
; interpretation: an employee `name`
;                 who worked `hours` during the month
(define-struct employee [name hours])
  
; a List<Employee> is one of:
;  - '()                             ; empty list
;  - (cons Employee List<Employee>)  ; nonempty list

; a List<Number> is one of:
;  - '()                         ; empty list
;  - (cons Number List<Number>)  ; nonempty list
; a list of numbers represents a list of monthly wages

; Data examples
(define HOMER (make-employee "Homer Simpson" 5))
(define CARL (make-employee "Carl Carlson" 35))
(define SMITHERS (make-employee "Waylon Smithers" 70))

(define EL0 '())
(define EL1 (cons HOMER '()))
(define EL2 (cons CARL '()))
(define EL3 (cons CARL (cons HOMER (cons SMITHERS '()))))


;; Input/output
; wages : List<Employee> -> List<Number>
; list of monthly wages of employees `loe`
; header: (define (wages loe) '())
(define (wages loe)
  (cond
    [(empty? loe) '()]  ; empty list: output also empty
    [else               ; nonempty list
     (cons
      (* HOURLY (employee-hours (first loe)))  ; wage of first employee
      (wages (rest loe)))]))                   ; followed by wages of rest of employees


;; Examples
(check-expect (wages EL0) '())
(check-expect (wages EL1) (cons (* HOURLY 5) '()))
(check-expect (wages EL2) (cons (* HOURLY 35) '()))
(check-expect (wages EL3)
              (cons (* HOURLY 35)
                    (cons (* HOURLY 5)
                          (cons (* HOURLY 70) '()))))

;; Template
;(define (wages loe)
;  (cond
;    [(empty? loe) ... loe ...]  ; empty list
;    [else                       ; nonempty list
;     ... loe ...
;         (first loe) ...
;         (rest loe) ...
;         (employee-name (first loe)) ...
;         (employee-hours (first loe)) ...
;         (wages (rest loe)) ... ]))



;;; FROM-TO
;;;;;;;;;;;;

;; Data types
; a List<Number> is one of:
;  - '()                        ; empty list
;  - (cons Number List<Number>  ; nonempty list

; a Natural is defined above


;; Input/output
; from-to : Natural -> List<Number>
; a list with elements n, n-1, ..., 1 in this order
; header: (define (from-to n) '())
(define (from-to n)
  (cond
    [(zero? n) '()]  ; base case: n = 0
    [else            ; recursive case: n > 0
     (cons n                      ; n in front
           (from-to (sub1 n)))])) ; followed by n-1, n-2, ...


;; Examples
(check-expect (from-to 0) '())
(check-expect (from-to 1) (cons 1 '()))
(check-expect (from-to 3) (cons 3 (cons 2 (cons 1 '()))))

;; Template
;(define (from-to n)
;  (cond
;    [(zero? n) ... n ... ]   ; base case: n = 0
;    [else ... n ...          ; recursive case: n > 0
;             (sub1 n) ...
;             (from-to (sub1 n)) ... ]))
       
     