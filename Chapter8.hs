--fourFactorial :: Integer
--fourFactorial = 4 * 3 * 2 * 1
--
--brokenFact1 :: Integer -> Integer
--brokenFact1 n = n * brokenFact1 (n - 1)

--module Factorial where
--  factorial :: Integer -> Integer
--  factorial 0 = 1
--  factorial n = n * factorial (n - 1)
  
-- let x = []
module FFS where
  myHead [a] = a
  myHead (x:_) = x
  