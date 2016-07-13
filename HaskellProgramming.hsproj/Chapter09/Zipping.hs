module Chapter09.Zipping where
  myZip :: [a] -> [b] -> [(a,b)]
  myZip [] [] = []
  myZip [] _ = []
  myZip _ [] = []
  myZip (a:myAs) (b:myBs) = 
    [(a, b)] ++ (myZip myAs myBs)
  