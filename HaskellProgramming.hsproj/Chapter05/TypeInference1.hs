module Chapter5.TypeInference1 where

  data Foo = Domestic | Imported deriving Show 

--  ith :: [a] -> Int -> a
--  ith lst i = 

  first :: (a,b) -> a
  first x = fst x

  triple :: Integer -> Integer
  triple a = a * 3
  
--  triple' :: Num -> Num
--  triple' a = a * 3
--  
--  triple'' :: Fractional Int -> Fractional
--  triple'' a = a * 3
--  times :: Num a => a -> b -> a
--  times x y = x * y
  a :: (a -> c) -> a -> a
  a f b = b
  
  a' :: (a -> b) -> a -> b
  a' f a = f(a)

  co :: (b -> c) -> (a -> b) -> (a -> c)
  co f g = \a -> f(g(a))
  -- long story short: I have no idea how to get an a
  -- to get a c though, I call (b -> c)
  -- so: f(g(here is where a should go)
--   co f g = \g -> f(g)

  -- I have to get a such that I can return a built
  -- function that takes an a  

--  co (b -> c) (a -> b) = (a -> b)
--  co f g = 

--  co :: (b -> c) -> (a -> b) -> (a -> c)  
--  co (b -> c) (a -> b) = \a -> c  
--  co f g = (\a -> c)
--  co f g = \a -> f
  

  i :: a -> a
  i a = a
  
  c :: a -> b -> a
  c a b = a
  
  c'' :: b -> a -> b
  c'' b a = b

  c' :: a -> b -> b
  c' a b = b
  
  r :: [a] -> [a]
  r [a] = [a]

--  functionC :: (Ord x, Ord y) => x -> y -> Bool 
  functionC :: Ord a => a -> a -> Bool
--  functionC :: (Num a, Num b) => a -> b -> Bool
  functionC x y = 
    if (x > y) 
    then True
    else False

  functionH :: [a] -> a
  functionH (x:_) = x
-- fails  functionH [] = []

  functionS :: (x,y) -> y
  functionS (x, y) = y  
  

  f :: Num a => a -> a -> a
  f x y = x + y + 3
  
--  (++) :: [a] -> [a] -> [a]
--  (++) x y = x + y

-- myConcat x = x ++ " yo"
  toTriple :: a -> b -> c -> (a, b, c)
  toTriple a b c = (a, b, c)
  
  
--  add :: (Num a, Num b) => a -> b -> a
--  add a b = a + b 