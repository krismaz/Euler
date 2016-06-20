main::IO()
main = print $ sum $ map ((\c -> read c ::Integer) . (: [])) $ show $ product [2..100]