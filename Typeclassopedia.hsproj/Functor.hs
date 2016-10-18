module Functor where
  class FunctorB f where
    fmapB :: (a -> b) -> f a -> f b
    
  instance FunctorB [] where
    fmapB _ [] = []
    fmapB g (x:xs) = (g x) : fmap g xs
    
--  instance FunctorB (Either a) where
--    fmapB g (Left x) = Left (g x)
--    fmapB g (Right x) = Right (g x)