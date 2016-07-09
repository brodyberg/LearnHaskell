module Chapter09.FilterChar where

import Data.Char

--  Write that function such that, given the input “HbEfLrLxO,” your function will return “HELLO.”
onlyUpper :: [Char] -> [Char]
onlyUpper x = 
  filter (isUpper) x
  -- not sure what to do about , -> .