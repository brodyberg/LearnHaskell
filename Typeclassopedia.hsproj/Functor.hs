module Functor where
  class FunctorB f where
    fmapB :: (a -> b) -> f a -> f b
    
  instance FunctorB [] where
    fmapB _ [] = []
    fmapB g (x:xs) = (g x) : fmap g xs