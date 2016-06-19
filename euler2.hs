fibs :: [Integer]
fibs = scanl (+) 1 (1:fibs)

main::IO()
main = print $ sum $ filter even $ takeWhile (<4000000) fibs
