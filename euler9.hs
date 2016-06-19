main::IO()
main = print $ [(x, y, sqrt(x*x + y*y)) |
    x <- [1..999], 
    y <- [1..999],
    x + y + sqrt(x*x + y*y) == 1000 ] !! 1