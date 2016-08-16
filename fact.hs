--let fact x = if x==0 then 1 else x * fact(x-1)

fact 1 = 1
fact x = x * fact (x-1)
-- matching de patrones 
-- eso hace que funcione cuando es 1 y devuelve 1 
-- primero pones el caso base y luego el normal, el matcheo hara lo que dice el de 1 cuando sea 1, y el resto con el otro