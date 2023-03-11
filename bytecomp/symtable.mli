(**************************************************************************)
(*                                                                        *)
(*                                 OCaml                                  *)
(*                                                                        *)
(*             Xavier Leroy, projet Cristal, INRIA Rocquencourt           *)
(*                                                                        *)
(*   Copyright 1996 Institut National de Recherche en Informatique et     *)
(*     en Automatique.                                                    *)
(*                                                                        *)
(*   All rights reserved.  This file is distributed under the terms of    *)
(*   the GNU Lesser General Public License version 2.1, with the          *)
(*   special exception on linking described in the file LICENSE.          *)
(*                                                                        *)
(**************************************************************************)

(* Assign locations and numbers to globals and primitives *)

open Cmo_format

module GlobalMap : sig
  type t
  val empty : t
  val filter : (Ident.t -> bool) -> t -> t
  val iter : (Ident.t -> int -> unit) -> t -> unit
  val mem : t -> Ident.t -> bool
end

(* Functions for batch linking *)

val init: unit -> unit
val patch_object: Misc.LongString.t -> (reloc_info * int) list -> unit
val require_primitive: string -> unit
val initial_global_table: unit -> Obj.t array
val all_primitives : unit -> string array
val transl_const: Lambda.structured_constant -> Obj.t

(* Functions for the toplevel *)

val init_toplevel: unit -> (string * Digest.t option) list
val update_global_table: unit -> unit
val get_global_value: Ident.t -> Obj.t
val is_global_defined: Ident.t -> bool
val assign_global_value: Ident.t -> Obj.t -> unit
val get_global_position: Ident.t -> int
val check_global_initialized: (reloc_info * int) list -> unit
val defined_globals: (reloc_info * int) list -> Ident.t list
val required_globals: (reloc_info * int) list -> Ident.t list


val current_state : unit -> GlobalMap.t
val restore_state : GlobalMap.t -> unit
val hide_additions : GlobalMap.t -> unit

(* Error report *)

type error =
    Undefined_global of string
  | Unavailable_primitive of string
  | Wrong_vm of string
  | Uninitialized_global of string

exception Error of error

open Format

val report_error: formatter -> error -> unit

val reset: unit -> unit
