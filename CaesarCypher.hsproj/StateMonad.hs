module StateMonad where

-- import Prelude hiding ((+))
  
type State = Int
newtype ST a = S (State -> (a,State))

peek :: ST Char -> Char
peek (S x) = 
  answer
    where (answer,_) = x 3

--app :: ST a -> State -> (a,State)
--app (S st) x = st x
--
----exa :: Char -> Int -> Int
----exa c i = i
--
--example :: Char -> State -> (Int, State)
--example c s = (4, s)
--
----example :: Char -> State -> ST Int
----example c (S x) = (\s -> (9,x))
--
--instance Functor ST where
--  -- fmap :: (a -> b) -> ST a -> ST b
--  fmap g st = S(\s -> let (x,s') = app st s in (g x, s'))
--
--instance Applicative ST where
--  -- pure :: a -> ST a
--  pure x = S(\s -> (x,s))
--  -- <*> :: ST (a -> b) -> ST a -> ST b
--  stf <*> stx = S (\s -> 
--     let (f,s')  = app stf s
--         (x,s'') = app stx s' in (f x, s''))
--         
--instance Monad ST where
--  -- (>>=) :: ST a -> (a -> ST b) -> ST b
--  st >>= f = S (\s -> let (x,s') = app st s in app (f x) s')