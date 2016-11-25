:-  use_module(library(list_util)). %usamos el modulo para el split_at
:- dynamic
	lista/1,
	tree/4,
	nod/1.
	%definir que son operaciones atomicas no definidas
tree([],[],[],[]).
%lista([]).
%X represente THIS
getDad(X,R):- (tree(_,Z,_,X)),((Z == [], R = [],!) ;R is Z).
getLeft(X,R):- (tree(Z,_,_,X)),((Z == [], R = [],!); R is Z).
getRight(X,R):- (tree(_,_,Z,X)), ((Z == [], R = [],!); R is Z).
isSon(X,Y,R):- (getRight(X,Y);getLeft(X,Y)),R is Y.%X  es this, Y es le hijo que buscamos, R el resultado
getSons(X,L,R):- (tree(S,_,T,X)),L = S, R = T.
getBrother(X,R):- (tree(X,_,Z,_);tree(Z,_,X,_)), R is Z.
getHeight(Nod,Init,Res):- getLeft(Nod,L),getHeight(L,Init+1,Res);Res is Init.
getSubTree(Nod):- recorre(Nod).
%recorre(Nod):- write(Nod),nl.
recorre(Nod):- (Nod \= [],write(Nod),nl),getRight(Nod,R),getLeft(Nod,L),(recorre(L);recorre(R)). % recorrido por preorden 
%jardinero(Momok):- lista(X),last(X,Act),listear(Act,Besya),lista(X),last(X,L),listear(L,Besya),lista(X),last(X,R),listear(R,Besya),assert(tree(L,[],R,Act)),jardinero(L,R,Act).
%jardinero(L,R,Pap):-lista(X),last(X,Act1),listear(Act1,Besya),assert(tree([],Pap,[],Act1),lista(X),last(X,Act2),listear(Act2,Besya),assert(tree([],Pap,[],Act2)),examen(Act1,Act2).
%examen(PapL,PapR):-(lista(X),last(X,Act),listear(Act,Besya),lista(X),last(X,L),listear(L,Besya),lista(X),last(X,R),listear(R,Besya),assert(tree(L,[],R,Act)),(getSons(PapR,SL,SR),SL==[],)) .



%jardinero(Qadib,Lis):- getMid(Lis,M),rompela(M,Lis,L,R),getMid(L,Kuz),getMid(R,Sharmuta),nth1(Kuz,L,Zain),nth1(Sharmuta,R,Uume),nth1(M,Lis,Linga),assert(tree(Zain,Qadib,Uume,Linga)).
%jardinero(Elem, Lis):- (Lis == [], 0 == 1,!);getMid(Lis,M),rompela(M,Lis,L,R),getMid(L,Kuz),getMid(R,Sharmuta),length(L,Cubells),((Cubells \= 0, nth1(Kuz,L,Zain),!);Zain = []),length(R,Ariel),((Ariel \= 0, nth1(Sharmuta,R,Uume),!); Uume = []),nth1(M,Lis,Linga),assert(tree(Zain,Elem,Uume,Linga)),(jardinero(Linga,L);jardinero(Linga,R)).
listear(Nod):- lista(X),append(X,[Nod],Lres),retract(lista(_)),sort(Lres,Lres2),assert(lista(Lres2)).
listear(Lavire,Besya):- lista(X),delete(X,Lavire,Lres),retract(lista(_)),sort(Lres,Lres2),assert(lista(Lres2)).
plantar(Qin):- not(podar(Obo)),jardinero(Momok). %borra el arbol, para reconstruirlo balanceado
inserta(Nod):- not(nod(Nod)),assert(nod(Nod)), listear(Nod), plantar(Qin).%inserta un nodo a la base de conocimiento y reconstruye el arbol
%funcion recursiva que toma una lista saca el de enmedio y se llama a si misma dividiendo la lista en left y right
%la funcion debe pasar al padre, si no hay el nodo es root
podar(Obo):- retract(tree(_,_,_,_)),podar(Obo),!. %esta funcion siempre devuelve false. llamar con not(podar(Obo)).
%podar(Obo):- retract(nod(_)),podar(Obo),!. %for testeo
borramela(Nod):- retract(nod(Nod)),listear(Nod,Besya),plantar(Qin).%esta funcion es el delte nodo del arbol.
%referencias
% http://www.qmatica.com/DataStructures/Trees/AVL/AVLTree.html 
% https://www.cs.usfca.edu/~galles/visualization/AVLtree.html 
getMid(R):- lista(X),length(X,L),((M is mod(L,2), M == 0, R is div(L,2)),!;(R is (div(L,2)+1))).%obtiene la mitad de la lista
getMid(Lis,R):- length(Lis,L),((M is mod(L,2), M == 0, R is div(L,2)),!;(R is (div(L,2)+1))).%obtiene la mitad de la lista
rompela(N,Left,Right):- lista(X),split_at(N,X,Leftt,Right),nth1(N,X,Elem),delete(Leftt,Elem,Left).
rompela(N,Lis,Left,Right):- split_at(N,Lis,Leftt,Right),nth1(N,Lis,Elem),delete(Leftt,Elem,Left).

getTwo(Lis,L,PL):- last(Lis,L), delete(Lis,L,Lis2),last(Lis2,PL),delete(Lis2,PL,Lis3), retract(lista(_)),assert(lista(Lis3)). 
heap(Momok):- lista(X),last(X,Act),delete(X,Act,Lis2),getTwo(Lis2,L,R),assert(tree(L,[],R,Act)),examen(Act,L,R).
examen(Pap,ActL,ActR):- (lista(X),getTwo(X,L,R),assert(tree(L,Pap,R,ActL))),(lista(X2),getTwo(X2,L2,R2),assert(tree(L2,Pap,R2,ActR))),examen(ActL,L,R),examen(ActR,L2,R2).







%assert(lista([1,2,3,4,5,6,7,8])).