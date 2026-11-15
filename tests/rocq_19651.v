From Stdlib Require Import List.
From AAC_tactics Require Import AAC Instances.
Import Instances.Lists.

Goal forall (f : (nat -> list nat) -> list nat) (l1 l2 : list nat),
  f (fun x => x :: nil) = l1 -> f (fun x => x :: nil) ++ l2 = l1 ++ l2.
Proof.
intros f l1 l2 H.
aac_rewrite H.
reflexivity.
Qed.
