
(* 0-ary lambdas. *)
let obtain_number = () -> 42
let obtain_unit = () -> ()

(* 1-ary lambdas. *)
let inc = x -> x + 1
let ignore = (x) -> 42
let hello = name -> "Hello, " ^ name ^ "!"

let seq_lambda1 = x -> x, 42
let seq_lambda2 = x -> (x, 42)

let three_sum = x y z -> x + y + z
let sum = x y -> x + y

let test () =
    assert (obtain_number () = 42);
    assert (obtain_unit () = ());
    assert (inc 1 = 2);
    assert (inc 101 = 102);
    assert (inc (-1) = 0);
    assert (ignore 987 = 42);
    assert (ignore true = 42);
    assert (ignore () = 42);
    assert (hello "Bob" = "Hello, Bob!");
    assert (((x -> x + 1) 1) = 2);
    assert ((List.map (x -> x * x) [1; 2; 3]) = [1; 4; 9]);
    let (f, n) = seq_lambda1 in begin
        assert (f 5 = 5);
        assert (n = 42) 
    end;
    assert (seq_lambda2 0 = (0, 42));
    assert (three_sum 1 2 3 = 6);
    assert ((x y -> x + y) 2 3 = 5);
    assert (sum 2 3 = 5)


let () = test ()
