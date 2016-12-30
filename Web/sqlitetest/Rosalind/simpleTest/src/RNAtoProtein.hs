module RNAtoProtein (rnaToProtein) where

import Prelude hiding (lookup)
import qualified Data.Map.Strict as Map
import Data.List.Split (chunksOf)
import Data.Maybe

-- letters3 :: String
-- letters3 = "AUGGCCAUGGCGCCCAGAACUGAGAUCAAUAGUACCCGUAUUAACGGGUGA"

-- letterChunks = chunksOf 3 letters3

-- lkup :: Map.Map String String
-- lkup = Map.fromList 
--                     [("UUU", "F"),    ("CUU", "L"),  ("AUU", "I"),  ("GUU", "V"),
--                      ("UUC", "F"),    ("CUC", "L"),  ("AUC", "I"),  ("GUC", "V"),
--                      ("UUA", "L"),    ("CUA", "L"),  ("AUA", "I"),  ("GUA", "V"),
--                      ("UUG", "L"),    ("CUG", "L"),  ("AUG", "M"),  ("GUG", "V"),
--                      ("UCU", "S"),    ("CCU", "P"),  ("ACU", "T"),  ("GCU", "A"),
--                      ("UCC", "S"),    ("CCC", "P"),  ("ACC", "T"),  ("GCC", "A"),
--                      ("UCA", "S"),    ("CCA", "P"),  ("ACA", "T"),  ("GCA", "A"),
--                      ("UCG", "S"),    ("CCG", "P"),  ("ACG", "T"),  ("GCG", "A"),
--                      ("UAU", "Y"),    ("CAU", "H"),  ("AAU", "N"),  ("GAU", "D"),
--                      ("UAC", "Y"),    ("CAC", "H"),  ("AAC", "N"),  ("GAC", "D"),
--                      ("UAA", ""),     ("CAA", "Q"),  ("AAA", "K"),  ("GAA", "E"),
--                      ("UAG", ""),     ("CAG", "Q"),  ("AAG", "K"),  ("GAG", "E"),
--                      ("UGU", "C"),    ("CGU", "R"),  ("AGU", "S"),  ("GGU", "G"),
--                      ("UGC", "C"),    ("CGC", "R"),  ("AGC", "S"),  ("GGC", "G"),
--                      ("UGA", ""),     ("CGA", "R"),  ("AGA", "R"),  ("GGA", "G"),
--                      ("UGG", "W"),    ("CGG", "R"),  ("AGG", "R"),  ("GGG", "G")]

rnaToProtein :: String -> String
rnaToProtein letters =
    concat (map fromJust (map (\chunk -> Map.lookup chunk lkup) $ chunksOf 3 letters))
    where lkup = Map.fromList 
                    [("UUU", "F"),    ("CUU", "L"),  ("AUU", "I"),  ("GUU", "V"),
                     ("UUC", "F"),    ("CUC", "L"),  ("AUC", "I"),  ("GUC", "V"),
                     ("UUA", "L"),    ("CUA", "L"),  ("AUA", "I"),  ("GUA", "V"),
                     ("UUG", "L"),    ("CUG", "L"),  ("AUG", "M"),  ("GUG", "V"),
                     ("UCU", "S"),    ("CCU", "P"),  ("ACU", "T"),  ("GCU", "A"),
                     ("UCC", "S"),    ("CCC", "P"),  ("ACC", "T"),  ("GCC", "A"),
                     ("UCA", "S"),    ("CCA", "P"),  ("ACA", "T"),  ("GCA", "A"),
                     ("UCG", "S"),    ("CCG", "P"),  ("ACG", "T"),  ("GCG", "A"),
                     ("UAU", "Y"),    ("CAU", "H"),  ("AAU", "N"),  ("GAU", "D"),
                     ("UAC", "Y"),    ("CAC", "H"),  ("AAC", "N"),  ("GAC", "D"),
                     ("UAA", ""),     ("CAA", "Q"),  ("AAA", "K"),  ("GAA", "E"),
                     ("UAG", ""),     ("CAG", "Q"),  ("AAG", "K"),  ("GAG", "E"),
                     ("UGU", "C"),    ("CGU", "R"),  ("AGU", "S"),  ("GGU", "G"),
                     ("UGC", "C"),    ("CGC", "R"),  ("AGC", "S"),  ("GGC", "G"),
                     ("UGA", ""),     ("CGA", "R"),  ("AGA", "R"),  ("GGA", "G"),
                     ("UGG", "W"),    ("CGG", "R"),  ("AGG", "R"),  ("GGG", "G")]
  
