(define-module (the-little-schemer test)
  #:export (my-simple-runner)
  #:use-module (srfi srfi-64))

(define (my-simple-runner filename)
  (let ((runner (test-runner-null))
	(port (open-output-file filename))
	(num-passed 0)
	(num-failed 0))
    (test-runner-on-test-end! runner
      (lambda (runner)
	(case (test-result-kind runner)
	  ((pass xpass) (set! num-passed (+ 1 num-passed)))
	  ((fail xfail) (set! num-failed (+ 1 num-failed)))
	  (else #t))))
    (test-runner-on-final! runner
      (lambda (runner)
	(format port "Passing tests: ~d.~%Failing tests: ~d.~%"
		num-passed num-failed)
	(close-output-port port)))
    runner))

;; (test-runner-factory
;;  (λ () (my-simple-runner "/tmp/my-test.log")))

(test-begin "vec-test")
(define v '())
(test-assert (vector? v))
(test-end "vec-test")
