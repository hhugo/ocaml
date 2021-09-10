(**************************************************************************)
(*                                                                        *)
(*                                 OCaml                                  *)
(*                                                                        *)
(*                       Pierre Chambart, OCamlPro                        *)
(*           Mark Shinwell and Leo White, Jane Street Europe              *)
(*                                                                        *)
(*   Copyright 2013--2016 OCamlPro SAS                                    *)
(*   Copyright 2014--2016 Jane Street Group LLC                           *)
(*                                                                        *)
(*   All rights reserved.  This file is distributed under the terms of    *)
(*   the GNU Lesser General Public License version 2.1, with the          *)
(*   special exception on linking described in the file LICENSE.          *)
(*                                                                        *)
(**************************************************************************)

[@@@ocaml.warning "+a-4-9-30-40-41-42"]

(** [Parameter.t] carries a unique [Variable.t] used as function parameter.
    It can also carry annotations about the usage of the variable. *)

type t

type parameter = t

val wrap : Variable.t -> t
(** Make a parameter from a variable with default attributes *)

val var : t -> Variable.t

val rename : ?current_compilation_unit:Compilation_unit.t -> t -> t
(** Rename the inner variable of the parameter *)

val map_var : (Variable.t -> Variable.t) -> t -> t

module T : Identifiable.Thing with type t = t

module Set : sig
  include Identifiable.Set with module T := T

  val vars : parameter list -> Variable.Set.t
end

include Identifiable.S with type t := t and module T := T and module Set := Set

module List : sig
  val vars : t list -> Variable.t list
  (** extract variables from a list of parameters, preserving the order *)
end
