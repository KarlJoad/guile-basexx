;; Per-directory local variables for GNU Emacs 23 and later.

((nil
  . ((fill-column . 78)
     (tab-width   .  8)
     (sentence-end-double-space . t)
     (eval . (add-to-list 'completion-ignored-extensions ".go"))

 (scheme-mode
  .
  ((indent-tabs-mode . nil)
   (eval . (put 'test-assert 'scheme-indent-function 1))
   (eval . (put 'test-assertm 'scheme-indent-function 1))
   (eval . (put 'test-equalm 'scheme-indent-function 1))
   (eval . (put 'test-equal 'scheme-indent-function 1))
   (eval . (put 'test-eq 'scheme-indent-function 1))
   (eval . (put 'call-with-input-string 'scheme-indent-function 1))
   (eval . (put 'call-with-port 'scheme-indent-function 1))
   (eval . (put 'guard 'scheme-indent-function 1))
   (eval . (put 'lambda* 'scheme-indent-function 1))
   (eval . (put 'substitute* 'scheme-indent-function 1))
   (eval . (put 'match-record 'scheme-indent-function 2))))

 (texinfo-mode    . ((indent-tabs-mode . nil)
                     (fill-column . 72)
                     (sentence-end-double-space . t))))
