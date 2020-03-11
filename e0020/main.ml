open Core
open Bigint

let input =
	of_int 100

let rec reduce (n: Bigint.t) (sum: Bigint.t) : Bigint.t =
	if n = of_int 0 then
		sum
	else
		reduce (n - of_int 1) (sum * n)

let rec split (n: Bigint.t) : Bigint.t list =
	let
		next =
			n / of_int 10
	in
	if n = of_int 0 then
		[]
	else
		(rem n (of_int 10)) :: (split next)

let calc =
	reduce input (of_int 1)
	|> split
	|> Core.List.fold ~f:(+) ~init:(of_int 0);;

let () =
	let
		res =
			calc
			|> to_int
			|> Core.Option.value ~default:(-1)
	in
	printf "%d" res
