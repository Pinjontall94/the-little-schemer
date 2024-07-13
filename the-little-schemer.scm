#!/usr/bin/guile \
-L . -e '(@ (the-little-schemer) main)' -s
!#
;; -L .          ->   load all dirs in the $CWD
;; -e '(@ ...)'  ->   set entry point of script to function main in module
;; -s            ->   begin reading scheme source code
(define-module (the-little-schemer)
  #:export (main)
  #:use-module (srfi srfi-64)
  #:use-module (the-little-schemer test))

(use-modules ((the-little-schemer ch1-toys)
	      #:prefix ch1:))

(define main
  (λ ()
    (display "hello world!")
    (newline)
    (ch1:problems)))
