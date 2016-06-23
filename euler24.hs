import Data.List


main::IO()
main = print $ concatMap show (sort (permutations [0..9])!!999999) --dirty dirt solution, but ~10 sec