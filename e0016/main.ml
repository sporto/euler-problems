open Printf

let () =
	Big_int.power_int_positive_int 2 1000
		|> Big_int.string_of_big_int
		|> (printf "%s")
