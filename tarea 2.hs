--tarea 2
--quicksort
quicky [] = []
quicky (x:xs) = let graterPivot = quicky [a | a <- xs, a > x]
                    smallerPivot = quicky [a | a <- xs, a <= x]
                in smallerPivot ++ [x] ++ graterPivot


--newton 
