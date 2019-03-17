(**************************************************************************)
(*                                                                        *)
(*                                 OCaml                                  *)
(*                                                                        *)
(*             Maxence Guesdon, projet Cristal, INRIA Rocquencourt        *)
(*                                                                        *)
(*   Copyright 2001 Institut National de Recherche en Informatique et     *)
(*     en Automatique.                                                    *)
(*                                                                        *)
(*   All rights reserved.  This file is distributed under the terms of    *)
(*   the GNU Lesser General Public License version 2.1, with the          *)
(*   special exception on linking described in the file LICENSE.          *)
(*                                                                        *)
(**************************************************************************)

(** Miscellaneous functions *)

val no_blanks : string -> string
(** [no_blanks s] returns the given string without any blank
   characters, i.e. '\n' '\r' ' ' '\t'.
*)

val input_file_as_string : string -> string
(** This function returns a file in the form of one string.*)

val split_with_blanks : string -> string list
(** [split_with_blanks s] splits the given string [s] according to blanks. *)

val string_of_longident : Longident.t -> string
(** This function creates a string from a Longident.t .*)

val get_fields : Types.type_expr -> (string * Types.type_expr) list
(** This function returns the list of (label, type_expr) describing
   the methods of a type_expr in a Tobject.*)

val string_of_text : Odoc_types.text -> string
(** get a string from a text *)

val string_of_author_list : string list -> string
(** @return a string for an authors list. *)

val string_of_version_opt : string option -> string
(** @return a string for the given optional version information.*)

val string_of_since_opt : string option -> string
(** @return a string for the given optional since information.*)

val string_of_raised_exceptions : (string * Odoc_types.text) list -> string
(** @return a string for the given list of raised exceptions.*)

val string_of_see : Odoc_types.see_ref * Odoc_types.text -> string
(** @return a string for the given "see also" reference.*)

val string_of_sees : (Odoc_types.see_ref * Odoc_types.text) list -> string
(** @return a string for the given list of "see also" references.*)

val string_of_return_opt : Odoc_types.text option -> string
(** @return a string for the given optional return information.*)

val string_of_info : Odoc_types.info -> string
(** get a string from a Odoc_info.info structure *)

val apply_opt : ('a -> 'b) -> 'a option -> 'b option
(** Apply a function to an optional value. *)

val string_of_date : ?absolute:bool -> ?hour:bool -> float -> string
(** Return a string representing a date given as a number of seconds
   since 1970. The hour is optionally displayed. *)

(* Value returned by string_of_date for current time.
 * Uses environment variable SOURCE_DATE_EPOCH if set; falls back to
 * current timestamp otherwise. *)
val current_date : string

val first_sentence_of_text : Odoc_types.text -> Odoc_types.text
(** Return the first sentence (until the first dot) of a text.
   Don't stop in the middle of [Code], [Verbatim], [List], [Lnum],
   [Latex], [Link], or [Ref]. *)

val first_sentence_and_rest_of_text :
  Odoc_types.text -> Odoc_types.text * Odoc_types.text
(** Return the first sentence (until the first dot) of a text,
   and the remaining text after.
   Don't stop in the middle of [Code], [Verbatim], [List], [Lnum],
   [Latex], [Link], or [Ref]. *)

val text_no_title_no_list : Odoc_types.text -> Odoc_types.text
(** Return the given [text] without any title or list. *)

val text_concat : Odoc_types.text -> Odoc_types.text list -> Odoc_types.text
(** [concat sep l] concats the given list of text [l], each separated with
   the text [sep]. *)

val get_titles_in_text :
  Odoc_types.text -> (int * string option * Odoc_types.text) list
(** Return the list of titles in a [text].
   A title is a title level, an optional label and a text.*)

val create_index_lists : 'a list -> ('a -> string) -> 'a list list
(** Take a sorted list of elements, a function to get the name
   of an element and return the list of list of elements,
   where each list group elements beginning by the same letter.
   Since the original list is sorted, elements whose name does not
   begin with a letter should be in the first returned list.*)

val remove_ending_newline : string -> string
(** [remove_ending_newline s] returns [s] without the optional ending newline. *)

val search_string_backward : pat:string -> s:string -> int
(** [search_string_backward pat s] searches backward string [pat] in string [s].
   Return position in string [s] where [pat] appears, orelse raise [Not_found]. *)

val remove_option : Types.type_expr -> Types.type_expr
(** Take a type and remove the option top constructor. This is
   useful when printing labels, we then remove the top option constructor
   for optional labels.*)

val is_optional : Asttypes.arg_label -> bool
(** Return [true] if the given label is optional.*)

val label_name : Asttypes.arg_label -> string
(** Return the label name for the given label,
   i.e. removes the beginning '?' if present.*)
