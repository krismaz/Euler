powm :: Integer -> Integer -> Integer -> Integer -> Integer -- Where did I get this function??
powm _ 0 _ r = r
powm b e m r | e `mod` 2 == 1 = powm (b * b `mod` m) (e `div` 2) m (r * b `mod` m)
powm b e m r = powm (b * b `mod` m) (e `div` 2) m r

main::IO()
main = print $ (28433 * powm 2 7830457 10000000000 1 + 1) `rem` 10000000000