open Core

let print_num v =
	printf "%d " v

let print_num_list l =
	List.iter ~f:print_num l

let debug n =
	print_num n ; n

let sum =
	List.fold ~init:0 ~f:(+)

let max =
	28123

let rec divisors_ (num: int) (next: int) : int list =
	if num = next then
		[]
	else if num mod next = 0 then
		next :: divisors_ num (next + 1)
	else
		divisors_ num (next + 1)

let divisors_of (n:int) : int list =
	divisors_ n 1

let sum_of_divisors (n:int) : int =
	divisors_of n |> sum

let is_abundant n =
	sum_of_divisors n > n

let rec abundant_numbers_from n acc =
	if n = 0 then
		acc
	else if is_abundant n then
		abundant_numbers_from (n-1) (n::acc)
	else
		abundant_numbers_from (n-1) acc

let () =
	let
		abundant_numbers =
			abundant_numbers_from max []
	in
	no_possible
