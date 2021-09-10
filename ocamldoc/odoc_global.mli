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
(** Global variables. *)

(** The kind of source file in arguments. *)
type source_file =
  | Impl_file of string
  | Intf_file of string
  | Text_file of string

val include_dirs : string list ref
(** The include_dirs in the OCaml compiler. *)

val merge_options : Odoc_types.merge_option list ref
(** The merge options to be used. *)

val classic : bool ref (** Classic mode or not. *)


val dump : string option ref
(** The optional file name to dump the collected information into.*)

val load : string list ref (** The list of information files to load. *)

val sort_modules : bool ref (** We must sort the list of top modules or not.*)


val no_stop : bool ref
(** We must not stop at the stop special comments. Default is false (we stop).*)

val no_custom_tags : bool ref
(** We must raise an exception when we find an unknown @-tag. *)

val remove_stars : bool ref
(** We must remove the first characters of each comment line, until the first asterisk '*'. *)

val keep_code : bool ref
(** To keep the code while merging, when we have both .ml and .mli files for a module. *)

val inverse_merge_ml_mli : bool ref
(** To inverse implementation and interface files when merging. *)

val filter_with_module_constraints : bool ref
(** To filter module elements according to module type constraints. *)

val hidden_modules : string list ref (** The list of module names to hide. *)

val files : source_file list ref (** The files to be analysed. *)

val errors : int ref (** A counter for errors. *)

val warn_error : bool ref (** Indicate if a warning is an error. *)


val show_missed_crossref : bool ref
(** Show code fragments that could be transformed into a cross-reference. *)

val pwarning : string -> unit
(** Print the given warning, adding it to the list of {!errors}
if {!warn_error} is [true]. *)

val out_file : string ref
(** The file used by the generators outputting only one file. *)

val verbose : bool ref (** Verbose mode or not. *)


val intro_file : string option ref
(** The optional file whose content can be used as intro text. *)

val title : string option ref
(** The optional title to use in the generated documentation. *)

val target_dir : string ref
(** The directory where files have to be generated. *)

val with_toc : bool ref
(** The flag which indicates if we must generate a table of contents. *)

val with_index : bool ref
(** The flag which indicates if we must generate an index. *)

val with_header : bool ref
(** The flag which indicates if we must generate a header.*)

val with_trailer : bool ref
(** The flag which indicates if we must generate a trailer.*)

val initially_opened_module : string ref
(** Name of the module that is initially opened. *)

val library_namespace : string ref
(** Name of the library namespace for a prefixed library *)
