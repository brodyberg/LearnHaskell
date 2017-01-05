module Fasta 
    (emptyFasta, Fasta) 
    where

data Fasta = Fasta { name :: String, chain :: String }
             deriving (Show)

emptyFasta :: Fasta
emptyFasta = Fasta { name = "", chain = "" }
