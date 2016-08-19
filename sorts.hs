--sort 
import Data.List

insertionSort :: (Ord a) => [a] -> [a]
insertionSort = foldr insert [] 

sorteamlea (x:y:z) = if x > y 
                     then [y]++sorteamlea([x]++z)
                     else sorteamlea [x]++sorteamlea([y]++z)