pub fn is_leap_year(year) {
  case year % 100 {
    0 ->
      year % 400 ==0
    _ ->
      year % 4 == 0
  }
}

pub fn hello_world() {
  "Hello, from app!"
}
