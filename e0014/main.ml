open Printf

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

type longest_chain =
	{n: int; size: int;}

let rec go (n: int) (longest_chain: longest_chain) =
	if n == 1 then
		longest_chain
	else
		let seq =
			sequence n

		in
		let seq_size =
			List.length seq

		in
		let next_longest_chain =
			if seq_size > longest_chain.size then
				{ n = n ; size = seq_size }
			else
				longest_chain
		in
		go (n - 1) next_longest_chain


let () =
	go 1_000_000 { n = 0; size = 0 }
		|> fun {n;size} -> (printf "%d %d") n size