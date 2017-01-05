module Main where

-- fastaEx :: String
-- fastaEx = ">Rosalind_1\n\
-- \GATTACA\n\
-- \>Rosalind_2\n\
-- \TAGACCA"

-- type Name = String
-- data DNA = A | G | T | C deriving (Show)
-- -- data RNA = A | G | U | C deriving (Show)
-- data Fasta = Name [DNA]
--    -- | Name [RNA] 
--     deriving (Show)

main :: IO ()
main = do
  b5z <- readFile "C:\\Users\\brodyberg\\Documents\\GitHub\\LearnHaskell\\Web\\sqlitetest\\Rosalind\\Fasta\\B5ZC00.fasta"
  let theLines = lines b5z

  print theLines


  -- lines fastaEx
  -- foldr 
  -- (\line (fastas,fasta) -> if (head line) == '>' then )


--  print fastaEx
  putStrLn "hello world"
