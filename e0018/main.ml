open Core
open Core.Option

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

let get matrix (x, y) =
	List.nth matrix (y)
		>>= (fun row -> List.nth row x)

let left_coor (x , y) =
	(x, y + 1)

let right_coor (x, y) =
	(x + 1, y  + 1)

let left_value (matrix: int list list) coor : int option =
	get matrix (left_coor coor)

let right_value (matrix: int list list) coor : int option =
	get matrix (right_coor coor)

let rec add (matrix: int list list) (acc: int) coor: int =
	match get matrix coor with
	| Some n ->
		pick_side matrix (acc + n) coor
	| _ ->
		acc
and pick_side (matrix: int list list) (acc: int) coor =
	let
		left =
			left_value matrix coor
	in
	let
		right =
			right_value matrix coor
	in
	match (left, right) with
	| (Some l, Some r) ->
		if l > r then
			add matrix acc (left_coor coor)
		else
			add matrix acc (right_coor coor)
	| _ ->
		acc



let () =
	let
		matrix =
			parse_file ()
	in
	add matrix 0 (0, 0)
		|> printf "%i"
