--let fact x = if x==0 then 1 else x * fact(x-1)

fact 1 = 1
fact x = x * fact (x-1)
-- matching de patrones 
-- eso hace que funcione cuando es 1 y devuelve 1 
-- primero pones el caso base y luego el normal, el matcheo hara lo que dice el de 1 cuando sea 1, y el resto con el otro

-- encontrar el mayor de una lista
--sin usar maximum
-- con patern matching 
mayor [] = -1
mayor (x:[]) = x --falla con 1 elemento 
mayor (a:b:c) = let bigger(a,b) = if a > b 
								  then a 
								  else b 
				in
					if c==[]
					then bigger(a,b)
					else mayor([bigger(a,b)]++c)

-- con 
mayor2 [] = -1
mayor2 l = max (tail l) (head l) where max l current | (length l) == 0 = current | (head l) > current = max (tail l) (head l)  | otherwise = max (tail l) current


menor [] = -1
menor (x:[]) = x --falla con 1 elemento 
menor (a:b:c) = let minor(a,b) = if a < b 
								  then a 
								  else b 
				in
					if c==[]
					then minor(a,b)
					else menor([minor(a,b)]++c)


--funcion que recibe l y devuelve tupla que tiene el min y el max
-- tuplamela l = (maximum l, minimum l)
tuplamela [] = (-1,-1)
tuplamela (x:[]) = (x,x)
tuplamela l = (mayor l, menor l)