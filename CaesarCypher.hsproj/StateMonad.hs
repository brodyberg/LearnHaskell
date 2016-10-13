module StateMonad where
  
type State = Int
newtype ST a = S (State -> (a,State))

app :: ST a -> State -> (a,State)
app (S st) x = st x

instance Functor ST where
  -- fmap :: (a -> b) -> ST a -> ST b
  fmap g st = S(\s -> let (x,s') = app st s in (g x, s'))
  
peek :: ST a -> a
peek (S st) = -- might not have enough at this point




