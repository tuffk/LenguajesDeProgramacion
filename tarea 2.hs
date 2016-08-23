--tarea 2
--quicksort
quicky [] = []
quicky (x:xs) = let graterPivot = quicky [a | a <- xs, a > x]
                    smallerPivot = quicky [a | a <- xs, a <= x]
                in smallerPivot ++ [x] ++ graterPivot


--newton 
raiz x guess 0 = guess
raiz x guess n = (if n <= 1 then newguess else raiz x newguess (n-1)) where newguess = guess - ((guess*guess - x)/(2*guess))

--cola
raiza x = (1,(1+x)/2,x)
raizai (x,i,n) = if x == i then x else raizai ((x+n/x)/2,(i+n/i)/2,n)


--insert
insertate [] = []
insertate (h:[]) =[h]
insertate (h:t) = let insertando num [] =[num]
                      insertando num (h:t) = if num > h
                                             then [h] ++ (insertando num t)
                                             else [num] ++ [h] ++ t
                   in 
                      insertando h (insertate t)


--con listas
insetamela [] = []
insetamela (h:[]) = [h]
insetamela (h:t) = let lc x  lista = [y | y <- lista , x>=y] ++ [x] ++ [y | y <- lista, x<y]
                   in
                      lc h (insetamela t)