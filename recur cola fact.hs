fact 0 sol = sol
fact 1 sol = sol
fact x sol = fact(x-1) (x*sol)

fact2 x = fact (x-1) x
     where    fact x res
          | x==1 = res
          | x==0 = res