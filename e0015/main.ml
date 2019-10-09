open Printf

(* Start with a list that is double the grid size e.g. 3 x 3 grid -> 6 list 
All numbers are 0 except the two in the middle, which are 1
*)

let base_list grid_size =
	List.init
		(grid_size * 2)
		(fun ix ->
			if ix == grid_size - 1 || ix == grid_size then
				1
			else
				0
		)

(*
The reduce the list by adding up contiguous cells
e.g. 1 3 3 1 -> 4 6 4 -> 10 10 -> 20
*)
let reduce l =
	List.map2
		(+)
		(l |> List.rev |> List.tl |> List.rev) 
		(List.tl l)

let rec reduce_until_one l =
	match l with
		| [ n ] -> [ n ]
		| more -> reduce more |> reduce_until_one

let () =
	base_list 20
		|> reduce_until_one
		|> List.iter (printf "%d")
