import Data.List
import Data.Maybe
            
divisionCycle::Int->Int->[Int]->Int
divisionCycle 0 _ _ = -1
divisionCycle x y lookBack = fromMaybe (divisionCycle (10* rem x y) y (x:lookBack)) (elemIndex x lookBack)


main::IO()
main = print $ snd $ maximum [(divisionCycle 1 x [], x) | x <- [1..1000]]

--In hindsight: This works well, and is sub-1-sec on my machine, but could probably be prettier using the knowloedge of 'Full Reptend Primes'