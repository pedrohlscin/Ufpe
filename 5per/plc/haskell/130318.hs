--Listas

--Construçao de Listas []
--Construçao de Listas com valores [1, 2, 3]
--Elementos da lista devem ter o mesmo tipo
lista = [(1, True), (2, False)]

--Implementando passo em Listas
list_1 = [0, 1 .. 10]

somaLista :: [Int] -> Int
somaLista [] = 0
somaLista (x:y) = x + somaLista y

--Dobra  Listas
double :: [Int] -> [Int]
double [] = []
double (x:y) = 2 * x : double y

--Verifica se existe na Listas
member :: [Int] -> Int -> Bool
member [] _ = False
member (x:xs) y = x == y || member xs y

rev :: [a] -> [a]
rev [] = []
rev (x:y) = rev y ++ [x]

repeticao :: Int -> Char -> [Char]
repeticao 0 _ = []
repeticao n c = c : repeticao (n-1) c

mtake :: Int -> [a] -> [a]
mtake 0 _     = []
mtake n (x:y) = x : mtake (n-1) y
mtake x []    = []
