module Fasta 
    (toFasta, Fasta, name, chain) 
    where

data Fasta = Fasta { name :: String, chain :: String }
             deriving (Show)

toFasta :: [String] -> Fasta
toFasta fileLines =
    foldr 
    (\fileLine acc -> 
        if (head fileLine) == '>'
        then acc { name = (tail fileLine) }
        else acc { chain = fileLine ++ (chain acc) })
    Fasta { name = "", chain = "" }
    fileLines