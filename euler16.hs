main::IO()
main = print $ sum $ map ((\c -> read c ::Integer) . (: [])) $ show (2^1000)