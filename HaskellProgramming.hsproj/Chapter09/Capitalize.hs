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
