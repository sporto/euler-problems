open Printf

let grid =
	2

let print_point (x,y) =
	(printf "(%d, %d)") x y

let rec go (x, y) =
	if x > grid then
		[]
	else if y > grid then
		[]
	else if (x, y) = (grid, grid) then
		[1]
	else
		go (x + 1, y) @ go (x, y + 1)


let () =
	go (0,0)
		|> List.length
		|> (printf "%d")
