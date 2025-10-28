(***************************************************************************)
(*  This is part of aac_tactics, it is distributed under the terms of the  *)
(*         GNU Lesser General Public License version 3                     *)
(*              (see file LICENSE for more details)                        *)
(*                                                                         *)
(*       Copyright 2009-2010: Thomas Braibant, Damien Pous.                *)
(***************************************************************************)

(** Pretty printing functions we use for the aac_instances
    tactic. *)


(** The main printing function. {!print} uses the rel-context
    to rename the variables, and rebuilds raw Rocq terms (for the given
    context, and the terms in the environment). In order to do so, it
    requires the information gathered by the {!Theory.Trans} module.*)
val print :
  Rocq.Relation.t ->
  Theory.Trans.ir ->
  (int * Matcher.Terms.t * Matcher.Subst.t Search_monad.m) Search_monad.m ->
  EConstr.rel_context  ->
  unit Proofview.tactic

