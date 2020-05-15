import gleam/list

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

pub fn sum_of_divisors(n: Int) -> Int {
  let add = fn(x, y) { x + y }
  divisors(n) |> list.fold(0, add)
}

pub fn is_perfect(n: Int) -> Bool {
  sum_of_divisors(n) == n
}

pub type Kind {
  Deficient
  Perfect
  Abundant
}

pub fn kind(n: Int) -> Kind {
  let sum = sum_of_divisors(n)
  case sum == n {
    True ->
      Perfect
    False ->
    case sum > n {
      True ->
        Abundant
      False ->
        Deficient
    }
  }
}