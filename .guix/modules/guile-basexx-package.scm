;;; Commentary:
;;
;; GNU Guix development package.  To build and install, run:
;;
;;   guix package -f guix.scm
;;
;; To use as the basis for a development environment, run:
;;
;;   guix shell -D -f guix.scm
;;
;;; Code:

(define-module (guile-basexx-package)
  #:use-module (guix packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages texinfo)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix utils)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages guile-xyz)
  #:use-module (gnu packages gnupg))

(define vcs-file?
  ;; Return true if the given file is under version control.
  (or (git-predicate (string-append (current-source-directory) "/../.."))
      (const #t)))                                ;not in a Git checkout

(define-public guile-basexx
  (package
    (name "guile-basexx")
    (version "checkout")
    (source (local-file "../.." "guile-basexx-checkout"
                        #:recursive? #t
                        #:select? vcs-file?))
    (build-system gnu-build-system)
    (native-inputs
     (list autoconf automake pkg-config texinfo guile-3.0))
    (inputs
     (list guile-gcrypt))
    (home-page "https://github.com/KarlJoad/guile-basexx.git")
    (synopsis "Base16/32/64 encoding/decoding library for Guile")
    (description "Base16/32/64 encoding/decoding library for Guile.
This is a @b{copy} of the base16/32/64 implementation in Guix! It has been
factored out to a separate library for any other project that wants to be able
to handle various base-encodings.")
    (license license:gpl3+)))

guile-basexx
