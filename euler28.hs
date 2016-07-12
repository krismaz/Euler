run::Int->Int->Int->[Int]
run acc cur end
    | cur >= end = []
    | otherwise = [acc + cur, acc + 2*cur, acc + 3*cur, acc + 4*cur] ++ run (acc + 4*cur) (cur+2) end

main::IO()
main = print $ 1 + sum (run 1 2 1001)
