
open Foundation
open Foundation.Monoid.Syntax


implicit module Person = struct
	type t = {
		name: string;
		age: int
	}

	let create = λ ~name ~age → {name; age}

	let to_string p = "Person { name = " + p.name + " }" 
end


let () =
	print (Person.create ~name: "Eve" ~age:19)


let () = 
	let name = "world" in
	print ("hello, " + name);
	print (32 + 1)
