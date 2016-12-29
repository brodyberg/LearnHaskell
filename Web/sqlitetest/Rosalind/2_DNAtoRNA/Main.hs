module Main where

import CountDna

main :: IO ()
main =
    print $ dnaToRna letters
    where letters = "GATGGAACTTGACTACGTAAATT"