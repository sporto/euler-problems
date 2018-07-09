fn main() {
	let res = largest_factor_prime(600851475143);
	println!("{}", res);
}

fn is_factor(a: u64, b: u64) -> bool {
	a % b == 0
}

fn is_prime(n: u64) -> bool {
	match n {
		2 => true,
		3 => true,
		n if n % 2 == 0 => false,
		n if n % 3 == 0 => false,
		_ => {
			let mut i = 5;
			let mut w = 2;
			while i * i <= n {
				if n % i == 0 {
					return false
				} else {
					i += w;
					w = 6 - w;
				}
			}
			return true;
		}
	}
}

fn largest_factor(source: u64) -> u64 {
	let mut div = 2;

	while div < source / 2 {
		let n = source / div;
		if is_factor(source, n) {
			return n
		};
		div += 1;
	}

	1
}

fn largest_factor_prime(num: u64) -> u64 {

	let mut n = largest_factor(num);

	while n > 1 {
		if is_prime(n) { return n };
		n  = largest_factor(n)
	}

	1
}
