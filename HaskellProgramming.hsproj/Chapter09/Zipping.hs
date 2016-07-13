module Chapter09.Zipping where

-- There has to be that commented line between the
-- two functions, otherwise myZip thinks that myZipWith
-- is part of it and we fail to parse/typecheck. 

  myZip :: [a] -> [b] -> [(a,b)]
  myZip [] [] = []
  myZip [] _  = []
  myZip _  [] = []
  myZip (a:myAs) (b:myBs) = [(a, b)] ++ (myZip myAs myBs)  --  
  myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
  myZipWith _ [] [] = []
  myZipWith _ [] _  = []
  myZipWith _ _ []  = []
  myZipWith f (a:myAs) (b:myBs) = 
    [f a b] ++ (myZipWith f myAs myBs)
   -- rewrite zip in terms of zipwith

  myZip2 :: [a] -> [b] -> [(a,b)]
  myZip2 [] [] = []
  myZip2 [] _  = []
  myZip2 _  [] = []
  myZip2 (a:myAs) (b:myBs) = [(a, b)] ++ (myZipWith (,) myAs myBs)

