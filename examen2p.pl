% examen
%fibonacci
fib(0,0).
fib(1,1).
%fib(N,F) :- N>1, N1 is N-1, N2 is N-2, fib(N1,F1), fib(N2,F2), F is F1+F2.
fib(N,F) :- N>1, N1 is N-1, N2 is N-2, fib(N1,F1), fib(N2,F2), F is F1+F2,parea(F,S).
iseven(N,X) :- X is N mod 2.
parea(F,S):- iseven(F,N), N ==0, [N|S].
%hanoi 
hanoi(N) :- muevemela(N,izquierda,centro,derecha).
 
muevemela(0,_,_,_) :- !.
muevemela(N,A,B,C) :- M is N-1, muevemela(M,A,C,B), inform(A,B,N), muevemela(M,C,B,A).
 
inform(X,Y,N) :- write([movi,el,disco,N,de,X,a,Y]), nl.

%traductor
ingles(this,este).
ingles(is,es).
ingles(an,un).
ingles(example,ejemplo).
ingles(my,mi).
ingles(program,programa).
espa(de,of).
espa(como,how).
espa(funciona,works).

traducemela([],E,I).
%traducemela([H|T],E,I) :- (ingles(H,X);espa(H,Y)),traducemela(T,[Y],[X]),imprimela(E,I).
traducemela([H|T],E,I) :- (ingles(H,X),traducemela(T,E,[X|I]),!;espa(H,Y),traducemela(T,[Y|E],I),!),imprimela(E,I).
%traducemela([H|T],E,I) :- (ingles(H,X);espa(H,Y)),(append(Y,E,E2);append(X,I,I2)),traducemela(T,E2,I2),imprimela(E,I).
imprimela(E,I):- write([traduccion,ingles,I]),nl,write([traduccion,espa,E]),nl.