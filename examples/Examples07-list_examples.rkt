;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Examples07-list_examples_) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;; EXAMPLES OF LISTS
;;;;;;;;;;;;;;;;;;;;;;

(define PLANETS
  (cons "Mercury"
        (cons "Venus"
              (cons "Earth"
                    (cons "Mars"
                          (cons "Jupiter"
                                (cons "Saturn"
                                      (cons "Uranus"
                                            (cons "Neptune" '())))))))))

(define OLD-PLANETS
  (cons "Mercury"
        (cons "Venus"
              (cons "Earth"
                    (cons "Mars"
                          (cons "Jupiter"
                                (cons "Saturn"
                                      (cons "Uranus"
                                            (cons "Neptune"
                                                  (cons "Pluto" '()))))))))))

(define GRADES
  (cons 10.0
        (cons 7.5
              (cons 8.0
                    (cons 4.5 '())))))

(define DIGITS
  (cons 0
        (cons 1
              (cons 2
                    (cons 3
                          (cons 4
                                (cons 5
                                      (cons 6
                                            (cons 7
                                                  (cons 8
                                                        (cons 9 '())))))))))))
                                                              
(define MIXED
  (cons "Jklpuzo"
        (cons 34
              (cons #false '()))))


; a Person is a structure
;  (make-person first middle last)
; where first, middle, last: String
; interpretation: first, middle, and last name
(define-struct person [first middle last])

(define HOMER (make-person "Homer" "Jay" "Simpson"))
(define MARGE (make-person "Marjorie" "Jacqueline" "Simpson"))
(define BART (make-person "Bartholomew" "JoJo" "Simpson"))
(define LISA (make-person "Lisa" "Marie" "Simpson"))
(define MAGGIE (make-person "Margaret" "" "Simpson"))
(define BARNEY (make-person "Barnard" "Arnold" "Gumble"))


(define THE-SIMPSONS
  (cons HOMER
        (cons MARGE
              (cons BART
				        (cons LISA
                    		  (cons MAGGIE '()))))))



;;; BASIC LIST MANIPULATION
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; List -> Any 
; first element of `a-list`
(define (1st a-list)
  (first a-list))

; List -> Any 
; second element of `a-list`
(define (2nd a-list)
  (first (rest a-list)))

; List -> Any 
; third element of `a-list`
(define (3rd a-list)
  (first (rest (rest a-list))))

; List -> Boolean
; is the third element of `lon` a positive number?
(define (positive-3rd lon)
  (and (number? (3rd lon))
       (> (3rd lon) 0)))



;;; RECURSIVE FUNCTIONS ON LISTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Data types
; a List<Planet> is one of:
;  - '()
;  - (cons Planet List<Planet>)
; where Planet is a String
; interpretation: a list of planet names

;; Input/output
; has-pluto? : List<Planet> -> Boolean
; does `lop` include "Pluto"?
; header: (define (has-pluto? lop) #false)
(define (has-pluto? lop)
  (cond
    [(empty? lop) #false] ; empty list: no "Pluto"
    [(cons? lop)          ; non-empty list:
     (or (string=? "Pluto" (first lop)) ; either "Pluto" is the head
         (has-pluto? (rest lop)))]))    ; or "Pluto" is in tail

;; Examples
(check-expect (has-pluto? '()) #false)
(check-expect (has-pluto? PLANETS) #false)
(check-expect (has-pluto? OLD-PLANETS) #true)

;; Template
;(define (has-pluto? lop)
;  (cond
;    [(empty? lop) ... lop ...]
;    [(cons? lop) ... lop ...
;                     (first lop) ...
;                     (rest lop) ...]))
