#lang racket
(require "api.rkt")

(define (test)
  (define-values (screen-height screen-width)
    (getmaxyx))
  (init-pair! 1 COLOR_WHITE COLOR_RED)
  (let ([ch (string (getch))])
  (addchstr (format "YOU PRESSED ~a!" ch)
            (color-pair 1) A_BOLD
            #:y (quotient screen-height 2)
            #:x (quotient (- screen-width
                             (string-length "YOU PRESSED ~a!"))
                          2)))
  (getch))

(with-ncurses test)