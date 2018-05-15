import Data.Char

primeiro :: (Int, Int) -> Int
primeiro (x,y) = x

segundo :: (Int, Int) -> Int
segundo (x,y) = y

primeiraDupla :: (Int, Int, Int) -> (Int, Int)
primeiraDupla (x,y,_) =  (x,y)

-- Sinonimos

type Nome = String
type Idade = Int
type Telefone = Int
type Pessoa = (Nome, Idade, Telefone)

retornaNome :: Pessoa -> Nome
retornaNome (n, i, t) = n

--Mais Expressões

umaRaiz :: Float -> Float -> Float -> Float
umaRaiz a b c = -b / (2 * a)

duasRaizes :: Float -> Float -> Float -> (Float, Float)
duasRaizes a b c = (d - e, d + 3)
  where
    d = -b / (2 * a)
    e = sqrt ( b^2 - 4.0 * a * c) / (2.0 * a)

raizes :: Float -> Float -> Float -> String
raizes a b c
  | b ^ 2 == 4.0 * a * c = show (umaRaiz a b c)
  | b ^ 2 > 4.0 * a * c = show f ++ " " ++ show s
  | otherwise = "nao ha raizes"
  where
    --A primeira e a segunda definição são válidas, deixe apenas uma descomentada

    --Primeira Definicao
    (f,s) = (duasRaizes a b c)
    --Segunda Definicao
    --f = fst (duasRaizes a b c)
    --s = snd (duasRaizes a b c)

--Questões Piazza

xor :: Bool -> Bool -> Bool
xor True False = True
xor False True = True
xor _ _ = False

nAnd1 :: Bool -> Bool -> Bool
nAnd1 True True = False
nAnd1 _ _ = False

nAnd2 :: Bool -> Bool -> Bool
nAnd2 False _ = True
nAnd2 _ False = True
nAnd2 x y = (x && y)

maiuscula :: Char -> Char
maiuscula x = toUpper(x)

charToNum :: Char -> Int
charToNum a = (fromEnum a - fromEnum '0')
