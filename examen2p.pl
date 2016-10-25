% examen
%fibonacci con suma mamadora
concatenar([],L,L).
concatenar([A|Ca],L2,[A|Cc]):- concatenar(Ca,L2,Cc).
fib(0,0).
fib(1,1).
fib(N,Y):-N>1,N1 is N-1,fib(N1,Y1),N2 is N-2,fib(N2,Y2),Y is Y1+Y2.
serie(0,[0]).
serie(1,[1]).
serie(Nt,L):- Nt>1,fib(Nt,P),N1 is Nt-1,serie(N1,Ls),concatenar(Ls,[P],L).

%sum(N,L,R):- L2 is   .
sum([], 0).

sum([X|Xs], S):-
          sum(Xs, S2),R1 is S2 mod 2, R2 is X mod 2, (R1 == 0 -> (R2 == 0 -> S is S2 + X; S is S2)).

serieFib(N,L,R):- serie(N,L), sum(L, R).

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
% trducemela con mil y un !
traducemela([],E,I).
%traducemela([H|T],E,I) :- (ingles(H,X);espa(H,Y)),traducemela(T,[Y],[X]),imprimela(E,I).
traducemela([H|T],E,I) :- (ingles(H,X),traducemela(T,E,[X|I]),!;espa(H,Y),traducemela(T,[Y|E],I),!),imprimela(E,I).
%traducemela([H|T],E,I) :- (ingles(H,X);espa(H,Y)),(append(Y,E,E2);append(X,I,I2)),traducemela(T,E2,I2),imprimela(E,I).
imprimela(E,I):- write([traduccion,ingles,I]),nl,write([traduccion,espa,E]),nl.