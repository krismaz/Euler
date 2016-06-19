bases::[Int]
bases = map length ["zero","one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]

tens::[Int]
tens = map length ["zero", "ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]

wordlength::Int -> Int
wordlength 0 = 0
wordlength 1000 = length "onethousand"
wordlength n
    | n < 20 = bases !! n
    | n < 100 = (tens !! (n `div` 10)) + wordlength (n `mod` 10) 
    | n `mod` 100 == 0 = wordlength (n `div` 100) + length "hundred"
    | otherwise = wordlength (n `div` 100) + length "hundredand" + wordlength (n `mod` 100)


main::IO()
main = print $ sum $ map wordlength [1..1000]