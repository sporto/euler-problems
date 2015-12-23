import Html

main =
  Html.text response

response =
  toString (List.sum even)

even =
  List.filter (\v -> v % 2 == 0) values

values =
  List.filter (\v -> v < 4000000) (fibs 33)

fibs : Int -> List Int
fibs index =
  case index of
    0 ->
      [1]
    1 ->
      [1, 1]
    _ ->
      let
        previous =
          (fibs (index - 1))
        a =
          previous
            |> List.head
            |> Maybe.withDefault 0
        b =
          previous
            |> List.drop 1
            |> List.head
            |> Maybe.withDefault 0
        current =
          a + b
      in
        current :: previous

