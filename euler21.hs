import Data.Tuple
import Data.List

divisors::Integer->[Integer]
divisors n = [x| x <- [1..n-1], n `rem` x == 0] 

d::Integer->Integer
d = sum.divisors

main::IO()
main = print $ sum $ map fst $ filter (uncurry (/=)) $ intersect l1 l2
    where
        l1 = [(x, d x) | x <- [1..10000]]
        l2 = map swap l1