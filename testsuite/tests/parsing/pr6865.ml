(* TEST
   flags = "-dparsetree"
   ocamlc_byte_exit_status = "2"
   * setup-ocamlc.byte-build-env
   ** ocamlc.byte
   *** check-ocamlc.byte-output
*)
[%%foo
  let x = 42]

[%%foo
  let _ = ()
  
  and _ = ()]

[%%foo
  let _ = ()]
