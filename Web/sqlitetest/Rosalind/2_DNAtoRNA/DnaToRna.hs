module DnaToRna
    (dnaToRna) 
    where

swapT :: Char -> Char
swapT 'T' = 'U'
swapT l   = l 

dnaToRna :: String -> String
dnaToRna ls = map swapT ls 