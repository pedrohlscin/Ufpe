--lista monitoria
mymin :: (Ord a) => [a] -> a 
mymin [] = error "empty list"
mymin [x] = x  
mymin (x:y:xs) = if x < y then mymin(x:xs) else mymin(y:xs)

myMap :: (a -> b -> b) -> [a] -> [b] -> [b]
myMap f (x:xs) (y:ys) = f x y : myMap f xs ys
myMap f [] [] = []
myMap f [] _ = []
myMap f _ [] = []

fibo :: Int -> Int
fibo 0 = 1
fibo 1 = 1
fibo x = fibo (x-2) + fibo (x - 3)

--subconjuntos

--subConjuntos :: [a] -> [[a]]
--subConjuntos [] = []
--subConjuntos (x:xs) = [ (x:y) | let y = subConjuntos xs] ++ subConjuntos xs

--Q1
--funcq1 :: [Int] -> [Int]
--funcq1 [] = []
--funcq1 [x] = x
--funcq1 (x:y:ys)
-- | x == y = [x] ++ funcq1 (y:ys)
-- | otherwise funcq1 (y:ys)


--f l = [ l!!x | x <- [1..((length l)-1)], l!!x == l!!(x-1)]

helper :: Int -> Bool
helper n = n >= 10 && n <= 100

--g :: [Int] -> Bool
--g l = foldr (&&) True (map (\x -> `mod` 2 == 0) (filter helper l))

subsequences :: [Int] -> [[Int]]
subsequences [] = []
subsequences l@(x:xs) = (subsequence ((length(l))) l) ++ (subsequences xs)

subsequence :: Int -> [Int] -> [[Int]]
subsequence 1 l = [[head l]]
subsequence n l = ([(take n l)] ++ subsequence(n-1) l)

type Nome = String
data Tree a = Null | Node a (Tree a) (Tree a) deriving (Show)

--instance Eq Tree
