fn main() {
	let mut pals = vec![];
	for a in (500..=999).rev() {
		for b in (a..=999).rev() {
			let mul = a * b;
			if as_string(mul) == as_string_reversed(mul) {
				pals.push(mul);
			}
		}
	}
	println!("{:?}", pals.iter().max());
}

fn as_string(n: u32) -> String {
	format!("{}", n)
}

fn as_string_reversed(n: u32) -> String {
	as_string(n).chars().rev().collect::<String>()
}