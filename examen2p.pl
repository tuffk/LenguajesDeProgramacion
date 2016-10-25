% examen
%fibonacci
fib(0,0).
fib(1,1).
fib(N,F) :- N>1, N1 is N-1, N2 is N-2, fib(N1,F1), fib(N2,F2), F is F1+F2.

%hanoi 
hanoi(N) :- muevemela(N,izquierda,centro,derecha).
 
muevemela(0,_,_,_) :- !.
muevemela(N,A,B,C) :- M is N-1, muevemela(M,A,C,B), inform(A,B,N), muevemela(M,C,B,A).
 
inform(X,Y,N) :- write([movi,el,disco,N,de,X,a,Y]), nl.