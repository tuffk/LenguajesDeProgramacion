--currying 
-- lazyness
-- funciones de orden superior 
--reciben como parametro otra funcion 	y devuelven otras funciones 

--funcion que recibe funcion y 2 listas
-- junta las listas usando las funciones que recibe
oper f [] [] = []
oper f [] _ = []
oper f _ [] = []
oper f (hx:tx)(hy:ty) = [f hx hy] ++ oper f tx ty

--f es una funcion 

--funcion y lista 
--fuincionamela f n [] = []
funcionamela f n lista = [x | x <- lista,  x `f` n]

--otro filtro
--con guards
otrof f [] = []
otrof f (h:t)
    |f h = h : otrof f t
    |otherwise = otrof f t
    --llamar con otrof (<4) [1,2,3,4]

