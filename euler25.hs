import Data.List

fibs :: [Integer]
fibs = scanl (+) 0 (1:fibs)

main::IO()
main = print $ findIndex ((== 1000).length.show) fibs
