mdrop :: Int -> [a] -> [a]
mdrop 0 l = l
mdrop n [] = []
mdrop n (x:xs) = [] ++ mdrop (n-1) xs


--Ordenação por ordenação
iSort :: [Int] -> [Int]
iSort [] = []
iSort (x:xs) = inserir x (iSort xs)

inserir :: Int -> [Int] -> [Int]
inserir n [] = [n]
inserir n (x:xs)
  | n <= x = n:(x:xs)
  | otherwise = x: inserir n xs

membroLista :: Int -> [Int] -> Bool
membroLista _ [] = False
membroLista n (x:xs) =  n == x || membroLista n xs


digitosLista :: [Char] -> [Char]
digitosLista [] = []
digitosLista (x:xs)
  | x >= '0' && x <= '9' = x : (digitosLista xs)
  | otherwise = digitosLista xs

somarParesLista :: [(Int,Int)] -> [Int]
somarParesLista [] = []
somarParesLista ((x,y):xs) = (x+y) : somarParesLista xs

ehPar :: Int -> Bool
ehPar x = x `mod` 2 == 0

--List Comprehension

dobrarListaC :: [Int] -> [Int]
dobrarListaC [] = []
dobrarListaC l = [ (*) 2 x | x <- l ]

dobrarValoresPares :: [Int] -> [Int]
dobrarValoresPares lista = [ 2 * x | x <- lista, ehPar x ]
