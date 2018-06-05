doubleMe :: Int -> Int
doubleMe x = x + x

doubleUs :: Int -> Int -> Int
doubleUs x y = doubleMe x + doubleMe y

doubleNumbersAboveOneHundred :: Int -> Int
doubleNumbersAboveOneHundred x = if x < 100
                                   then doubleMe x
                                   else x