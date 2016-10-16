module StateMonad where

-- import Prelude hiding ((+))
  
type State = Int
newtype ST a = S (State -> (a,State))

peek :: ST Char -> Char
peek (S x) = 
  answer
    where (answer,_) = x 3

--peek :: ST String -> String
--peek (S []) 

-- Given an S (...)
-- And a State (Int)
-- Return a tuple of that Int and a State
-- I think all this does is APPLY the 
-- function inside of S (aka st) to the 
-- value x
app :: ST a -> State -> (a,State)
app (S st) x = st x

instance Functor ST where
  -- g is a function
  -- a inside of ST is a function, but a typechecks
  -- because it is wrapped by ST for an ST a
  -- key: remember we're returning a full S(\ -> )
  -- BUT that app st s JUST RETURNS A TUPLE
  -- bottom line: we get the tuple, then we change the state
  -- fmap :: (a -> b) -> ST a -> ST b
                -- return a function that
                                   -- updates State first
                                               -- then updates a
  fmap g st = S(\s -> let (x,s') = app st s in (g x, s'))

instance Applicative ST where
  -- pure :: a -> ST a
  -- pure is going to make an ST a, which in our case 
  -- is a function taking a state and returning an (a,s) tuple
  pure x = S(\s -> (x,s))
  -- <*> :: ST (a -> b) -> ST a -> ST b
  -- take an stf, which is a run through pure, which 
  -- results in a function taking a state and returning
  -- an (a,s) tuple
                   -- return a function that
  stf <*> stx = S (\s -> 
                   -- updates the State using stf
          -- f is just our value (not at all clear to me 
          -- why f is not a value but is in fact a function)
          -- oh, because that's what we need to pass into pure
          -- s' is our "new" state
          -- holy shit, it isn't that we get an f out of stf
          -- because we pass a function into pure, it's that
          -- we apply stf to an s, and stf is an entire ST a
     let (f,s')  = app stf s
                   -- updates the State using stx
                   -- now we pass the "new" state into stx
                   -- getting an even newer state but keeping
                   -- the x we had coming in
                                 -- then, we run f on our x value               
         (x,s'') = app stx s' in (f x, s''))
         
instance Monad ST where
  -- (>>=) :: ST a -> (a -> ST b) -> ST b
  st >>= f = S (\s -> let (x,s') = app st s in app (f x) s')
  
















