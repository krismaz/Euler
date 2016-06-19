import Data.List

count :: Int -> [Int]
count 1 = []
count i = y: count (div i y)
        where 
            y = head [x | x <- [2..i], mod i x == 0]

divisors :: Int -> Int
divisors n = product $ map ((+1).length) $ group $ count n

triangle:: Int -> Int
triangle n = sum [1..n]

main::IO()
main = print $ find ((>500).divisors) $ map triangle [2..]