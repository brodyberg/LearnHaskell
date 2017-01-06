module Main where

import Fasta

fastaPath :: String
fastaPath = "C:\\Users\\brodyberg\\Documents\\GitHub\\LearnHaskell\\Web\\sqlitetest\\Rosalind\\Fasta\\B5ZC00.fasta"

main :: IO ()
main = do
  b5z <- readFile fastaPath
  let theLines = lines b5z

  let f = toFasta $ lines b5z

  print $ toFasta $ lines b5z
  print theLines
  
  if ((chain f) == concat (tail theLines))
  then print "perfect match"
  else print "mismatch"