import Data.List
import Data.Ord
import Data.Array

collatz::Integer->Integer
collatz 1 = 0
collatz x' | even x' = 1 +  collatz (x' `quot` 2)
           | otherwise = 1 + collatz (3*x' + 1)


--memoization is actually not all that useful
--turns out I had to switch to compiling and running instead of interpreting (derp)
--leaving it in so I can remember how to do it
memlimit::Integer
memlimit = 10000

mems :: Array Integer Integer
mems = array (1, memlimit) [(n, collatz n) | n <- [1..memlimit]]

memcollatz::Integer->Integer
memcollatz x  
    | x < memlimit  = mems ! x
    | otherwise = collatz' x
        where
            collatz' 1 = 0
            collatz' x' | even x' = 1 +  memcollatz (x' `quot` 2)
                        | otherwise = 1 + collatz' (3*x' + 1)



main::IO()
main = print $ maximumBy (comparing memcollatz) [1..100000]