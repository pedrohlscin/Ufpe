data Expr = Lit Int
  | Add Expr Expr
  | Sub Expr Expr
  deriving (Show)

exp1 = Lit 2
exp2 = Add (Lit 1) (Lit 2)
exp3 = Add (Lit 2) (Sub (Lit 7) (Lit 4))

mshow :: Expr -> String
mshow (Lit n) = show n
mshow (Add e1 e2) = "( " ++ (mshow e1) ++ " + " ++ "(mshow e2)" ++ " )"
mshow (Sub e1 e2) = "( " ++ (mshow e1) ++ " - " ++ "(mshow e2)" ++ " )"

data TreeInt = NilT
  | No TreeInt Int TreeInt

arv1 = NilT
arv2 = No (NilT) 4 (NilT)
arv3 = No (No (NilT) 5 (NilT)) 7 (No (NilT) 9 (NilT))

somaArv :: TreeInt -> Int
somaArv (NilT) = 0
somaArv (No arvEsq n arvDir) =
 somaArv arvEsq + n + somaArv arvDir

profundidade :: TreeInt -> Int
profundidade (NilT) = 0
profundidade (No arvEsq n arvDir) =
  1 + max (profundidade (arvEsq)) (profundidade (arvDir))

data Lista t = Nil | Cons t (Lista t)

l1 = Nil
l2 = Cons 4 (Nil)
l3 = Cons 5 (Cons 7 (Cons 9 Nil))
