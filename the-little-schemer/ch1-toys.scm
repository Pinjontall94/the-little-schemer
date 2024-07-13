#!/usr/local/bin/guile -L . -s 
!#

(define-module (the-little-schemer ch1-toys)
  #:export (problems atom?)
  #:use-module (srfi srfi-64))

(define (atom? a)
  (and (not (pair? a))
       (not (null? a))))

(define (problems)
  (test-begin "ch1-toys")
  ;; Chapter 1 Start! :3
  (test-assert (atom? 'atom))
  (test-end))
