;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ChecaMarabotto_TeresaDelCarmen_PF1_Assignment6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; AUTHOR: TERESA DEL CARMEN CHECA MARABOTTO

; ASSIGNMENT 6 

;; ----------------------------------------------------------------------------------------------------------
;; ----------------------------------------------------------------------------------------------------------

(require 2htdp/batch-io)

;; ----------------------------------------------------------------------------------------------------------
;1. Define a data type Record to store the content of one record; that is, one row
;in a CSV file. The data type should work for data with any number of fields:
;each field should include the field’s name (a string) and the field’s content
;(any type).

;; Data type

; a Date is a structure
; (make-date year month day)
; where:
;    - year:   Number
;    - month:  Number
;    - day:    Number
; interpretation: a date of the year with a `year`, a `month` and a `day`
(define-struct date [day month year])

; a Carrier is a String
; interpretation: a carrier of a flight

; a FNumber is a number
; interpretation: the identification number of the flight

; a Origin is a String
; interpretation: the place from where the flight departs

; a Destionation is a String
; interpretation: the place where the flight arrives

; a Pair is one of:
;    -'()                 ; empty list
;    - (cons String T);   ; nonempty pair
; interpretation: is a pair with a string which represent the name and a value which can be Date, Carrier, FNumber, Origin, Destination or other

; a Record is one of:
;      - '()                       ; empty list (without fields)
;      - (cons Pair List<Pair>)    ; nonempty list where each pair represent a field
; interpretation: a list of pairs, which each pair represent a different field of the record
; they could be any type (Date, Carrier, FNumber, Origin, Destination or other field with its
; respective name)

;; Date examples:

;; Date
(define Date1 (make-date 2012 02 12))
(define Date2 (make-date 2011 01 04))
(define Date3 (make-date 2012 02 23))

;; Carrier
(define Carrier1 "AA")
(define Carrier2 "EV")

;; FNumber
(define Fnum1 1176)
(define Fnum2 5119)
(define Fnum3 5059)

;; Origin
(define Origin1 "MIA")
(define Origin2 "ATL")
(define Origin3 "GNV")

;; Destination
(define Destination1 "BWI")
(define Destination2 "LEX")
(define Destination3 "ATL")

;; Pairs
(define P1 (list "date" Date1))
(define P2 (list "date" Date2))
(define P3 (list "date" Date3))

(define P4 (list "carrier" Carrier1))
(define P5 (list "carrier" Carrier2))

(define P6 (list "number" Fnum1))
(define P7 (list "number" Fnum2))
(define P8 (list "number" Fnum3))

(define P9 (list "origin" Origin1))
(define P10 (list "origin" Origin2))
(define P11 (list "origin" Origin3))

(define P12 (list "destination" Destination1))
(define P13 (list "destination" Destination2))
(define P14 (list "destination" Destination3))


;; Record
(define Record1 (list P1 P4 P6 P9 P12))
(define Record2 (list P2 P5 P7 P10 P13))
(define Record3 (list P3 P5 P8 P11 P14))

;; ----------------------------------------------------------------------------------------------------------

;2. Define a function get-field that takes a field name and a Record, and returns
;the content of the field with the given name in the input record if one exists;
;otherwise, it returns #false.

;; Input/output
; get-field: String Record -> Y 
; return the value of the flied of the record which name is the same as the string given

;; Header
; (define (get-field name rec) #false)

(check-expect (get-field "date" Record1) Date1)
(check-expect (get-field "carrier" Record2) "EV")
(check-expect (get-field "number" Record3) 5059)
(check-expect (get-field "origin" Record1) "MIA")
(check-expect (get-field "destination" Record2) "LEX")
(check-expect (get-field " " Record3) #false)

;; Template
; (define (get-field name rec)
;    (cond
;    [... (null? rec) ...]
;    [... name ... (car (first rec))) ...]
;    [... name ... (car (second rec))) ...]
;    [... name ... (car (third rec))) ...]
;     ...
;    [else ...]
;    )
;)

;; Code
(define (get-field name rec)
  (cond
    [(null? rec) #false]
    [(string=? name (car (first rec))) (second (first rec))]
    [else (get-field name (rest rec))]
    )
)  

;; ----------------------------------------------------------------------------------------------------------

;3. Define a function list->record that takes a List<String> representing field
;names and a list of elements of any type representing field contents – in the
;same order as the names – and returns a Record that pairs names and contents.

;; Data types
; a List<String> is one of:
;    - '()                          ; empty list
;    - (cons String List<String>)   ; nonempty list
; interpretation: a list which contains strings

; a List<T> is one of:
;     - '()                ; empty list
;     - (cons T List<T>)   ; nonempty list
; interpretation: a list of any type

;; Data examples
(define l1 (list "date" "carrier" "origin" "destination"))
(define l2 (list "carrier" "destination" "date" "origin"))
(define l3 (list "destination" "origin" "carrier" "date"))

(define l4 (list Date1 Carrier1 Origin1 Destination1))
(define l5 (list Carrier2 Destination2 Date2 Origin2))
(define l6 (list Destination3 Origin3 Carrier2 Date3))


;; Input/output
; list->record: List<String> List<T> -> Record 
; return a record which contains the parameters of the given lists

;; Header
; (define (list->record ls lt) #false)

(define record4 (list (list "date" Date1) (list "carrier" Carrier1) (list "origin" Origin1) (list "destination" Destination1)))
(define record5 (list (list "carrier" Carrier2) (list "destination" Destination2) (list "date" Date2) (list "origin" Origin2)))
(define record6 (list (list "destination" Destination3) (list "origin" Origin3) (list "carrier" Carrier2) (list "date" Date3)))

(check-expect (list->record l1 l4) record4)
(check-expect (list->record l2 l5) record5)
(check-expect (list->record l3 l6) record6)


;; Template
; (define (list->record ls lt)
;    (... (first ls) ... (first lt) ...)
;    (... (second ls) ... (second lt) ...)
;    (... (third ls) ... (third lt) ...)
;    ...
;)

;; Code
(define (list->record ls lt)
  (if (and (null? ls)(null? lt))
     '()
     (apply map list (list ls lt))
    )  
)

;; ----------------------------------------------------------------------------------------------------------


;4. Design a function read-csv that inputs the name of a CSV file, reads it, and
;outputs a List<Record> with the CSV’s records. Remember that the first row
;in a CSV file (the header) defines field names (see example above); you can
;assume that the other rows have exactly as many fields as names in the first
;row. Function read-csv doesn’t perform any data conversion; therefore, the
;content of all fields will be a String as read from file. Furthermore, read-csv
;does not need to handle malformed input (for example, an empty file): it can
;just assume that the given filename corresponds to a valid CSV file organized
;as described above.
;Hint: Split the header (first row) to get a list of field names; then, use this list
;of field names to call list->record for every line of the input file.


;; Data types
; a List<Record> is one of:
;    - '()                          ; empty list
;    - (cons Record List<Record>)   ; nonempty list
; interpretation: a list which contains strings

; a CSV is a string
; interpretation: represent the name of a csv file

;; Data examples
(define rl1 '())
(define rl2 (list Record1))
(define rl3 (list Record1 Record2 Record3))

(define file1 "flights.csv")


;; Input/output
; read-csv: CSV -> List<Record>
; gets a csv and return a list of record in which the name of the fields of the records
; is a list which correspond to the first row of the csv file and the value of the fields
; of each record is each row of the file but the first

;; Header
; (define (read-csv filename) '())

(define row4 (list (list "date" "2011-02-06") (list "carrier" "WN") (list "number" "3741") (list "origin" "SEA") (list "destination" "OAK")))
(define row5 (list (list "date" "2012-01-27") (list "carrier" "EV") (list "number" "6031") (list "origin" "SDF") (list "destination" "IAD")))
(define row6 (list (list "date" "2011-01-10") (list "carrier" "AA") (list "number" "428") (list "origin" "IAH") (list "destination" "DFW")))
(define row7 (list (list "date" "2012-02-27") (list "carrier" "WN") (list "number" "3971") (list "origin" "RDU") (list "destination" "FLL")))
(define row8 (list (list "date" "2012-01-06") (list "carrier" "DL") (list "number" "147") (list "origin" "SLC") (list "destination" "ATL")))


(check-expect (fourth(read-csv file1)) row4)
(check-expect (fifth(read-csv file1)) row5)
(check-expect (sixth(read-csv file1)) row6)
(check-expect (seventh(read-csv file1)) row7)
(check-expect (eighth(read-csv file1)) row8)

;; Template
; (define (read-csv filename)
;    ... (first (read-csv-file filename)) ...
;    ... (rest (read-csv-file filename)) ...
;    ...
;    ... (first (rest (read-csv-file filename))) ...
;    ... (second (rest (read-csv-file filename))) ...
;    ... (third (rest (read-csv-file filename))) ...
;    ...
;)

;; Code
(define (read-csv filename)
  (local 
   (
     (define Names (first (read-csv-file filename)))
     (define File (rest (read-csv-file filename)))
     (define (readline lst) 
      (cond
        [(null? lst) '()]
        [else (append (list (list->record Names (first lst))) (readline (rest lst)))]
      )
     )
    
    )
    (readline File)
  )
)

     
  