open Printf

let rec range l a b =
  if a = b then
  	l @ [b]
  else
  	range (l @ [a]) (a + 1) b


let rec rest_of_sequence n =
	let next =
		if n mod 2 == 0 then
			n / 2
		else
			n * 3 + 1
	in
	match n with
	| 1 -> []
	| _ -> next :: rest_of_sequence next

let sequence n =
	n :: rest_of_sequence n

let rec build_sequences n =
	match n with
	| 1 -> []
	| _ ->
		sequence n :: build_sequences (n - 1)

(* 
let print_sequence n =
	(sequence n) *)

let pick_max (previous_ix, previous_count) (ix, count) =
	if count > previous_count then
		(ix, count)
	else
		(previous_ix, previous_count)

let () =
	(* build_sequences 1_000_000 *)
	range [] 1 1_000_000
		|> List.map sequence
		|> List.mapi (fun ix l -> (ix + 1, List.length l))
		|> List.fold_left pick_max (0, 0)
		|> fun (ix, count) -> (printf "%d %d") ix count
