import non_abundant_sums
import gleam/should

pub fn hello_world_test() {
  non_abundant_sums.hello_world()
  |> should.equal("Hello, from non_abundant_sums!")
}

pub fn divisors_test() {
  non_abundant_sums.divisors(12)
  |> should.equal([1,2,3,4,6])

  non_abundant_sums.divisors(28)
  |> should.equal([1,2,4,7,14])
}

pub fn sum_of_divisors_test() {
  non_abundant_sums.sum_of_divisors(12)
  |> should.equal(16)

  non_abundant_sums.sum_of_divisors(28)
  |> should.equal(28)
}

pub fn is_perfect_test() {
  non_abundant_sums.is_perfect(12)
  |> should.equal(False)

  non_abundant_sums.is_perfect(28)
  |> should.equal(True)
}