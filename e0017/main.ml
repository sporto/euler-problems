open Printf

let rec num_in_words n =
	match n with
	| 0 -> ""
	| 1 -> "one"
	| 2 -> "two"
	| 3 -> "three"
	| 4 -> "four"
	| 5 -> "five"
	| 6 -> "six"
	| 7 -> "seven"
	| 8 -> "eight"
	| 9 -> "nine"
	| 10 -> "ten"
	| 11 -> "eleven"
	| 12 -> "twelve"
	| 13 -> "thirteen"
	| 14 -> "fourteen"
	| 15 -> "fifteen"
	| 16 -> "sixteen"
	| 17 -> "seventeen"
	| 18 -> "eighteen"
	| 19 -> "nineteen"
	| _ ->
		if n < 30 then
			"twenty" ^ num_in_words (n mod 10)
		else if n < 40 then
			"thirty" ^ num_in_words (n mod 10)
		else if n < 50 then
			"forty" ^ num_in_words (n mod 10)
		else if n < 60 then
			"fifty" ^ num_in_words (n mod 10)
		else if n < 70 then
			"sixty" ^ num_in_words (n mod 10)
		else if n < 80 then
			"seventy" ^ num_in_words (n mod 10)
		else if n < 90 then
			"eighty" ^ num_in_words (n mod 10)
		else if n < 100 then
			"ninety" ^ num_in_words (n mod 10)
		else if n < 1000 then
			if n mod 100 == 0 then
				num_in_words (n / 100) ^ "hundred"
			else
				num_in_words (n / 100) ^ "hundredand" ^ num_in_words (n mod 100)
		else
			"onethousend"

let num_letter_count n =
	num_in_words n
		|> String.length

let rec go sum current max =
	let
		debug =
			printf "%i = %s \n" current (num_in_words current)
	in
	debug; if current > max then
		sum
	else
		go (sum + num_letter_count current) (current + 1) max

let () =
	go 0 1 1000
		|> (printf "%i")
