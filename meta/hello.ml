
open Foundation


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
	print_person_tuple ("Eve", 19);
	print_int \ ((λ n → n / 2) ∘ (λ n → n + 2)) 6;
	print_endline "";
	print_endline \ string_of_int \ if ¬false then 3 else 5
