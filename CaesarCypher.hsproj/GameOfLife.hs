module GameOfLife where
  
cls :: IO ()
cls = putStr "\ESC[2J"

type Pos = (Int,Int)

writeat :: Pos -> String -> IO ()
writeat p xs = do goto p
                  putStr xs
                  
goto :: Pos -> IO ()
goto (x,y) = 
  putStr ("\ESC[" ++ show y ++ ";" ++ show x ++ "H")
  
width :: Int
width = 30

height :: Int
height = 30

-- really, a 'board' is a list of coordinates
-- currently 'alive'
type Board = [Pos]

glider :: Board
glider = [(4,2),(2,3),(4,3),(3,4),(4,4)]

-- given a 'board' which is a list of coordinates for
-- live cells, draw markers of '0' at each location
showcells :: Board -> IO ()
showcells b = sequence_ [writeat p "0" | p <- b]

-- is a given position contained within the 
-- current list of 'alive' positions aka the board?
isAlive :: Board -> Pos -> Bool
isAlive b p = elem p b

isEmpty :: Board -> Pos -> Bool
isEmpty b p = not (isAlive b p)

neighbs :: Pos -> [Pos]
neighbs (x,y) = map wrap [(x-1,y-1), (x,y-1),
                          (x+1,y-1), (x-1,y),
                          (x+1,y),   (x-1,y+1),
                          (x,y+1),   (x+1,y+1)]
                          
wrap :: Pos -> Pos
wrap (x,y) = (((x-1) `mod` width) + 1,
              ((y-1) `mod` height) + 1)
              
liveneighbs :: Board -> Pos -> Int
liveneighbs b = length . filter (isAlive b) . neighbs

-- Given a board, find all the live neighbors with
-- 2 or 3 neighbors
survivors :: Board -> [Pos]
survivors b = [p | p <- b, elem (liveneighbs b p) [2,3]]

births' :: Board -> [Pos]
births' b = [(x,y) | x <- [1..width],
                     y <- [1..height],
                     isEmpty b (x,y),
                     liveneighbs b (x,y) == 3]
                    
rmdups :: Eq a => [a] -> [a]
rmdups []     = []
rmdups (x:xs) = x : rmdups (filter (/= x) xs)

births :: Board -> [Pos]
births b = [p | p <- rmdups (concat (map neighbs b)),
                isEmpty b p,
                liveneighbs b p == 3]

-- as for the pure/IO split, everything from 
-- nextgen and below is all pure. 
nextgen :: Board -> Board
nextgen b = survivors b ++ births b

life :: Board -> IO ()
life b = do cls
            showcells b
            wait 500000
            life (nextgen b)
            
wait :: Int -> IO ()
wait n = sequence_ [return () | _ <- [1..n]]








