open Assemblage

let ocaml_bytecomp = pkg "compiler-libs.bytecomp"

let units names =
  (`Units (List.map (fun n -> unit n (`Path ["src"])) names))

let meta_bin =
  bin "meta" ~deps:[ocaml_bytecomp]
    (units ["pparse_mod"; "compile_mod"; "main"])
    

let () = assemble (project "meta" [
  meta_bin;
])
