meta
====

_Hackish experiments with the OCaml compiler infrastructure._

**Meta** is a custom front-end for the OCaml compiler built with the _compiler-libs_ package. It extends and simplifies the OCaml syntax but remains a superset of OCaml, which means that any valid OCaml code is also a valid Meta code.

Here is a small example of how Meta looks:

```

(* Function examples *)

(** Identity function *)
let id : 'a → 'a = λ x → x


(** Function composition. *)
let compose : ('a → 'b) → ('c → 'a) → 'c → 'b =
	λ f g x → f \ g x


(* Type printing. *)

type person = {
	name: string;
	age: int
}

let print_person_args : string → int → unit =
	λ name age → print_endline \
		"Name: " ^ name ^ "\n" ^
		" Age: " ^ string_of_int age ^ "\n"


let print_person_tuple : (string * int) → unit =
	λ (name, age) → print_endline \
		"Name: " ^ name ^ "\n" ^
		" Age: " ^ string_of_int age ^ "\n"


let print_person_record : person → unit =
	λ {name; age} → print_endline \
		"Name: " ^ name ^ "\n" ^
		" Age: " ^ string_of_int age ^ "\n"


let () =
	print_person_record {name = "Eve"; age = 19};
	print_person_args "Adam" 20;
	print_person_tuple ("Eve", 19)

```

### Features

- (Limited) Unicode support.
- Compact lambda syntax.
- Special _explicit application_ operator `\`.
