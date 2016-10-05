module RecursiveTypes where
  
data Nat = Zero | Succ Nat deriving Show

nat2int :: Nat -> Int
nat2int Zero     = 0
nat2int (Succ n) = 1 + nat2int n

int2nat :: Int -> Nat
int2nat 0 = Zero
int2nat n = Succ (int2nat (n - 1))

add :: Nat -> Nat -> Nat
add m n = int2nat (nat2int m + nat2int n)

add' :: Nat -> Nat -> Nat
add' Zero n = n
add' (Succ m) n = Succ (add m n) 

data List a = Nil | Cons a (List a)

len :: List a -> Int
len Nil = 0
len (Cons _ xs) = 1 + len xs

data Tree a = 
  Leaf a 
  | Node (Tree a) a (Tree a)
  deriving Show

t :: Tree Int
t = Node (Node (Leaf 1) 3 (Leaf 4)) 5 (Node (Leaf 6) 7 (Leaf 9))

occurs :: Ord a => a -> Tree a -> Bool
occurs x (Leaf x') = x == x'
occurs x (Node l x' r) = 
  x == x' || occurs x l || occurs x r 
  
flatten :: Tree a -> [a]
flatten (Leaf x) = [x]
flatten (Node l x r) = (flatten l) ++ [x] ++ (flatten r)

