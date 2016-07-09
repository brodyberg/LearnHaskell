module Chapter5.EqExercises where
  
  data TisAnInteger = 
    TisAn Integer
    
  instance Eq TisAnInteger where
    (==) (TisAn x) (TisAn y) = 
      x == y
      
  data TwoIntegers = 
    Two Integer Integer
    deriving Show
    
  instance Eq TwoIntegers where
    (==) (Two x y) (Two p q) = 
      x == y && p == q

  data StringOrInt = 
      TisAnInt Int
    | TisAString String
    
  instance Eq StringOrInt where
    (==) (TisAnInt x) (TisAnInt y) = 
      x == y
    (==) (TisAString s) (TisAString s') =
      s == s'
     
  data Pair a =
    Pair a a 
    deriving Show
  
  -- so (Pair a) in the instance line is talking
  -- about the line 'data Pair a' not the value
  -- constructor 'Pair a a'
  instance Eq a => Eq (Pair a) where  
    (==) (Pair x y) (Pair p q) = 
      x == p &&
      y == q
      
  data Tuple a b = 
    Tuple a b
    
  instance (Eq a, Eq b) => Eq (Tuple a b) where
    (==) (Tuple x y) (Tuple x' y') =
      x == x' &&
      y == y'
      
  data Which a = 
      ThisOne a
    | ThatOne a

  instance (Eq a) => Eq (Which a) where
    (==) (ThisOne x) (ThisOne x') =
      x == x'
    (==) (ThatOne x) (ThatOne x') =
      x == x'
      
  data EitherOr a b = 
      Hello a
    | GoodBye b
    
  instance (Eq a, Eq b) => Eq (EitherOr a b) where
    (==) (Hello x) (Hello x') =
      x == x'
    (==) (GoodBye x) (GoodBye x') =
      x == x'



















      
