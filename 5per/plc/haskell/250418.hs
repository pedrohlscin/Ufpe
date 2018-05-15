divisorescomuns :: Int -> Int -> [Int]
divisorescomuns a b = [ x | x <- [1..a], mod a x == 0, mod b x == 0]

mdc :: Int -> Int -> Int
mdc a b | mod a b == 0 = b
        | mod b a == 0 = a
        | a > b = mdc b (mod a b)
        | a < b = mdc a (mod b a)

fatoresComuns :: Int -> [Int]
fatoresComuns n = [ x | x <- [1..n], mod n x == 0]

ehPrimo :: Int -> Bool
ehPrimo n = if head (fatoresComuns n) == 1 && last (fatoresComuns n) == n && length (fatoresComuns n) == 2
                then True
                else False
