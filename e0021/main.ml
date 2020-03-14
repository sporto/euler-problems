(* open Core *)
open Printf

let rec divisors_ (num: int) (next: int) (acc: int list) : int list =
	if num = next then
		acc
	else if num mod next = 0 then
		divisors_ num (next + 1) (next :: acc)
	else
		divisors_ num (next + 1) acc

let divisors_of n =
	divisors_ n 1 []

let res =
	divisors_of 20

let () =
	res
		|> List.iter (printf "%d,")