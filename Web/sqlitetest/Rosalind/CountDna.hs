module CountDna () where

data DNA = A | G | T | C 
           deriving (Show, Ord, Eq)

letterToDNA :: Char -> Maybe DNA
letterToDNA 'A' = Just A
letterToDNA 'G' = Just G
letterToDNA 'T' = Just T
letterToDNA 'C' = Just C
letterToDNA _   = Nothing

-- lettersToDNA :: String -> [DNA]
-- lettersToDNA (x:xs) = case letterToDNA x of
--                         Nothing -> lettersToDNA xs
--                         _       -> letterToDNA x : lettersToDNA xs

lettersToDNA :: String -> [DNA]
lettersToDNA (x:xs) = case letterToDNA x of
                        Just A  -> A : lettersToDNA xs
                        Just G  -> G : lettersToDNA xs
                        Just T  -> T : lettersToDNA xs  
                        Just C  -> C : lettersToDNA xs
                        _       -> lettersToDNA xs

-- let letters = "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"

-- data DNACount = DNACount { a :: Int, g :: Int, t :: Int, c :: Int } deriving (Show)

-- let defaultDNACount = DNACount 0 0 0 0

-- letters 
-- & map (\l -> toLower l)
-- & foldr (\l acc -> case l of 'a' -> acc { a + 1 })

-- x { a = (a x) + 1 }

-- defaultDNACount { (a defaultDNACount) + 1 }
-- acc { (g acc) + 1 }

-- let lowerCase = map (\l -> toLower l) letters

