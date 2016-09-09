--examen 1p
--jaime margolin
--ej1 numeros palindromos
-- [999,998..100]
palindromo l = let kuz [] = True
                   kuz (x:[]) = True
                   kuz (h:t) = if h == (last t)
                               then kuz (init t)
                               else False 
                   mult (a:b:c) = a * b
               in
                 if kuz (show(mult l))
                    then mult l
                    else palindromo (tail l)
--me rindo 

-- ej 2
-- fibonacci 
fibonacci 0 = 1
fibonacci 1 = 1
fibonacci n = (fibonacci (n-1)) + (fibonacci (n-2))

fibcola n res prev
        | n == 0 = res
        | otherwise = fibcola (n -1) (res + prev) res

fibbase n 
         | n == 0 = 0
         | otherwise = fibcola n 1 0

      