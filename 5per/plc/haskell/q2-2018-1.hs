import Data.List

data CInt = Conjunto [Int] deriving (Show)

--Conjunto = [1,1,2,3,3,4,5,6,7,7]

conjunto = Conjunto [1,1,2,3,3,4,5,6,7,7]

clrDuplicates :: [Int] -> [Int]
clrDuplicates [] = []
clrDuplicates (p:ps) = p : clrDuplicates(filter (\y -> y /= p) ps)

makeSet :: [Int] -> CInt
makeSet [] = Conjunto []
makeSet (x:xs) = Conjunto (clrDuplicates(x:xs))

union_c (Conjunto l1) (Conjunto l2) = makeSet(l1 ++ l2)