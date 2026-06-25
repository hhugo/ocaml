(* TEST *)

(* Regression test for box-depth accounting in [Format.pp_close_tbox].

   [pp_open_tbox] increments [pp_curr_depth] unconditionally, so the
   matching [pp_close_tbox] must always decrement it -- exactly as
   [pp_close_box] does.  A previous version only decremented inside the
   [pp_curr_depth < pp_max_boxes] branch, so opening and then closing a
   tabulation box while at or beyond [max_boxes] leaked the depth counter.
   Once leaked, [pp_curr_depth] stayed above [pp_max_boxes] forever, and
   [pp_print_string] (gated by [pp_curr_depth < pp_max_boxes]) silently
   dropped every subsequent piece of output.

   With the bug this prints an empty line; fixed, it prints "RESULT". *)

let () =
  let buf = Buffer.create 16 in
  let ppf = Format.formatter_of_buffer buf in
  Format.pp_set_max_boxes ppf 2;
  (* Nested tabulation boxes reaching and exceeding max_boxes, then closed. *)
  Format.pp_open_tbox ppf ();
  Format.pp_open_tbox ppf ();
  Format.pp_close_tbox ppf ();
  Format.pp_close_tbox ppf ();
  (* The depth counter must be back to its initial value for this to print. *)
  Format.pp_print_string ppf "RESULT";
  Format.pp_print_flush ppf ();
  print_endline (Buffer.contents buf)
