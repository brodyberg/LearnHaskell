module Main where

import RNAtoProtein

-- letters2 :: String
-- letters2 = "AUGGCCAUGGCGCCCAGAACUGAGAUCAAUAGUACCCGUAUUAACGGGUGA"

main :: IO ()
main = do
  print $ rnaToProtein letters
  where letters = "AUGGCCAUGGCGCCCAGAACUGAGAUCAAUAGUACCCGUAUUAACGGGUGA"
