import GHC.Int
import Data.Tuple

-- data Bool = True | False

data Mood = Blah | Woot
  deriving Show

changeMood :: Mood -> Mood
 
changeMood Blah = Woot
changeMood _ = Blah

f = (1, 2)

myAbs :: Integer -> Integer
myAbs int = 
  if int >= 0 then int
  else -int
  
g :: (a, b) -> (c, d) -> ((b, d), (a, c))
g (a,b) (c,d) = ((b,d), (a,c))

--myFirst :: [a] -> a
--myFirst l = (\x : xs -> x) l

--myFirst [x : xs] = x
--myFirst [] = []

addOne x = (\x -> x + 1) x

firstOne x = (\x -> x) x

curry f a b = f (a,b)
