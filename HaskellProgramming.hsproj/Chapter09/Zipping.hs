module Chapter09.Zipping where

--  myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
--  myZipWith _ [] [] = []
--  myZipWith _ [] _  = []
--  myZipWith _ _ []  = []
--  myZipWith f (a:myAs) (b:myBs) = 
--    [f a b] ++ (myZipWith f myAs myBs)

-- I put the two fn defns together, ahead of their
-- bodies because if I put myZip together and myZipWith
-- together after myZip, myZip acts like myZipWith
-- is part of the same function(!) and fails to 
-- typeCheck. 

  myZip :: [a] -> [b] -> [(a,b)]
  myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]

--  myZip :: [a] -> [b] -> [(a,b)]
  myZip [] [] = []
  myZip [] _  = []
  myZip _  [] = []
  myZip (a:myAs) (b:myBs) = [(a, b)] ++ (myZip myAs myBs)--  myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
  myZipWith _ [] [] = []
  myZipWith _ [] _  = []
  myZipWith _ _ []  = []
  myZipWith f (a:myAs) (b:myBs) = 
    [f a b] ++ (myZipWith f myAs myBs)
    




