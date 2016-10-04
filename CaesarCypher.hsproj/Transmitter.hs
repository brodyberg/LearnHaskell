module Transmitter where
  
import Data.Char

type Bit = Int

bin2int' :: [Bit] -> Int
bin2int' bits = 
  sum [w*b | (w,b) <- zip weights bits]
  where weights = iterate (*2) 1
  
bin2int :: [Bit] -> Int
bin2int = foldr (\x y -> x + 2*y) 0

int2bin :: Int -> [Bit]
int2bin 0 = []
int2bin n = n `mod` 2 : int2bin (n `div` 2)

make8 :: [Bit] -> [Bit]
make8 bits = take 8 (bits ++ repeat 0)

encode :: String -> [Bit]
encode = concat . map (make8 . int2bin . ord)

chop8 :: [Bit] -> [[Bit]]
chop8 [] = []
chop8 bits = take 8 bits : chop8 (drop 8 bits)

decode :: [Bit] -> String
decode = map (chr . bin2int) . chop8

channel :: [Bit] -> [Bit]
channel = id

transmit :: String -> String
transmit = decode . channel . encode

--foo :: Bit -> Bit -> Bit
--foo x y = x + 2*y
--
--sum' :: Num a => [a] -> a
--sum' = foldr (+) 0
--
--adder :: Num a => a -> a -> a
--adder x y = x + y
--
--sum'' :: Num a => [a] -> a
--sum'' = foldr adder 0