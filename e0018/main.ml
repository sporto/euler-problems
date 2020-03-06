open Core
(* open Core.Option *)
(* open Core.List *)

(* Read input *)

type matrix =
	int list list

type tree =
	| Leaf
	| Node of node
and node = {
  	value: int;
  	left: tree;
  	right: tree;
	}

type coor = int * int

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
		|> Core.List.map ~f:int_of_string

let parse_file (): matrix =
	List.map ~f:parse_line (read_file ());;

let print_list list =
	List.iter ~f: (printf "%d ") list

let left_from (x , y) =
	(x, y + 1)

let right_from (x, y) =
	(x + 1, y  + 1)

let get (matrix: matrix) ((x , y) : coor) : int option =
	match List.nth matrix y with
		| None ->
			None
		| Some row ->
			List.nth row x
(* 
let get_left (matrix: matrix) coor : int option =
	get matrix (left_from coor)

let get_right (matrix: matrix) coor : int option =
	get matrix (right_from coor) *)

let rec make_tree (matrix : matrix) (coor : coor): tree =
	match get matrix coor with
		| Some v ->
			Node {
					value = v;
					left = make_tree matrix (left_from coor);
					right = make_tree matrix (right_from coor);
				}
		| None ->
			Leaf

let print_tree (tree: tree) =
	match tree with
	| Leaf ->
		()
	| Node {value; _;} ->
		printf "%d" value

let () =
	let
		matrix =
			parse_file ()
	in
	let
		tree =
			make_tree matrix (0,0)
	in
	tree
		|> print_tree
	(* matrix
		|> List.iter ~f: print_list *)

