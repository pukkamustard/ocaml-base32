(use-modules
 (guix packages)
 (guix build-system dune)
 ((guix licenses) #:prefix license:)
 (gnu packages ocaml))

(define-public ocaml-base32
  (package
    (name "ocaml-base32")
    (version "1.0.0")
    (source #f)
    (build-system dune-build-system)
    (arguments '())
    (native-inputs
     (list ocaml-alcotest ocaml-qcheck))
    (home-page "https://inqlab.net/git/ocaml-base32")
    (synopsis "Base32 encoding for OCaml")
    (description "Base32 is a binary-to-text encoding that represents
binary data in an ASCII string format by translating it into a
radix-32 representation.  It is specified in RFC 4648.")
    (license license:isc)))

ocaml-base32
