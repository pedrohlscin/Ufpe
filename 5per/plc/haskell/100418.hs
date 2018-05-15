-- Lazy eval
f :: Int -> Int -> Int
f a b = a + 10

--recursão
--g :: Int -> Int
--g c = c + g c

fl :: [Int] -> [Int] -> Int
fl (x:xs) (y:ys) = x + y

--Recursão de cauda
fat n = tailFat n 1

tailFat 0 x = x
tailFat n x = tailFat (n-1) (n * x)

--
data DiasSemana = Dom| Seg| Ter| Qua| Qui| Sex
 deriving (Show, Eq, Ord, Enum)

data Lista a = Vazia | Lista a (Lista a)
 deriving(Show)

type Nome = String
data Pessoa = M Nome | F Nome


instance Show Pessoa where
 show (M n) = n
 show (F n) = n

instance Eq Pessoa where
 (M n1) == (M n2) = n1 == n2
 (F n1) == (F n2) = n1 == n2
 _ == _ = False

class Visible t where
 toString :: t -> String
 size :: t -> Int 

instance Visible Char where
 toString ch = [ch]
 size ch = 1

instance Visible Bool where
 toString True = "True"
 toString False = "False"
 size _ = 1

instance Visible a => Visible [a] where
 toString = concat . (map toString)
 size = (foldr (+) 0) . (map size)