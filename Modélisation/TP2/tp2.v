(* Ouverture d’une section *)
Section LogiquePredicats.

(* Définition de 2 domaines pour les prédicats *) 
Variable A B : Type.

(* Formule du second ordre : Quantification des prédicats P et Q *) 
Theorem Thm_8 : forall (P Q : A -> Prop), (* Quantification du second ordre : P et Q sont des prédicats *)
     (forall x1 : A, (P x1) /\ (Q x1))    (* Quantification du premier ordre : x1, x2 et x3 sont des données de type A *)
     -> 
     (forall x2 : A, (P x2)) /\ (forall x3 : A, (Q x3)).  (* conclusion : P est vrai pour toute valeur de x2 et Q est vrai pour toute valeur de x3 *)
intro P.
intro Q.
intro H1.
split.
intro HA.
pose proof (H1 HA) as PA.
destruct PA as (HPA,HQA).
exact HPA.
intro HA.
pose proof (H1 HA) as PA.
destruct PA as (HPA,HQA).
exact HQA.
Qed.

(* Formule du second ordre : Quantification du prédicat P *) 
Theorem Thm_9 : forall (P : A -> (B -> Prop)), (* P est un prédicat de 2 variables de type A pour la première et B pour la seconde *)
     (exists x1 : A, forall y1 : B, (P x1 y1)) (* hypothèse : il existe une valeur de A notée x1, telle que P est vrai pour toute valeur y1 de A -- même x1 pour tous les y1 *)
     -> 
     forall y2:B, exists x2:A, (P x2 y2).      (* conclusion : pour toute valeur y2 de B, il existe une valeur de A notée x2 telle que P(x2 , y2) -- prenons x2 = x1 et donc y1 = y2 *) 
intro P.
intro H1.
intro y2.
destruct H1 as (x1,Hy).
exists x1.
pose proof (Hy y2).
exact H.
Qed.

(* Formule du second ordre : Quantification des prédicats P et Q *) 
Theorem Thm_10 : forall (P Q : A -> Prop),
     (exists x1 : A, (P x1) -> (Q x1)) (* hyp 1 : il existe une valeur de A notée x1, telle que si P est vraie pour cette valeur alors Q est vraie pour cette valeur *)
     -> 
     (forall x2 : A, (P x2))           (* hyp 2 : P est vraie pour toutes valeurs notée x2 de A *)
     -> 
     exists x3 : A, (Q x3).            (* conclusion : il y a au moins une valeur de A notée x 3 pour laquelle Q est vraie : x1 car  P est vraie pour toutes les valeurs de A donc pour x1 en particulier *)
intro P.
intro Q.
intro H1.
intro H2.
destruct H1 as (x1,H1).
pose proof (H2 x1) as H3.
pose proof (H1 H3) as H4.
exists x1.
exact H4.
Qed.

Variable H : Type.

Variable P : H -> H -> Prop.

Variable GPP : H -> H -> Prop.

Theorem T : (forall (e : H), exists (p : H), (P e p))    (* Tout enfant a un père *)
     /\                                                  (* et *)
     (forall (e : H), forall (gpp : H), ((GPP e gpp)     (* Le grand père paternel *)
          <-> exists (p : H), (P e p) /\ (P p gpp)))     (* est le père du père *)
     -> (forall (e : H), exists (gpp : H), (GPP e gpp)). (* alors tout enfant a un grand père paternel *)
intro H1.
intro e.
destruct H1 as (H1, H2).
pose proof (H1 e) as H3.
destruct H3 as (p, H4).
pose proof (H1 p) as gpp.



Qed.

End LogiquePredicats.






