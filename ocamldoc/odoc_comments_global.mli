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

(** The global variables used by the special comment parser.*)

val nb_chars : int ref
(** the number of chars used in the lexer. *)

val authors : string list ref
(** the authors list *)

val version : string option ref
(** the version string *)

val sees : string list ref
(** the see references *)

val since : string option ref
(** the since string *)

val before : (string * string) list ref
(** the before tag information *)

val deprecated : string option ref
(** the deprecated flag *)

val params : (string * string) list ref
(** parameters, with name and description *)

val raised_exceptions : (string * string) list ref
(** the raised exceptions, with name and description *)

val return_value : string option ref
(** the description of the return value *)

val customs : (string * string) list ref
(** the strings associated to custom tags. *)

val init : unit -> unit
(** this function inits the variables filled by the parser. *)
