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

(** Representation of element names. *)

type t = string

val parens_if_infix : t -> t
(** Add parenthesis to the given simple name if needed. *)

val simple : t -> t
(** Return a simple name from a name.*)

val father : t -> t
(** Return the name of the 'father' (like dirname for a file name).*)

val concat : t -> t -> t
(** Concatenates two names. *)

val normalize_name : t -> t
(** Normalize the given name by removing the beginning and ending spaces
     of the simple name and adding parenthesis if needed. *)

val head : t -> t
(** Returns the head of a name. *)

val depth : t -> int
(** Returns the depth of the name, i.e. the number of levels to the root.
   Example : [Toto.Tutu.name] has depth 3. *)

val prefix : t -> t -> bool
(** Returns true if the first name is a prefix of the second name.
   If the two names are equal, then it is false (strict prefix).*)

val alias_unprefix : t -> t -> t
(** remove a [Library__] prefix and capitalize the resulting name *)

val get_relative : t -> t -> t
(** Take two names n1 and n2 = n3.n4 and return n4 if n3=n1 or else n2. *)

val get_relative_opt : t -> t -> t
(** [get_relative_opt n1 n2] is [n2] if [n1=""] and
    [get_relative n1 n2] otherwise *)

val get_relative_raw : t -> t -> t
(** Take two names n1=n3.n4 and n2 = n5.n6 and return n6 if n3=n5 or else n2. *)

val hide_given_modules : t list -> t -> t
(** Take a list of module names to hide and a name,
   and return the name when the module name (or part of it)
   was removed, according to the list of module names to hide.*)

val qualified : t -> bool
(** Indicate if a name if qualified or not. *)

val from_ident : Ident.t -> t
(** Get a name from an [Ident.t]. *)

val from_path : Path.t -> t
(** Get a name from a [Path.t]. *)

val to_path : t -> Path.t
(** Get a [Path.t] from a name.*)

val from_longident : Longident.t -> t
(** Get a name from a [Longident.t].*)

module Map : Map.S with type key = t
