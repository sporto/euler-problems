import Html

nums =
  [1..999]

isMultiple num =
  num % 3 == 0 || num % 5 == 0

multiples =
  List.filter isMultiple nums

sum =
  List.sum multiples

main =
  Html.text (toString sum)
