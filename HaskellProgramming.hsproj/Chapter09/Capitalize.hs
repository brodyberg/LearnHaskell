module Chapter09.Capitalize where
  import Data.Char

  capitalize :: String -> String
  capitalize str =
    [capitalizeFirst str] ++ (tail str)
  
  capitalize' :: String -> String
  capitalize' [] = []
  capitalize' str =
    [capitalizeFirst str] ++ capitalize' (tail str)
    
  capitalizeFirst :: String -> Char
  capitalizeFirst str = 
    toUpper (head str)

  -- this is composed - we allow the user to pass 
  -- in the function, thus composing it 
  capitalizeFirst' :: (Char -> Char) -> String -> Char
  capitalizeFirst' f str = f $ head str
  
  capitalizeFirst2 :: (Char -> Char) -> String -> Char
  capitalizeFirst2 f str = f $ head str

  cFirstPointFreeTry :: (Char -> Char) -> String -> Char
  cFirstPointFreeTry f str = f . head $ str

  cFirstPointFree1 :: (Char -> Char) -> String -> Char
  cFirstPointFree1 f = f . head

  thing :: Integral a => a -> [a]
  thing = take 5 . filter odd . enumFrom
  
  fNotPointFree :: String -> Int
  fNotPointFree str = 
    length $ filter (== 'a') str
    
  -- The reason we can't use . in place of $ above is 
  -- because filter (== 'a') str is fully applied.
  -- . requires two function parameters and if we've got
  -- the right hand parameter being fully applied it's
  -- not a function. This also shows why $ is not used
  -- in the pointfree case - because $ requires the
  -- right hand parameter to be a non-function value
  -- but pointfree style is about writing unapplied
  -- functions at term-level

  fPointFree :: String -> Int
  fPointFree = 
    length . filter (== 'a')
    

  -- point free is accomplished by writing a function
  -- which is not fully applied - it can be any level of
  -- partially applied, but must not be fully applied. 