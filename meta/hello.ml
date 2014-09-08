
type person = {
	name: string;
	age: int
}


let print_person_args = λ name age →
	print_endline \
		"Name: " ^ name ^ "\n" ^
		" Age: " ^ string_of_int age ^ "\n"


let print_person_tuple = λ (name, age) →
	print_endline \
		"Name: " ^ name ^ "\n" ^
		" Age: " ^ string_of_int age ^ "\n"


let print_person_record = λ {name; age} →
	print_endline \
		"Name: " ^ name ^ "\n" ^
		" Age: " ^ string_of_int age ^ "\n"


let print_person_star = λ * →
	print_endline \
		"Name: " ^ fst _args ^ "\n" ^
		" Age: " ^ string_of_int (snd _args) ^ "\n"


let () =
	print_person_record {name = "Eve"; age = 19};
	print_person_args "Adam" 20;
	print_person_tuple ("Eve", 19);
	print_person_star ("Eve", 19)
