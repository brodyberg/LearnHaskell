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

  -- why so stuck on this?
  -- every other it was clear what we were operating on
  -- for some reason the description of the problem was
  -- super odd and I can't figure out how to vary 
  -- what's passed to the compare AND there are very 
  -- few compare functions in the first place that 
  -- return Ordering AND I couldn't explain why
  -- the second example should work
  
  -- what if we recurse, chaining on the second param?
  
--  myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
--  myMaximumBy f (x:[]) = x
--  myMaximumBy f (x:xs) =
--    f x $ myMaximumBy f xs

  myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
  myMaximumBy f (x:[]) = x
  myMaximumBy f (x:y:xs) =
    if (f x y == GT) then x else y











