module Chapter09.Capitalize where
  import Data.Char

  capitalize :: String -> String
  capitalize str =
    [toUpper (head str)] ++ (tail str)
    