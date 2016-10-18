module Applicative where
  class FunctorB f where
    fmapB :: (a -> b) -> f a -> f b
  
  class FunctorB f => ApplicativeB f where
    pureB :: a -> f a 
    infixl 4 <*> 
    (<*>) :: f (a -> b) -> f a -> f b
    
  instance FunctorB [] where 
    fmapB _ [] = []
    fmapB g (x:xs) = (g x) : fmap g xs

  data Two a = Foo a | Bar a
    deriving Show
  
  instance FunctorB Two where
    fmapB f (Foo x) = Foo $ f x
    fmapB f (Bar x) = Bar $ f x

  -- can discriminated unions be applicative?
  -- how would pure work? 
--  instance ApplicativeB Two where
--    pure v = -- well, which case?

  instance ApplicativeB Two where
    pure a = Foo a
    (<*>) f x = 

  instance ApplicativeB [] where
    pureB a = [a]
    (<*>) _ [] = []
--    (<*>) g (x:xs) = g x : g <*> xs


