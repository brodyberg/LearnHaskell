import Data.Char
 
-- From Programming in Haskell 2nd Ed
-- by Graham Hutton
-- Caesar Cipher, Section 5.5 pg 52

-- Letter to integer
let2int :: Char -> Int
let2int c = ord c - ord 'a'

-- Integer to Letter
int2let :: Int -> Char
int2let n = chr (ord 'a' + n)

-- Only shift lower-case characters
shift :: Int -> Char -> Char
shift n c | isLower c = int2let ((let2int c + n) `mod` 26)
          | otherwise = c

-- Caesar cipher a string by Int amount
encode :: Int -> String -> String
encode n xs = [shift n x | x <- xs]

-- Opposite of Caesar cipher
decode :: Int -> String -> String
decode n xs = encode (-n) xs

-- Received odds of the occurence of particular
-- characters within English sentences
table :: [Float]
table = [8.1, 1.5, 2.8, 4.2, 12.7, 2.2, 2.0, 6.1, 7.0,
         0.2, 0.8, 4.0, 2.4, 6.7, 7.5, 1.9, 0.1, 6.0,
         6.3, 9.0, 2.8, 1.0, 2.4, 0.2, 2.0, 0.1]
         
-- Given a string, return the count of lower-case 
-- letters
lowers :: String -> Int
lowers xs = length [x | x <- xs, x >= 'a' && x <= 'z']

-- Given a character and a string, return the 
-- number of times that character appears in the string
count :: Char -> String -> Int
count x xs = length [x' | x' <- xs, x == x']

-- Calculate what percentage n is of m
percent :: Int -> Int -> Float
percent n m = (fromIntegral n / fromIntegral m) * 100

-- Given a string, return a list of percentages
-- each representing the % that letter (a-z) occurs
-- within the given string where the length of the 
-- given string is understood to consist soley of
-- lower-case characters
freqs :: String -> [Float]
freqs xs = [percent (count x xs) n | x <- ['a'..'z']]
            where n = lowers xs
            
-- | "such that"
-- <- "is drawn from" 
-- x <- [1..5] is called a "generator"
-- x <- [1..5], x == y is called a "guard" and yields
-- a value from the comprehension if it's True

-- Compute the Chi square statistic between two lists of 
-- percentages - observed and expected. What matters for
-- the purposes of this excercise is that the smaller
-- the number produced by the Chi square statistic, the
-- closer the two lists match. 
-- Basically, I think the CSS is a summation answer for 
-- the question: assuming the keys are the same (which is 
-- unknown in our case) how closely do the values match?
-- In other words, we have two lists, how closely do they 
-- match? In our case we know that the "keys" for our 
-- lists are the letter frequencies in English sentences
-- but they could be anything for a general application. 
-- This is why we rotate below so we can pose this question
-- and then seek the minimum CSS value which indicates
-- that the two lists likely have matching keys. 
chisqr :: [Float] -> [Float] -> Float
chisqr os es = sum [((o - e)^2)/e | (o,e) <- zip os es]

-- Given an Int and a list, rotate the contents of
-- the list by Int
rotate :: Int -> [a] -> [a]
rotate n xs = drop n xs ++ take n xs

-- Given a and a list of as, return a list representing
-- ordinals where a appears in as. 
positions :: Eq a => a -> [a] -> [Int]
positions x xs = [i | (x', i) <- zip xs [0..], x == x']

crack :: String -> String
crack xs = decode factor xs
  where
    factor = head (positions (minimum chitab) chitab)
    chitab = [chisqr (rotate n table') table | n <- [0..25]]
    table' = freqs xs


