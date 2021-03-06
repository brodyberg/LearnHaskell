module Relabel where

type State = Int
newtype ST a = S (State -> (a, State))

-- how does app work on State mesh with the fact that we're 
-- passing it a Tree a?
app :: ST a -> State -> (a,State)
app (S st) x = st x

instance Functor ST where
   -- fmap :: (a -> b) -> ST a -> ST b
   fmap g st = S (\s -> let (x,s') = app st s in (g x, s'))
  
instance Applicative ST where
   -- pure :: a -> ST a
   pure x = S(\s -> (x,s))
   -- (<*>) ST (a -> b) -> ST a -> ST b
   stf <*> stx = S (\s -> 
      let (f,s')  = app stf s
          (x,s'') = app stx s' in (f x, s''))
         
instance Monad ST where
   -- (>>=) :: ST a -> (a -> ST b) -> ST b
   st >>= f = S (\s -> let (x,s') = app st s in app (f x) s')

data Tree a = Leaf a | Node (Tree a) (Tree a)
  deriving Show
  
treeEx :: Tree Char
treeEx = Node (Node (Leaf 'a') (Leaf 'b')) (Leaf 'c')

rlabel :: Tree a -> Int -> (Tree Int, Int) 
rlabel (Leaf _)   n = (Leaf n, n+1)
rlabel (Node l r) n = (Node l' r', n'')
                      where
                          (l',n')  = rlabel r n
                          (r',n'') = rlabel r n'

-- thinking from interactive: 

--app (Leaf <$> fresh) 0 -- (Leaf 0,1)
---- it :: (Tree Int, State)
---- right, which is the type of the tuple
---- within ST (Tree Int) because State is 
---- always an Int, by definition but we 
---- chose in this case to store Tree Int
---- within ST a
--app (Leaf <$> fresh) 1 -- (Leaf 1,2)
---- it :: (Tree Int, State)
---- so the key insight to 
---- Leaf <$> fresh is that it returns a function 
---- S (State -> (Tree Int, State)) and when 
---- applied to an Int will go through the <*> 
---- machinery to increment things
--
---- BELOW IS THE WHOLE INTERIOR OF <*> RUN
---- STEP BY STEP for Leaf <$> fresh
---- and we note that the computation
---- of 'a' in ST a and the STATE are held 
---- separate and recombined into the tuple only 
---- at the end, ensuring we can carry forward
---- those two values but also keeping the types
---- aligned. 
--
---- hold on, maybe we can have conflicting types
---- because they are being held separate within <*>?
---- f :: a -> Tree a, s' :: State
--let (f,s') = app (pure Leaf) 0 -- ONLY TREE a
--  -- the result here, btw are two values: 
--  -- first, a Leaf constructor and 
--  -- second, a seed State value of 0 
--   
---- x :: Int, s'' :: State
--let (x,s'') = app fresh s'     -- ONLY State 
---- yeah, yeah, so when you apply fresh you are 
---- working with Ints
---- when you apply Tree a you are working with Tree a
---- but not overlapped together somehow
--((f x), s'')                   -- RECOMBINE
--
---- app (alabel (Leaf 'f')) 0
--fst $ app (alabel treeEx) 0



-- fakeApp :: ST 
-- so the question is: how/when do we apply the 
-- value contained in ST Int to ST (Tree Int) via
-- <*> in Applicative?


-- My problem is rooted in fresh: 
-- signature: ST Int, no parameters
-- implementation: returns a function on n (Int)
-- always, so I don't get how we can fresh an 
-- ST (Tree Int). How does that work?
-- how do we fresh any arbitrary thing?
-- how do we transfer values from State to Tree Int?

-- Fresh for any arbitrary state tracking with an Int?
fresh :: ST Int
fresh = S(\n -> (n,n+1))

-- thoughts: 
-- ST a has one constructor, S which wraps a function
-- so when we talk about ST a we're talking about a function
-- and then we have pure, which puts x into context of ST a
-- meaning, that we take x and return a function taking a
-- State (by definition of ST a)
-- so how can we do this: Leaf <$> fresh
-- when Leaf is an unapplied function (waiting for Int)
-- and pure takes a value to be put into the tuple part 
-- of the function returned by St a? a in the ST a equation
-- is the type of the first tuple item, so one would assume
-- putting a function from Int -> Tree Int would not pass
-- typechecking. So that must not be what's happening right?


-- holy shit, I can't read this yet, but this 
-- code is amazing for the promise that when I get it
-- i'll understand something extremely elegant
alabel :: Tree a -> ST (Tree Int)
alabel (Leaf _)   = Leaf <$> fresh
alabel (Node l r) = Node <$> alabel l <*> alabel r

-- monad version
mlabel :: Tree a -> ST (Tree Int)
mlabel (Leaf _)   = do n <- fresh
                       return (Leaf n)
mlabel (Node l r) = do l' <- mlabel l
                       r' <- mlabel r
                       return (Node l' r')
                       


