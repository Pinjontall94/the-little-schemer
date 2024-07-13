(define-module (the-little-schemer test)
  #:export (my-simple-runner)
  #:use-module (srfi srfi-64))

(define (my-simple-runner filename)
  (let ((runner (test-runner-null))
	(port (open-output-file filename))
	(num-passed 0)
	(num-failed 0))
    (test-runner-on-test-end! runner
      ;; callback that runs after every test
      (lambda (runner)
	(case (test-result-kind runner)
	  ((pass xpass) (set! num-passed (+ 1 num-passed)))
	  ((fail xfail) (set! num-failed (+ 1 num-failed)))
	  (else #t))))
    (test-runner-on-final! runner
      ;; callback that runs after all tests are done
      (lambda (runner)
	(format port "Passing tests: ~d.~%Failing tests: ~d.~%"
		num-passed num-failed)
	(close-output-port port)))
    ;; now that runner's behavior is customized, create the runner
    runner))

(test-runner-factory
 (λ () (my-simple-runner "my-test.log")))
