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