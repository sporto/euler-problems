open Core
(* open Printf *)

let print_string v =
	printf "%s " v

let print_num v =
	printf "%d " v

let print_string_list l =
	List.iter ~f:print_string l

let print_num_list l =
	List.iter ~f:print_num l

let print_pair (a, b) =
	printf "(%d, %d)" a b

let print_pairs pairs =
	List.iter ~f:print_pair pairs

let debug n =
	print_num n ; n

let file_name =
	"names.txt"

let read_file () : string =
	In_channel.read_all file_name

let parse_file (): string list =
	read_file ()
		|> String.substr_replace_all ~pattern:"\"" ~with_:""
		|> String.split ~on:','

let char_value c =
	Char.to_int c - 64

let add_index ix n =
	(ix + 1) * n

let alphabetic_value (name:string) : int =
	name
		|> String.to_list
		|> List.map ~f:char_value
		(* |> List.map ~f:debug *)
		|> List.fold ~init:0 ~f:(+)

let () =
	parse_file ()
	|> List.sort ~compare:String.compare
	|> List.map ~f:alphabetic_value
	|> List.mapi ~f:add_index
	|> List.fold ~init:0 ~f:(+)
	|> print_num