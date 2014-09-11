
(** Function composition. *)
let compose : ('a → 'b) -> ('c → 'a) -> 'c → 'b =
	λ f g x → f \ g x

(** Infix function composition operator. *)
let (<<) = compose
