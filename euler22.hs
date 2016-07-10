import Data.List
import Data.Maybe

process::String -> String -> [String] -> [String]
process "" sacc racc = sacc:racc
process (s:ss) sacc racc = 
    case s of
        ',' -> process ss "" (sacc:racc)
        '\"' -> process ss sacc racc
        _ -> process ss (sacc ++ [s]) racc 


alphabet :: String
alphabet = '0' : ['A'..'Z']

value :: String -> Int
value = sum . map (fromJust.(`elemIndex` alphabet))

main :: IO()
main = do
    s <- readFile "p022_names.txt"
    print $ sum $ zipWith (*) [1..] $ map value $ sort $ process s "" []
