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

