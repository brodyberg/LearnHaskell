module Chapter09.Filtering where
  
-- Write a filter function that would give us all the multiples of 3 out of a list from 1-30?
onlyMultiplesOf3 :: Integral a => [a] -> [a]
onlyMultiplesOf3 nums = 
  filter (\x -> (mod x 3) == 0) nums
  
-- Recalling what we learned about function composition, how could we compose the above function with the length function to tell us *how many* multiples of 3 there are between 1 and 30?

countOfMultiplesOf3 :: Integral a => [a] -> Int
countOfMultiplesOf3 nums = 
  length $ onlyMultiplesOf3 nums

-- Next we’re going to work on removing all articles (’the’, ’a’, and ’an’) from sentences. You want to get to something that works like this:--     Prelude> myFilter "the brown dog was a goof"--     ["brown","dog","was","goof"]

filterOutMumbling :: String -> [String]
filterOutMumbling str = 
  filter 
    (\i -> 
      (all 
        (\x -> x /= i) 
        ["the", "a", "an"])) 
    $ words str

filterOutMumbling' :: String -> String
filterOutMumbling' str = 
  concat $ -- merge
  map (\x -> x ++ " ") $ -- add space
    filter -- remove mumbling
      (\i -> 
        (all 
          (\x -> x /= i) 
          ["the", "a", "an"])) 
      $ words str -- single string to n words

filterOutMumbling'' :: String -> String
filterOutMumbling'' str = 
  concat $ -- merge
  map (++ " ") $ -- add space
    filter -- remove mumbling
      (\i -> 
        (all 
          (\x -> x /= i) 
          ["the", "a", "an"])) 
      $ words str -- single string to n words

--addSpace :: [String] -> String
--addSpace x = map x ++ " "

--addSpaceToEach :: [String] -> [String]
--addSpaceToEach x = map (++ " ")

filterOutMumbling3 :: String -> String
filterOutMumbling3 str = 
  concat $ -- merge
  map (++ " ") $ -- add space
    filter -- remove mumbling
      (\i -> 
        (all 
          (\x -> x /= i) 
          ["the", "a", "an"])) 
      $ words str -- single string to n words

removeMatchesTo :: [String] -> [String] -> [String]
removeMatchesTo blocklist items = 
  filter -- remove mumbling
    (\i -> 
      (all 
        (\x -> x /= i) 
        blocklist))
    items 

removeMumbling = removeMatchesTo ["the", "a", "an"]

filterOutMumbling4 :: String -> String
filterOutMumbling4 str = 
  concat $ -- merge
  map (++ " ") $ -- add space
  removeMatchesTo ["the", "a", "an"] (words str)

filterOutMumbling5 :: String -> String
filterOutMumbling5 str = 
  concat $
  map (++ " ") $
  removeMumbling $ 
  words str

addSpaces :: [String] -> [String]
addSpaces strs = 
  map (++ " ") strs

filterOutMumbling6 :: String -> String
filterOutMumbling6 str = 
  concat $
  addSpaces $
  removeMumbling $ 
  words str


















