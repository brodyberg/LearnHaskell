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
    