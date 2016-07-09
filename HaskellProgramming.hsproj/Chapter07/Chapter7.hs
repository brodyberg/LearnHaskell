module Chapter07.Chapter7 where

  numbers :: (Num a, Ord a) => a -> Integer
  numbers x
    | x < 0  = -1
    | x == 0 = 0
    | x > 0  = 1

  pal :: [Char] -> Bool
  pal xs
    | xs == reverse xs = True
    | otherwise        = False

  avgGrade :: (Fractional a, Ord a) => a -> Char
  avgGrade x 
    | y >= 0.9  = 'A'
    | y >= 0.8  = 'B'
    | y >= 0.7  = 'C'
    | y >= 0.59 = 'D'
    | otherwise = 'F'
    where y = x / 100

  avgGrade' :: (Fractional a, Ord a) => a -> Char
  avgGrade' x 
    | y >= 0.7  = 'C'
    | y >= 0.9  = 'A'
    | y >= 0.8  = 'B'
    | y >= 0.59 = 'D'
    | otherwise = 'F'
    where y = x / 100

    
  dodgy :: Num a => a -> a -> a
  dodgy x y = x + y * 10

  nums x = 
    case compare x 0 of 
      LT -> -1
      GT -> 1
      _ -> 0

  ifEvenAdd2 n = if even n then (n+2) else n
  ifEvenAdd2' n =
    case even n of 
      True -> n + 2
      _ -> n
  
  functionC x y = if (x > y) then x else y
  functionC' x y = 
    case x > y of
      True -> x
      _ -> y

  f :: (a, b, c) -> (d, e, f) -> 
       ((a, d), (c, f))
  
  f (m, n, o) (p, q, r) =
    ((m, p), (o, r))

  k (x, y) = x  

  mTh1 x y z = x * y * z
  mTh2 x y = \z -> x * y * z
  mTh3 x = \y -> \z -> x * y * z
  mTh4 = \x -> \y -> \z -> x * y * z
  
  addOneIfOdd n = case odd n of 
    True -> f n
    False -> n
    where f = \n -> n + 1
    
  addFive x y = 
    (if x > y 
     then y
     else x) + 5
 
  mflip f = \x -> \y -> f y x
