module AbstractMachine where
  
data Expr = Val Int | Add Expr Expr
  deriving Show

--value :: Expr -> Int
--value (Val x) = x
--value (Add x y) = value x + value y

--

type Cont = [Op]
data Op = EVAL Expr | ADD Int

-- if the expression is an integer we begin executing
-- but if the expression is an add, we save the second
-- argument (y) indicating that it must still be 
-- evaluated and recursively call eval with the first
-- argument (x)
eval :: Expr -> Cont -> Int
eval (Val n)   c = exec c n 
eval (Add x y) c = eval x (EVAL y : c)

-- Takes a control stack and an int
-- If there's no control stack, just return the int
-- If we need to run an eval operation pass that
-- back to eval and indicate we want to run an ADD
-- operation with the raw int the function was given. 
-- If we need to run an add we mechanically add
-- n which we pulled from the control operator 
-- and the m we got from the function int parameter
-- and then pass that all into exec as an int, which
-- will of course, simply return the int
exec :: Cont -> Int -> Int
exec [] n = n
exec (EVAL y : c) n = eval y (ADD n : c)
exec (ADD n : c) m = exec c (n + m)

value :: Expr -> Int
value e = eval e []