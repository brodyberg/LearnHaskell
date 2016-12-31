module HammingDistance 
    (hammingDistance)
    where
    
hammingDistance :: String -> String -> Int
hammingDistance left right =
    foldr 
    (\(l, r) acc -> if l == r then acc else acc + 1)
    0
    (zip left right)
