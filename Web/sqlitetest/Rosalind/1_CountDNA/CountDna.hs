module CountDna 
    (lettersToCounts) 
    where

data DNACount = DNACount { a :: Int, c :: Int, g :: Int, t :: Int } 
                deriving (Show)

lettersToCounts :: String -> DNACount
lettersToCounts ls = 
    foldr 
    (\letter acc -> 
                case letter of 
                    'A' -> acc { a = (a acc) + 1 }
                    'C' -> acc { c = (c acc) + 1 }
                    'G' -> acc { g = (g acc) + 1 }
                    'T' -> acc { t = (t acc) + 1 }
                    _   -> acc)
    DNACount { a = 0, c = 0,  g = 0, t = 0}
    ls