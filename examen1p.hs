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
