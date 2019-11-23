open Core
(* open Core.Option *)
(* open Core.List *)

(* Read input *)

let file_name =
	"input_1.txt"

let read_file () : string list =
	file_name
		|> In_channel.read_lines

let split_line line : string list =
	line
		|> String.split ~on:' '

let parse_line line : int list =
	line
		|> split_line
		|> List.map ~f:int_of_string

let parse_file (): int list list =
	read_file ()
		|> List.map ~f:parse_line

(* Helpers to get values in the matrix *)

let get (matrix: int list list) ((x , y) : int * int) : int option =
	match List.nth matrix y with
		| None ->
			None
		| Some row ->
			List.nth row x

let left_coor (x , y) =
	(x, y + 1)

let right_coor (x, y) =
	(x + 1, y  + 1)

let left_value (matrix: int list list) coor : int option =
	get matrix (left_coor coor)

let left_value_or matrix coor default =
	left_value matrix coor
		|> Option.value ~default: default

let right_value (matrix: int list list) coor : int option =
	get matrix (right_coor coor)

let right_value_or matrix coor (default: int) : int =
	right_value matrix coor
		|> Option.value ~default: default


(* Walk the tree *)

let max_for_coor matrix coor =
	let coor_val =
		get matrix coor
			|> Option.value ~default: 0
	in
	let left =
		left_value_or matrix coor 0
	in
	let right =
		right_value_or matrix coor 0
	in
	let max_child =
		max left right
	in
	coor_val + max_child

(* Take the last two rows and calculate the max on each *)

let reduce_rows (two_rows: int list list) : int list=
	match two_rows with
	| [] -> []
	| r1 :: _ ->
		List.range 0 ((List.length r1) - 1)
			|> List.map ~f: (fun x -> max_for_coor two_rows (x, 0))

let rec reduce (matrix : int list list) : int list =
	let reversed_matrix =
			List.rev matrix
	in
	let debug =
		matrix
			|> List.map
				(List.iter ~f:(printf "%d"))
	in
	match reversed_matrix with
	| [] ->
		[]
	| last :: [] ->
		last
	| last :: second_last :: rest ->
		List.append (List.rev rest) [reduce_rows [second_last; last]]
			|> reduce

let () =
	let
		matrix =
			parse_file ()
	in
	reduce matrix
		|> List.iter ~f:(printf "%d ")
