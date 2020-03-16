open Core
(* open Printf *)

let print_string v =
	printf "%s " v

let print_list l =
	List.iter ~f:print_string l

let print_pair (a, b) =
	printf "(%d, %d)" a b

let print_pairs pairs =
	List.iter ~f:print_pair pairs

(* let debug n =
	print_num n ; n *)

let file_name =
	"names.txt"

let read_file () : string =
	In_channel.read_all file_name

let parse_file (): string list =
	read_file ()
		|> String.split ~on:','

let () =
	parse_file ()
	|> List.sort ~compare:String.compare
	|> print_list