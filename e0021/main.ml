open Core
(* open Printf *)

let print_num n =
	printf "%d " n

let print_list l =
	List.iter ~f:print_num l

let print_pair (a, b) =
	printf "(%d, %d)" a b

let print_pairs pairs =
	List.iter ~f:print_pair pairs

let debug n =
	print_num n ; n

let sum ns =
	List.fold_left ~f:(+) ~init:0 ns

let rec divisors_ (num: int) (next: int) : int list =
	if num = next then
		[]
	else if num mod next = 0 then
		next :: divisors_ num (next + 1)
	else
		divisors_ num (next + 1)

let divisors_of n =
	divisors_ n 1

let sum_of_divisors (n:int) : int =
	n
	|> divisors_of
	|> sum

let amicable_pair n : (int * int) option =
	if n = 1 then
		Some (1,1)
	else
		let a =
				sum_of_divisors n
		in let b =
				sum_of_divisors a
		in
		if n = b && not (n = a) then
			Some (n,a)
		else
			None

let rec amicable_pairs_under (n: int) : (int * int) list =
	let
		this =
			n - 1
	in
	if this = 0 then
		[]
	else
		match amicable_pair n with
		| None ->
			amicable_pairs_under this
		| Some pair ->
			pair :: amicable_pairs_under this

let amicable_numbers_under n =
	amicable_pairs_under n
		|> List.concat_map ~f:(fun (a,b) -> [a;b])
		|> List.dedup_and_sort ~compare:Int.compare

let res : int =
	sum_of_divisors 220

(* let res2 =
	is_amicable 220 *)

let res3 =
	amicable_pairs_under 10000

(* let res4 =
	res3 |> sum *)

let () =
	amicable_numbers_under 10000
		|> sum
		|> print_num