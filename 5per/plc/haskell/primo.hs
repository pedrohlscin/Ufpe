fatores :: Int -> [Int]
fatores n = [x | x <- [1..n], n `mod` x == 0]

primo :: Int -> Bool
primo n = if (fatores n) == [1,n] then True else False