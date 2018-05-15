--Lista 1

import Data.Char

orExc :: Bool -> Bool -> Bool
orExc True False = True
orExc False True = True
orExc _ _ = False

nAnd ::  Bool -> Bool -> Bool
nAnd True True = False
nAnd _ _ = True

toUpperP :: Char -> Char
toUpperP x = if (ord x >= 97)
                   then chr ((ord x) - 32) 
                   else x

toUpperCaseP :: [Char] -> [Char]
toUpperCaseP [] = []
toUpperCaseP (x:xs) = toUpperP x : toUpperCaseP xs

charToNum :: Char -> Int
charToNum x = case x of '0' -> 0
                        '1' -> 1
                        '2' -> 2
                        '3' -> 3
                        '4' -> 4
                        '5' -> 5 
                        '6' -> 6
                        '7' -> 7
                        '8' -> 8
                        '9' -> 9

--Lista 2

--dobraLista :: [t] -> [t]
dobraLista [] = []
dobraLista (x:xs) = (x * 2) : dobraLista xs

member :: [Int] -> Int -> Bool
member [] _ = False;
member (x:xs) check = check == x || member xs check

digits :: String -> String
digits [] = []
digits (x:xs) =
    if isDigit x
        then x : digits xs
        else digits xs

sumPairs [] = []
sumPairs (x:xs) = (fst(x) + snd(x)) : sumPairs xs

type Pessoa = String
type Livro = String
type BaseDados = [(Pessoa, Livro)]
baseExemplo :: BaseDados
baseExemplo = [("Joao","Software Abstractions"), ("Andre","Programming in Haskell"), ("Fernando","Introduction to Programming with Python"), ("Fernando","Programming in Haskell")]

livros :: BaseDados -> Pessoa -> [Livro]
livros [] _ = []
livros (x:xs) p =
    if fst x == p
        then snd x : livros xs p
        else livros xs p

emprestimos :: BaseDados -> Livro -> [Pessoa]
emprestimos [] _ = []
emprestimos (x:xs) livro =
    if snd x == livro
        then fst x : emprestimos xs livro
        else emprestimos xs livro 

qtdEmprestimos :: BaseDados -> Pessoa -> Int
qtdEmprestimos [] _ = 0
qtdEmprestimos (x:xs) p =
    if fst x == p
        then 1 + qtdEmprestimos xs p
        else qtdEmprestimos xs p

emprestar :: BaseDados -> Pessoa -> Livro -> BaseDados
emprestar [] p l = [(p, l)]
emprestar (x:xs) p l = x : emprestar xs p l

devolver :: BaseDados -> Pessoa -> Livro -> BaseDados
devolver [] p l = []
devolver (x:xs) p l
  | fst x == p && snd x == l = xs
  | otherwise = devolver xs p l

membroCL :: [Int] -> Int -> Bool
membroCL l m = foldr (||) False [ x == m | x <- l]

livrosCL :: BaseDados -> Pessoa -> [Livro]
livrosCL bd p = [snd saida | saida <- bd, fst saida == p]

emprestimosCL :: BaseDados -> Livro -> [Pessoa]
emprestimosCL bd l = [fst x | x <- bd , snd x == l]

emprestadoCL :: BaseDados -> Livro -> Bool
emprestadoCL bd l = foldr (||) False [snd x == l | x <- bd]

qtdEmprestimosCL :: BaseDados -> Pessoa -> Int
qtdEmprestimosCL bd p = length [x | x <- baseExemplo, fst x == p ]

devolverCL :: BaseDados -> Pessoa -> Livro -> BaseDados
devolverCL bd p l = [x | x <- bd, not (fst x == p && snd x == l)]
