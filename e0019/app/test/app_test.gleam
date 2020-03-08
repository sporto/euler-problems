import app
import gleam/expect

pub fn is_leap_year_test() {
  app.is_leap_year(2019)
    |> expect.equal(_, False)

  app.is_leap_year(2020)
    |> expect.equal(_, True)

  app.is_leap_year(2000)
    |> expect.equal(_, True)
  
  app.is_leap_year(1900)
    |> expect.equal(_, False)
}

pub fn hello_world_test() {
  app.hello_world()
  |> expect.equal(_, "Hello, from app!")
}
