module Chapter07.Exercises where

  tensDigit :: Integral a => a -> a
  tensDigit x = d
    where xLast = x `div` 10
          d     = xLast `mod` 10
  
  tensDigit' :: Integral a => a -> a
  tensDigit' x = fst $ divMod x 10

  hunsD :: Integral a => a -> a
  hunsD x = fst $ divMod x 100