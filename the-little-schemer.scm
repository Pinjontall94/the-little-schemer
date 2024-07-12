#!/usr/bin/guile \
-e main -s 
!#
(define-module (the-little-schemer)
  #:export (main)
  #:use-module (srfi srfi-64)
  #:use-module (the-little-schemer test))

(define main
  (λ ()
    (display "hello world!")
    (newline)
    (test-runner-factory
     (λ () (my-simple-runner "/tmp/my-test.log")))))
