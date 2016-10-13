module Functors where

import Control.Lens
  
-- items from chapter 12 of Programming in Haskell 2nd Ed by Graham Hutton

inc :: [Int] -> [Int]
inc [] = []
inc (n:ns) = n+1 : inc ns

sqr :: [Int] -> [Int]
sqr [] = []
sqr (n:ns) = n^2 : sqr ns

map' :: (a -> b) -> [a] -> [b]
map' f []     = []
map' f (x:xs) = f x : map f xs

inc' = map' (+1)

--class Functor f where
--  fmap :: (a -> b) -> f a -> f b

--instance Functor [] where
--  fmap = map

data Maybe' a = Nothing_ | Just_ a
  deriving Show

instance Functor Maybe' where
  fmap _ Nothing_ = Nothing_
  fmap g (Just_ x)  = Just_ (g x)
  
data Tree a = 
  Leaf a | Node (Tree a) (Tree a)
  deriving Show
  
instance Functor Tree where
  fmap g (Leaf x)   = Leaf (g x)
  fmap g (Node l r) = Node (fmap g l) (fmap g r)
  
--instance Functor IO where
--  -- fmap (a -> b) -> f a -> f b
--  -- fmap (a -> b) -> IO a -> IO b
--  fmap g mx = do { x <- mx; return (g x)}

inc'' :: Functor f => f Int -> f Int
inc'' = fmap (+1)

--class Functor f => Applicative f where
--  pure :: a -> f a
--  (<*>) :: f (a -> b) -> f a -> f b
  
--instance Applicative Maybe where
--  -- pure :: a -> fa
--  pure = Just
--  Nothing <*> _ = Nothing
--  (Just g) <*> mx = fmap g mx
 
prods :: [Int] -> [Int] -> [Int]
prods xs ys = [ x * y | x <- xs, y <- ys]

prods2 :: [Int] -> [Int] -> [Int]
prods2 xs ys = pure (*) <*> xs <*> ys


































  


