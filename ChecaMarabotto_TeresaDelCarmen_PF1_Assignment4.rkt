;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ChecaMarabotto_TeresaDelCarmen_PF1_Assignment4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; AUTHOR: TERESA DEL CARMEN CHECA MARABOTTO

; ASSIGNMENT 4

;; ----------------------------------------------------------------------------------------------------------
;; ----------------------------------------------------------------------------------------------------------

;; PURPOSE OF THE ASSIGNMENT:
; In this assignment we will create a drawing application, which provides thefollowing features:
;     • a drawing canvas, which is initially empty
;     • clicking the mouse button begins drawing a line from the position of clicking
;     • dragging the mouse (while keeping the button pressed) displays a line that goes from the previous clicking position to the current mouse position
;     • releasing the mouse button stops drawing the line, and adds the current line to the canvas
;     • after a line is drawn and is added to the canvas it cannot be removed and it permanently becomes part of the canvas image
;     • pressing the escape key while drawing a line cancels the current line
;     • pressing an arrow key while drawing a line moves the line’s starting point 5 pixels in the arrow’s direction (up, down, left, or right)
;     • pressing q at any point quits the app

;; ----------------------------------------------------------------------------------------------------------
;; Data types

; an Image is the result of drawing or not lines on an empty canvas, this includes
; the lines that are drawn

; a line2 is a structure (make-line2 Number Number Number Number)
; interpretation: is two pairs of numbers which represent coordinates in the canvas
; the first two are the initial point (x1, y1) and the other two are the final point (x2, y2)
(define-struct line2 [x1 y1 x2 y2])

; a Maybe<Line> is one of:
;     - a line2 ; the line is present
;     - #false ; the line is missing
; interpretation: a line that may be missing


; a AppState is one of:
;     - empty    ; the canvas is completely empty
;     - an Image
;     - a Maybe<Line>
; where
;     - canvas        ; represent the current image
;     - line-start    ; it is #true when a line had started but not finihed yet, otherwise is #false
;     - quit?         ; represent whether the application has quit
;     - color         ; determine the color of the lines which we are painting, if we do not put this, we will draw in white
; interpretation: the possibles states of the app
(define-struct AppState [canvas line-start quit? color])


;; ----------------------------------------------------------------------------------------------------------

; Constants
; size of overall scene
(define WIDTH-OF-SCENE 600)
(define HEIGHT-OF-SCENE 600)

;The background of the imge which is actually an empty scene
(define BACKGROUND (empty-scene WIDTH-OF-SCENE HEIGHT-OF-SCENE))

; Input/output
; draw: AppState -> Image
; takes an AppState and return an Image of the canvas with the currently drawn line
; (if any exists)

; header
; (define (draw state) (AppState-canvas state))

(check-expect (draw initial-state) (AppState-canvas initial-state))


; Template
; (define (draw state)
;  (if (false? (AppState-line-start state))
;      ...
;      (add-line ...)
; ))

; Code
(define (draw state)
  (if (false? (AppState-line-start state))
      (AppState-canvas state)
      (add-line
       (AppState-canvas state)
       (line2-x1
        (AppState-line-start state))
       (line2-y1
        (AppState-line-start state))
       (line2-x2
        (AppState-line-start state))
       (line2-y2
        (AppState-line-start state))
       (AppState-color state))))


; Input/output
; move-end: AppState Number Number -> AppState
; obtain an AppState where the current line is finished, that is, the line has an end.
; If there is no current drawn, return the same AppState as input

; header
; (define (move-end state x2 y2) state)

; Template
;(define (move-end state x2 y2)
;   ...
;   (make-line2
;    (... line2-x1 ... )
;    (... line2-y1 ... )
;    (... line2-x1 ... )
;    (... line2-y1 ....))
;   ...
;   ))

; Code
(define (move-end state x2 y2)
  (make-AppState
   (AppState-canvas state)
   (make-line2
    (line2-x1 (AppState-line-start state))
    (line2-y1 (AppState-line-start state))
    (+ (line2-x1 (AppState-line-start state)) x2)
    (+ (line2-y1 (AppState-line-start state)) y2))
   (AppState-quit? state)
   (AppState-color state)
   ))


; Input/output
; move-start: AppState Number Number -> AppState
; obtain an AppState where the current line's starting point is moved to the position given
; If there is no current drawn, return the same AppSate as input

; header
; (define (move-start state x1 y1) state)

; Template
;(define (move-start state x1 y1)
;   ...
;   (make-line2
;    (... line2-x1 ... )
;    (... line2-y1 ... )
;    (... line2-x1 ... )
;    (... line2-y1 ....))
;   ...
;   ))

; Code
(define (move-start state x1 y1)
  (make-AppState
   (AppState-canvas state)
   (make-line2
    (+ (line2-x1 (AppState-line-start state)) x1)     ; x1 coordinate
    (+ (line2-y1 (AppState-line-start state)) y1)     ; y1 coordinate
    (line2-x2 (AppState-line-start state))            ; x2 coordinate
    (line2-y2 (AppState-line-start state)))           ; y2 coordinate
   (AppState-quit? state)
   (AppState-color state))
  )


; Input/output
; add-line-to-canvas: AppState -> AppState
; add to the canvas image the line that is currently drawn, and resets to #false the line
; that is currently drawn. If there is no line currently drawn, returns the AppState given

; header
; (define (add-line-to-canvas state) state)

; Template
;(define (add-line-to-canvas state)
;  (make-AppState
;   ...
;   ))

; Code
(define (add-line-to-canvas state)
  (make-AppState
   (draw state)
   #false
   #false
   (AppState-color state)
   ))


; Input/output
; cancel-line: AppState -> AppState
; replace the line that is currently drawn with #false. If there is no current drawn
; returns the input AppState unchanges

; header
; (define (cancel-line state) state)

; Template
;(define (cancel-line state)
;  (if (false? (AppState-line-start state))
;      ...
;      ... )
;))

; Code
(define (cancel-line state)
  (if (false? (AppState-line-start state))
      state                                                                          ; if there is no line started, we will return the same state
      (make-AppState (AppState-canvas state) #false #false (AppState-color state) )  ; if the line had started, we will cancel it
))


; Input/output
; quit: AppSate -> AppState
; obtain an AppSate which has recorded the information that the application has quit

; header
; (define (quit state) state)

; Template
;(define (quit state)
;  (make-AppState
;   ...
;))

; Code
(define (quit state)
  (make-AppState
   (draw state)
   #false
   #true
   (AppState-color state)
))


; Input/output
; handle-mouse: MouseEvent -> Function
; where:
;     MouseEvent is one of:
;         - button-down     ; strat drawing a line
;         - drag            ; move the current line's end point
;         - button-up       ; add the current line to the canvas
; takes a MouseEvent an call the respective function

; header
; (define (handle-mouse state x y mouse-event) state)


; Template
;(define (handle-mouse state x y mouse-event)
;  (cond [... (string=? mouse-event "drag") ... ]    
;        [(string=? mouse-event "button-down") ... ]                   
;        [(string=? mouse-event "button-up") ... ]                                               
;        [else state]))

; Code
(define (handle-mouse state x y mouse-event)
  (cond [(and (string=? mouse-event "drag") (not (false? (AppState-line-start state))))                                ; If we aare draging and the line is already started
         (move-end state (- x (line2-x1 (AppState-line-start state))) (- y (line2-y1 (AppState-line-start state))))]    ; we will move the end of the line to the current coordinates of the mouse
        [(string=? mouse-event "button-down")
         (make-AppState (AppState-canvas state) (make-line2 x y x y) #false (AppState-color state))]                   ; if we press the mouse buttom, it will start drawing
        [(string=? mouse-event "button-up") (add-line-to-canvas state)]                                                ; if we stop pressing the mouse buttom, it will stop drawing and it will add the line to the canvas
        [else state]))


; Input/output
; handle-key: KeyEvent -> Function
; where:
;      KeyEvent is one of:
;         - q              ; set the app's state to quit
;         - escape         ; cancel the currently drawn line
;         - left, right, up, down    ; move the current line's initial point in the
; corresponding direction by 5 pixels
; takes a KeyEvent an call the respective function

; header
; (define (handle-key state keyevent) state)

; Template
;(define (handle-key state keyevent)
;  (cond
;    [(string=? keyevent "q") ... ]
;    [(string=? keyevent "escape") ... ]
;    [(string=? keyevent "left") ... ]     
;    [(string=? keyevent "right") ... ]     
;    [(string=? keyevent "up") ... ]     
;    [(string=? keyevent "down") ... ]     
;    [else state]))

; Code
(define (handle-key state keyevent)
  (cond
    [(string=? keyevent "q") (quit state)]
    [(string=? keyevent "escape") (cancel-line state)]
    [(and (string=? keyevent "left")(not (false? (AppState-line-start state)))) (move-start state -5 0)]     ; the button must be left pressed for continuous movement
    [(and (string=? keyevent "right") (not (false? (AppState-line-start state)))) (move-start state 5 0)]     
    [(and (string=? keyevent "up") (not (false? (AppState-line-start state)))) (move-start state 0 -5)]     
    [(and (string=? keyevent "down")(not (false? (AppState-line-start state)))) (move-start state 0 5)]     
    [else state]))


; Input/output
; quit?: AppState -> Boolean
; return #true or #false wheter the app has quit or not

; header
; (define (quit? AppState) #false)

; Template
;(define (quit? AppState)
;  (if ( ... (AppState-quit? AppState) ... )
;      ...
;   ))

; Code
(define (quit? AppState)
  (if (equal? (AppState-quit? AppState) #true)
      #true
      #false
   ))


;; ----------------------------------------------------------------------------------------------------------
; MAIN APPLICATION

(define initial-state (make-AppState BACKGROUND #false #false "black" ))

(define (drawing-app initial-state)
  (big-bang initial-state
    [to-draw draw]
    [on-mouse handle-mouse]
    [on-key handle-key]
    [stop-when quit?]))

; for run it automatically when we press Run
(drawing-app initial-state)
