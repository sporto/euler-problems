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

pub fn date_test() {
  app.dates()
    |> expect.equal(_, [])
}

pub fn result_test() {
  app.response()
    |> expect.equal(_, 171)
}
