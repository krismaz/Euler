divisors::Integer->[Integer]
divisors n = [x| x <- [1..n-1], n `rem` x == 0] 

d::Integer->Integer
d = sum.divisors

abundant::Integer->Bool
abundant n =seq n $ n < d n

cannotSum::[Integer] -> Integer -> Bool
cannotSum abundants n 
    | odd n = null [True | x <- takeWhile (< n) (filter odd abundants), y <- takeWhile (< n) (filter even abundants), x+y==n] --Seems to give a pretty impressive speedup
    | otherwise = null [True | x <- takeWhile (< n) abundants, y <- takeWhile (< n) abundants, x+y==n]

main::IO()
main = print $ sum $ filter (cannotSum abundants) [1..28123] 
    where abundants = filter abundant [1..28123]

--In hindsight why did I go the filtering route? Just compute the all in a 'double loop'