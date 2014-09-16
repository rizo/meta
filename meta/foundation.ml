
(** Function composition. *)
let compose : ('a → 'b) → ('c → 'a) → 'c → 'b =
  λ f g x → f \ g x

(** Identity function. *)
let id : 'a → 'a =
  λ x → x


(** Infix function composition operator. *)
let (<<) = compose


module type Any = sig
  type t
end

module type Stringable = sig
  type t
  val to_string: t → string
end

module Stringable = struct
  let to_string (implicit M : Stringable) x = M.to_string x
end


module type Monoid = sig
  type t
  val empty  : t
  val append : t → t → t
end


module Monoid = struct
  let empty  (implicit M : Monoid) () = M.empty
  let append (implicit M : Monoid) = M.append
  
  module Syntax = struct
    let (+) = append
  end
end


implicit module String = struct
  type t = string

  (* Stringable *)
  let to_string = String.escaped

  (* Monoid *)
  let empty = ""
  let append = (^)
end


implicit module Int = struct
  type t = int

  (* Stringable *)
  let to_string = string_of_int

  (* Monoid *)
  let empty = 0
  let append = (+)
end


let print (implicit M : Stringable) x =
  print_endline (M.to_string x)
