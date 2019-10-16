(* open Printf *)
open Core

let () =
	Big_int.power_int_positive_int 2 1000
		|> Big_int.string_of_big_int
		|> String.to_list
		|> List.map ~f:(String.make 1)
		|> List.map ~f:int_of_string
		|> List.fold_left ~init:0 ~f:(+)
		|> (printf "%i")
