(use-modules
 (guix packages)
 (guix download)
 (guix git-download)
 (guix build-system dune)
 ((guix licenses) #:prefix license:)
 (gnu packages ocaml)
 (gnu packages libevent))

(define-public ocaml-base32
  (package
    (name "ocaml-base32")
    (version "0.0.0")
    (source #f)
    (build-system dune-build-system)
    (arguments '())
    (native-inputs
     `(("merlin" ,ocaml-merlin)
       ("dot-merlin-reader" ,ocaml-dot-merlin-reader)
       ("ocp-indent" ,ocaml-ocp-indent)
       ("alcotest" ,ocaml-alcotest)))
    (home-page "https://gitlab.com/public.dream/DROMEDAR/ocaml-base32")
    (synopsis "Cross-platform cryptographic primitives required for DROMEDAR")
    (description "sdfsdf")
    (license license:agpl3+)))

ocaml-base32
