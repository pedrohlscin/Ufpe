--Lista monitoria

{-- 
1- Dado uma lista de inteiros, implementem uma função "menor" que encontra o menor inteiro dessa lista.
2 - Implementem uma função myMap que recebe uma função (a->b->b) e uma lista de a e uma lista de b e retorna uma lista de b. (PS: o elemento i da lista resultante é a função aplicada ao elemento i da primeira e segunda lista).
3 - Admitindo que vocês já conhecem a sequência de fibonacci implementem uma função que descobre qual é o elemento i dessa sequência. (PS: façam da forma recursiva, porém tentem fazer da forma que é "iterativa" pois ela é bem mais rápida) (PS2: se acharam a explicação aqui não muito intuitiva me falem)
4 - Implemente uma função subsequencias que dado uma lista retorna todas as suas subsequências. Ex: subsequencias [1,2,3,4] =  [[1,2,3,4],[1,2,3],[1,2],[1],[2,3,4],[2,3],[2],[3,4],[3],[4],[]]
5 - Faça uma função quicksort que ordena os números usando o algoritmo de quicksort.
--}
menor :: [Int] -> Int
menor[x] = x 
menor (x:xs)
 | x < menor xs = x 
 | otherwise = menor xs

myMap :: (a -> b -> b) -> [a] -> [b] -> [b]
myMap f [] _ = []
myMap f _ [] = []
myMap f (x:xs) (y:ys) = (f x y) : myMap f xs ys

fibo :: Int -> Int
fibo 0 = 1
fibo 1 = 1
fibo n = fibo (n-1) + fibo (n-2)

qsort :: [Int] -> [Int]
qsort [] = []
qsort (x:xs) = qsort left ++ mid ++ qsort right
  where
    left = [y | y <- xs, y < x]
    mid = [ y | y <- xs, y==x] ++ [x]
    right = [y | y <- xs, y > x]
