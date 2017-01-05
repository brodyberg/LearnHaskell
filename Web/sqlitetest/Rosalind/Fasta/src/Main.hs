module Main where

import Fasta

-- -- fastaEx :: String
-- -- fastaEx = ">Rosalind_1\n\
-- -- \GATTACA\n\
-- -- \>Rosalind_2\n\
-- -- \TAGACCA"

-- -- type Name = String
-- -- data Chain = String
-- --data DNA = A | G | T | C deriving (Show)
-- -- -- data RNA = A | G | U | C deriving (Show)
-- data Fasta = Fasta { name :: String, chain :: String }
-- --data Fasta = Name Chain
--    -- | Name [RNA] 
--              deriving (Show)

-- emptyFasta :: Fasta
-- emptyFasta = { name = "", chain = "" }

fastaPath :: String
fastaPath = "C:\\Users\\brodyberg\\Documents\\GitHub\\LearnHaskell\\Web\\sqlitetest\\Rosalind\\Fasta\\B5ZC00.fasta"

main :: IO ()
main = do
  b5z <- readFile fastaPath
  let theLines = lines b5z



  print theLines


  -- lines fastaEx
  -- foldr 
  -- (\line (fastas,fasta) -> if (head line) == '>' then )


--  print fastaEx
  putStrLn "hello world"
