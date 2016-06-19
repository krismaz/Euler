choose:: Integer -> Integer -> Integer
choose _ 0 = 1
choose 0 _ = 0
choose n k = choose (n-1) (k-1) * n `div` k 

main::IO()
main = print $ choose 40 20

--1 1 1  1  1
--1 2 3  4  5
--1 3 6  10 15
--1 4 10 20 35
--1 5 15 35 70