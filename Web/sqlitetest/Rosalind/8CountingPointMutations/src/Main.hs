module Main where

import HammingDistance

main :: IO ()
main = do
  print $ hammingDistance left right
  where left  = "GAGCCTACTAACGGGAT"
        right = "CATCGTAATGACGGCCT"
