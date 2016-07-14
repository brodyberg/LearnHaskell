module Chapter09.Cipher where
  import Data.Char

  -- rightward caesar cipher
  -- param for shift size
    
  cipher :: Int -> String -> String
  cipher _ [] = ""
  cipher shift (x:xs) =
    [(chr $ shift + ord x)] ++ (cipher shift xs)
    
  decipher :: Int -> String -> String
  decipher _ [] = ""
  decipher shift (x:xs) = 
    [(chr $ ord x - shift)] ++ (decipher shift xs)