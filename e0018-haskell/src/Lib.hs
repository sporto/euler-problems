{-# LANGUAGE OverloadedStrings #-}

module Lib
    ( run
    ) where

import Flow
import qualified Data.Char as Char
import qualified Data.Text as T

run :: IO ()
run = do
	input <- readInput
	let parsed =
		input |> T.lines |> map parseLine
	putStrLn (parsed |> concat |> map Char.intToDigit )

inputFileName =
	"input_1.txt"

readInput :: IO T.Text
readInput = do
	s <- readFile inputFileName
	return (T.pack s)

parseLine :: T.Text -> [Int]
parseLine line =
	line
		|> T.strip
		|> T.unpack
		|> filter Char.isDigit
		|> map Char.digitToInt

