import Html

main =
  Html.text response

response =
  toString values

values =
  List.filter (\v -> v < 4000000) (fibs 30)

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
        current :: (fibs (index - 1))

