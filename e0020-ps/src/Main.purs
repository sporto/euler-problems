module Main where

import Prelude

import Data.Array
import Data.BigInt
import Data.Foldable
import Effect (Effect)
import Effect.Class.Console (log)

input =
  30

reduce :: Int -> BigInt -> BigInt
reduce n sum =
  if n == 0 then
    sum
  else
    reduce (n - 1) (sum * fromInt n)

split :: BigInt -> Array BigInt
split n =
  let
    next =
      n / fromInt 10
  in
  if n == fromInt 0 then
    []
  else
    cons ((n `mod` fromInt 10)) (split next)

-- result :: Int
result =
  reduce input (fromInt 1)
    -- # split
    -- # foldl (+) 0

main :: Effect Unit
main = do
  log (show result)
