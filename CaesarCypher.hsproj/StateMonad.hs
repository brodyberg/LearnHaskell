module StateMonad where

-- import Prelude hiding ((+))
  
type State = Int
-- the definition below is just identity
-- type ST = State -> State
-- this is identity + a little something
--type ST a = State -> (a,State)


--foo :: ST
--foo s = s

--foo :: ST Int
--foo s = (1,2)

newtype ST a = S (State -> (a,State))

foo'''' :: ST Char -> Char
foo'''' (S x) = 
  answer
    where (answer,_) = x 3
--  let (answer,_) = x 3
--    answer
--foo'''' (S x) = let (answer,_) = x 3
--foo'''' (S x) = let (answer,_) = x 3 

----newtype Bar = Foo ()
--newtype Bar a = Foo a
--
--foo :: Bar Int -> Bar Int
--foo b = b
--
--foo'' :: Bar Int -> Int
--foo'' (Foo x) = x
--
newtype Loo a = F (Int -> a)

foo''' :: Loo Char -> Char
-- foo''' (F x) = (\3 -> x)
foo''' (F x) = x 3

--newtype Fab a = Fib (a)
--
--foo' :: Fab Int -> Int
--foo' (Fib x) = x



--foo :: ST Int
-- foo :: ST a
--foo :: ST Int
---- foo s = (3,2)
---- foo (S st) = (3,2)
--foo (S st) = (\st -> (3,2))

--
--foo :: ST
--foo s = 

--
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