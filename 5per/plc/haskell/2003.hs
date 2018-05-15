doubleL :: [Int] -> [Int]
doubleL [] = []
doubleL (x:xs) = 2 * x : doubleL xs

member :: [Int] -> Int -> Bool
member [] _ = False
member (x:xs) value = x == value || member xs value

digits :: String -> String
digits[] = []
digits (x:xs)
 | ehDigito x = x : digits xs
 | otherwise = digits xs

ehDigito :: Char -> Bool
ehDigito x = x >= '0' && x <= '9'

sumPairs :: [(Int,Int)]->[Int]
sumPairs [] = []
sumPairs ((x,y):xs) = (x + y) : sumPairs xs

type Pessoa = String
type Livro = String
type BancoDados = [(Pessoa, Livro)]

baseExemplo :: BancoDados
baseExemplo = [("Joao","Software Abstractions"), ("Andre","Programming in Haskell"), ("Fernando","Introduction to Programming with Python"), ("Fernando","Programming in Haskell")]

livros :: BancoDados -> Pessoa -> [Livro]
livros [] _ = []
livros (x:xs) ps
 | hit (fst x) ps = (snd x) : livros xs ps
 | otherwise = livros xs ps

hit :: String -> String -> Bool
hit x s = x == s

emprestimos :: BancoDados -> Livro -> [Pessoa]
emprestimos [] _ = []
emprestimos (x:xs) lv
 | hit (snd x) lv = (fst x) : emprestimos xs lv
 | otherwise = emprestimos xs lv

emprestado :: BancoDados -> Livro -> Bool
emprestado [] _ = False
emprestado (x:xs) lv = hit (snd x) lv || emprestado xs lv

qtdEmprestimos :: BancoDados -> Pessoa -> Int
qtdEmprestimos [] _ = 0
qtdEmprestimos (x:xs) p
 | hit (fst x) p = 1 + qtdEmprestimos xs p
 | otherwise = qtdEmprestimos xs p

emprestar :: BancoDados -> Pessoa -> Livro -> BancoDados
emprestar bd pe lv = bd ++ [(pe, lv)]

devolver :: BancoDados -> Pessoa -> Livro -> BancoDados
devolver [] _ _ = []
devolver (x:xs) p l
 | hit (fst x) p = devolver xs p l
 | otherwise = x : devolver xs p l
