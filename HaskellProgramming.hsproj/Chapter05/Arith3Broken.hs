module Chapter05.Arith3Broken where
  main :: IO ()
  main = do
    print (1 + 2)
    print 10   
--putStrLn 10
    print (negate (-1))
    print ((+) 5 blah)
      where blah = negate 1


--    print x where x = (negate -1)


--    let x = (negate -1)
--    print x
--    print x where x = (negate -1)
--    print y where 
--      blah = negate 1
--      y = ((+) 0 blah) 