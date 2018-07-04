-- Tipos

exOr :: Bool -> Bool -> Bool
exOr x y = (x || y) && not (x && y)

exOrCasamPadrao :: Bool -> Bool -> Bool
exOrCasamPadrao True x = not x
exOrCasamPadrao False x = x

mAnd :: Bool -> Bool -> Bool
mAnd True True = True
mAnd True False = False
mAnd False True = False
mAnd False False = False

mAnd2 :: Bool -> Bool -> Bool
mAnd2 True True = True
mAnd2 True False  = False
mAnd2 False _ = False

mAnd3 :: Bool -> Bool -> Bool
mAnd3 True b = b
mAnd3 _ _ = False

mAnd4 :: Bool -> Bool -> Bool
mAnd4 True True = True
mAnd4 _ _ = False

-- Funcoes recursivas 

fatorial :: Int -> Int
fatorial 0 = 1 -- Caso base
fatorial n = n * fatorial (n - 1) -- Caso recursivo

vendas :: Int -> Int
vendas 0 = 3
vendas 1 = 4
vendas 2 = 20
vendas 3 = 0
vendas 4 = 9
vendas 5 = 30

totalVendas :: Int -> Int
totalVendas n
 | (n == 0) = vendas 0
 | otherwise = vendas n + totalVendas(n-1)

totalVendas2 :: Int -> Int
totalVendas2 0 = vendas 0
totalVendas2 n = vendas n + totalVendas2 (n-1) 

maxi :: Int -> Int -> Int
maxi x y = if x >= y
           then x
           else y

maiorVenda :: Int -> Int
maiorVenda n
 | (n == 0) = vendas 0
 | otherwise =  maxi (vendas n) (maiorVenda (n-1))

 {-
vendasZero :: Int -> Bool
vendasZero n = 
            if (vendas n == 0)
            then True
            else vendasZero (n-1)
-}

vendasZero2 :: Int -> Bool
vendasZero2 n
 | (vendas n == 0) = True
 | (n == 0) = False
 | otherwise = vendasZero2(n-1)
 

vendaNula :: Int -> Bool
vendaNula n 
 | (vendas n == 0) = True
 | otherwise = False

vendasZero3 :: Int -> Bool
vendasZero3 n 
  | (n == 0)  = vendaNula 0
  | otherwise  = vendaNula n || vendasZero3(n-1)

