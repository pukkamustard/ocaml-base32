(lang dune 2.7)

(name base32)
(version 1.0.0)
(authors "pukkamustard <pukkamustard@posteo.net>")
(maintainers "pukkamustard <pukkamustard@posteo.net>")
(homepage "https://inqlab.net/git/ocaml-base32.git")
(license ISC)

(generate_opam_files true)

(package
 (name base32)
 (synopsis "Base32 encoding for OCaml")
 (description "Base32 is a binary-to-text encoding that represents binary data in an ASCII string format by translating it into a radix-32 representation.  It is specified in RFC 4648.  This library provides an OCaml implementation of Base32.")
 (depends
 (alcotest :with-test)
 (qcheck :with-test)))