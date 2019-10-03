fn main() {
	let mut result: u64 = 1;
	let max = 20;
	let mut primer_factors = vec![];

	// Get a vector with primer factors for each number
	// e.g. [ [2,2] , [3,3,2] ]
	for n in (1..=max) {
		primer_factors.push(prime_factors_for(n));
	}

	println!("{:?}", primer_factors);

	// Then we want to find max number of primer factors
	let mut result = 1;

	for n in (1..=max) {
		let max_for_n: usize = primer_factors
			.iter()
			.map( |set|
				set.iter()
					.cloned()
					.filter(|other| *other == n)
					.collect::<Vec<_>>()
					.len()
			).max().unwrap_or(0);

		let mult: u64 = if max_for_n > 0 {
			u64::pow(n, max_for_n as u32)
		} else {
			1
		};

		println!("n={:?} max={:?} mult ={:?}", n, max_for_n, mult);

		result *= mult;
	}

	println!("{:?}", result);
}

fn prime_factors_for(n: u64) -> Vec<u64> {
	let mut remainder = n;
	let mut res = vec![];
	let mut i = 2;

	while i <= n {
		if remainder % i == 0 {
			res.push(i);
			remainder /= i;
		} else {
			i += 1;
		}
	}

	res
}