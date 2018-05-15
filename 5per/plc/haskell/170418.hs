--Datas e tipos

type NomeSinon = String
f :: NomeSinon -> Char
f n = head n

data Nome = N String
g :: Nome -> Char
g (N s) = head s

data Par a = P (a,a)
data Arvore a = Folha a | No (Arvore a) a (Arvore a)

writeFoo :: String -> IO ()
writeFoo x = putStrLn(x)

getNput :: IO ()
getNput = do line <- getLine
             putStrLn line

reverse2lines :: IO ()
reverse2lines =
    do line1 <- getLine
       line2 <- getLine
       putStrLn (reverse line1)
       putStrLn (reverse line2)

main = do
          line <- getLine
          if null line
            then return () -- putstr " "
            else (do
                     putStrLn $ reverseWords line -- $ server para indicar que tudo após o $ deve ser resolvido primeiro
                     main)

reverseWords :: String -> String
reverseWords = unwords . map reverse. words

--Fim da aula

a = 5 /= 5
b = succ 9

doubleSmallNumber :: Int -> Int
doubleSmallNumber x = if (x > 100)
    then x
    else x * 2