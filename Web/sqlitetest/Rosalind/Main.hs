module Main where

import CountDna

main :: IO ()
main =
    print $ lettersToCounts letters
    where letters = "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"