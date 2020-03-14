(* open Core *)
open Printf

let rec divisors_ (num: int) (next: int) : int list =
	if num = next then
		[]
	else if num mod next = 0 then
		next :: divisors_ num (next + 1)
	else
		divisors_ num (next + 1)

let divisors_of n =
	divisors_ n 1

let res =
	divisors_of 20

let () =
	res
		|> List.iter (printf "%d,")