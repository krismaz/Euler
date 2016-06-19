largest :: Integer -> [Integer]
largest 1 = []
largest i = y : largest (div i y)
        where 
            y = head [x | x <- [2..i], mod i x == 0]

main::IO()
main = print $ largest 600851475143
