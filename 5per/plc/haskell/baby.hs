doubleMe :: Int -> Int
doubleMe x = x + x

doubleUs :: Int -> Int -> Int
doubleUs x y = doubleMe x + doubleMe y

doubleNumbersAboveOneHundred :: Int -> Int
doubleNumbersAboveOneHundred x = if x < 100
                                   then doubleMe x
                                   else x

onlyUpper :: [Char] -> [Char]
onlyUpper xs = [c | c <- xs, c `elem` ['A'..'Z']]

sumPairs :: (Num a) => [(a,a)] -> [a]
sumPairs list = [(x+y) | (x,y) <- list]

set = [x | x <- zip (take 10 [0,2..]) (take 10 [1,3..])]