import non_abundant_sums
import gleam/should

pub fn hello_world_test() {
  non_abundant_sums.hello_world()
  |> should.equal("Hello, from non_abundant_sums!")
}
