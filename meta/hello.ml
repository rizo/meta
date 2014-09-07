
let hello formatter name =
	print_endline \ formatter name

let () =
	hello (fun n -> "Hello," ^ n ^ "!") "World";
