
let test_encode_padded () =
  Alcotest.(
    check string "" (Base32.encode_string "") "";
    check string "f" (Base32.encode_string "f") "MY======";
    check string "fo" (Base32.encode_string "fo") "MZXQ====";
    check string "foo" (Base32.encode_string "foo") "MZXW6===";
    check string "foob" (Base32.encode_string "foob") "MZXW6YQ=";
    check string "fooba" (Base32.encode_string "fooba") "MZXW6YTB";
    check string "foobar" (Base32.encode_string "foobar") "MZXW6YTBOI======")

let test_encode_unpadded () =
  Alcotest.(
    check string "" (Base32.encode_string ~pad:false "") "";
    check string "f" (Base32.encode_string ~pad:false "f") "MY";
    check string "fo" (Base32.encode_string ~pad:false "fo") "MZXQ";
    check string "foo" (Base32.encode_string ~pad:false "foo") "MZXW6";
    check string "foob" (Base32.encode_string ~pad:false "foob") "MZXW6YQ";
    check string "fooba" (Base32.encode_string ~pad:false "fooba") "MZXW6YTB";
    check string "foobar" (Base32.encode_string ~pad:false "foobar") "MZXW6YTBOI")

let test_decode_padded () =
  Alcotest.(
    check string "" (Base32.decode_exn "") "";
    check string "f" (Base32.decode_exn "MY======") "f";
    check string "fo" (Base32.decode_exn "MZXQ====") "fo";
    check string "foo" (Base32.decode_exn "MZXW6===") "foo";
    check string "foob" (Base32.decode_exn "MZXW6YQ=") "foob";
    check string "fooba" (Base32.decode_exn "MZXW6YTB") "fooba";
    check string "foobar" (Base32.decode_exn "MZXW6YTBOI======") "foobar")

let test_decode_unpadded () =
  Alcotest.(
    check string "" (Base32.decode_exn "") "";
    check string "f" (Base32.decode_exn "MY") "f";
    check string "fo" (Base32.decode_exn "MZXQ") "fo";
    check string "foo" (Base32.decode_exn "MZXW6") "foo";
    check string "foob" (Base32.decode_exn "MZXW6YQ") "foob";
    check string "fooba" (Base32.decode_exn "MZXW6YTB") "fooba";
    check string "foobar" (Base32.decode_exn "MZXW6YTBOI") "foobar")

let test_decode_invalid () =
  Alcotest.check_raises "invalid" (Invalid_argument "Malformed input")
    (fun () -> Base32.decode_exn "invalid" |> ignore)

let () =
  let open Alcotest in
  run "Base32" [
    "encode", [
      test_case "padded" `Quick test_encode_padded;
      test_case "unpadded" `Quick test_encode_unpadded;
    ];
    "decode", [
      test_case "padded" `Quick test_decode_padded;
      test_case "upadded" `Quick test_decode_unpadded;
      test_case "invalid" `Quick test_decode_invalid;
    ];
  ]
