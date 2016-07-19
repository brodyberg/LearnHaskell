module Chapter09.And where
  -- list, and, True iff no values are False
  and' :: [Bool] -> Bool
  and' [] = True
  and' (b:bools) = 
    b && and' bools

  -- True if any are True
  or' :: [Bool] -> Bool
  or' [] = False
  or' (b:bools) =
    b || or' bools
  
  -- returns True if any value applied
  -- to f returned True
  any' :: (a -> Bool) -> [a] -> Bool
  any' _ [] = False
  any' f (x:xs) = 
    f x || any' f xs  
    
  -- returns True if one of the values
  -- in [a] matches a
  elem' :: Eq a => a -> [a] -> Bool
  elem' _ [] = False
  elem' m (x:xs) =
    m == x || elem' m xs
    
  reverse' :: [a] -> [a]
  reverse' [] = []
  reverse' (x:xs) = 
    reverse' xs ++ [x]
    
  -- flatten list of lists into list
  squish' :: [[a]] -> [a]
  squish' [] = []
  squish' (x:xs) =
    x ++ squish' xs
    
  -- maps a function over a list
  -- and concatenates the results
  squishMap :: (a -> [b]) -> [a] -> [b]
  squishMap _ [] = []
  squishMap f (x:xs) =
    f x ++ squishMap f xs
    
  -- flattens a list of lists into a list
  -- reuse squishMap
  squishAgain :: [[a]] -> [a]
  squishAgain [] = []
  squishAgain (x:xs) =
    squishMap (\x -> [x]) x ++ squishAgain xs

  -- drag a comparator across a list
  -- put the winner of each comparison
  -- into a list
  -- at the end of the overall list
  -- return the last item in our comparator list
  -- compare the latest max against next item
  -- 
--myMaximumBy takes a comparison function and a list and returns the greatest element of the list based on the last value that the comparison returned GT for.  

--  maximumBy' :: (a -> a -> Ordering) -> [a] -> a
--  maximumBy' maxTest [] = LT
----  maximumBy' maxTest x = maxTest 
--  maximumBy' maxTest (x:xs) = 
--    maxTest xs
        
  maxBy :: (a -> a -> Ordering) -> [a] -> a
--  maxBy f [] = LT
  maxBy f xs = 
--    if (f x) == GT then GT else LT
  -- where the fuck am I getting this other thing
  -- and why am I supplying it? rather than 
  -- the author of (a -> a -> Ordering)?
    head $ filter (\item -> (f item) == GT)  xs
----
----

    -- how do we remember we've ever tested GT?
    -- if we've tested GT we'd continue searching
    -- but I can't see how we remember
  
    -- and where are we getting left and right?
--    f x 
    -- do we need a separate iterator 
    -- by which we remember things?
    -- I think we might
    
--    x
    --[f x] ++ maxBy f xs 
































