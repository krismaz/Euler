powm :: Integer -> Integer -> Integer -> Integer -> Integer
powm _ 0 _ r = r
powm b e m r | e `mod` 2 == 1 = powm (b * b `mod` m) (e `div` 2) m (r * b `mod` m)
powm b e m r = powm (b * b `mod` m) (e `div` 2) m r

getDS::Integer->Integer->(Integer, Integer)
getDS d s | mod d 2 == 1 = (d , s)
          | otherwise = getDS (div d 2) (s+1)

compositeTest::Integer->Integer->Integer->Integer->Bool
compositeTest a d n s | powm a d n 1 == 1 = False
                      | any (\x -> powm a (2 ^ x * d) n 1 == n-1) [0..s-1] = False
                      | otherwise = True

millerRabin::Integer->Bool
millerRabin i | i `elem` [1, 2, 3] = True
              | otherwise = not (compositeTest 2 (fst ds) i (snd ds) ||
                                 compositeTest 3 (fst ds) i (snd ds))
                            where
                                ds = getDS (i-1) 0

main::IO()
main = print $ filter millerRabin [1..] !! 10001