(* open Printf *)
open Core
(* open Core.List *)
open Core.Option

let file_name =
	"input.txt"

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

let left_from (matrix: int list list) (row_ix: int) (col_ix: int): int option =
	List.nth matrix (row_ix + 1)
		>>= (fun row -> List.nth row col_ix)

let right_from (matrix: int list list) (row_ix: int) (col_ix: int): int option =
	List.nth matrix (row_ix + 1)
		>>= (fun row -> List.nth row (col_ix + 1))

let () =
	let
		matrix =
			parse_file ()
	in
	right_from matrix 1 1
		|> Option.value ~default:0
		|> printf "%i"

		(* |> List.concat *)
		(* |> List.iter ~f:(printf "%i") *)
