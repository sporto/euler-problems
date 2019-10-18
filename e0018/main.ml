(* open Printf *)
open Core

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

let () =
	parse_file ()
		|> List.concat
		|> List.iter ~f:(printf "%i")
