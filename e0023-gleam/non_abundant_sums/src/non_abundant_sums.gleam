pub fn hello_world() -> String {
  "Hello, from non_abundant_sums!"
}

fn divisors_rec(num: Int, next: Int) -> List(Int) {
  let is_divisor = num % next == 0

  case num == next {
    True ->
      []
    False ->
      case is_divisor {
        True ->
          [next, ..divisors_rec(num, next + 1)]
        False ->
          divisors_rec(num, next + 1)
      }
  }
}

pub fn divisors(n: Int) -> List(Int) {
  divisors_rec(n, 1)
}