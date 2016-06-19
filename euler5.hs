main::IO()
main = print $ head [x | 
    x <- [9699690, 9699690*2..], --Product of primes less than 20
    all (\y -> mod x y== 0) [1..20] ]
