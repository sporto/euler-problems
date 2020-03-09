import gleam/list

type Date = tuple(Int, Int)

pub type Info {
  Info(
    date: Date,
    days: Int,
    first: Int,
    sunday: Bool,
  )
}

pub fn is_leap_year(year) {
  case year % 100 {
    0 ->
      year % 400 ==0
    _ ->
      year % 4 == 0
  }
}

fn days_in_month(date: Date) -> Int {
  let tuple(year, month) = date

  case month {
    4 | 6 | 9 | 11 ->
      30
    2 ->
      case is_leap_year(year) {
        True ->
          29
        False ->
          28
      }
    _ ->
      31
  }
}

fn is_sunday(day: Int) -> Bool {
  day % 7 == 0
}

fn get_next_date(date: Date) -> Date {
  let tuple(year, month) = date

  case month {
    12 ->
      tuple(year + 1, 1)
    _ ->
      tuple(year, month + 1)
  }
}

fn go(date: Date, acc: List(Info), count: Int) -> List(Info) {
  let tuple(year, month) = date

  case year > 2000 {
    True -> acc
    False -> {
      let days = days_in_month(date)
      let next = get_next_date(date)
      let info = Info(
        date: date,
        days: days,
        first: count,
        sunday: is_sunday(count),
      )
      go(next, [ info | acc ], count + days)
    }
  }
}

// fn sum(info: Info, acc: Int) -> Int {
//   let Info(date, days, first, sunday) = info
//   sunday
// }

pub fn dates() {
  let first = tuple(1900,1)
  go(first, [], 1)
    |> list.filter(_, fn(info) {
      let Info(date, days, first, sunday) = info
      sunday
    })
}

pub fn response() {
  dates()
    |> list.length
}
