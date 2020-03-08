open Core
(* open Core.Option *)
(* open Core.List *)

(* Read input *)

type matrix =
	int list list

type coor = int * int

let file_name =
	"input_2.txt"

let read_file () : string list =
	file_name
		|> In_channel.read_lines

let split_line line : string list =
	line
		|> String.split ~on:' '

let parse_line line : int list =
	line
		|> split_line
		|> Core.List.map ~f:int_of_string

let parse_file (): matrix =
	List.map ~f:parse_line (read_file ());;

let print_list list =
	List.iter ~f: (printf "%d ") list

let reduce_row (row: int list) (row_for_max: int list) : int list =
	let
		reducer ix row_value =
			let left =
				List.nth row_for_max ix
					|> Option.value ~default: 0
			in
			let right =
				List.nth row_for_max (ix + 1)
					|> Option.value ~default: 0
			in
			row_value + max left right
	in
	row
		|> List.mapi ~f: reducer

let rec walk matrix =
	match matrix with
	| [] ->
		0
	| row :: [] ->
		List.hd row
			|> Option.value ~default: 0
	| row_for_max :: row :: rest  ->
		reduce_row row row_for_max :: rest
			|> walk

let () =
	let
		matrix =
			parse_file ()
	in
	let
		result =
			matrix
				|> List.rev
				|> walk
	in
	printf "%d " result

