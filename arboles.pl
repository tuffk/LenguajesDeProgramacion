% arboles
%insert(Num,empty,tree(Num,empty,empty)).
%insert(Num,tree(Element,Left,Right),tree(Element,NewLeft,Right)):- Num<Element,insert(Num,Left,NewLeft).
%insert(Num,tree(Element,Left,Right),tree(Element,Left,NewRight)):- Num>Element,insert(Num,Right,NewRight).

%funcion que recibe lsita y genera un arbol

%arboles personal
%elem es el elemento actual
%elem(num).%info de elemento
%root(Left,[],Right,Num). %nodo tipo root
%tree(Left,Dad,Right,Num). % nodo tipo cualquiera
%tree([],Dad,Right,Num). % nodo tipo cualquiera
%tree(Left,Dad,[],Num). % nodo tipo cualquiera
%tree([],Dad,[],Num). %temp de leaf
%leaf([],Dad,[],Num). % nodo tipo hoja

%posible falta un 4 elemento THIS

%getDad(X,R):- (tree(X,Z,_);tree(_,Z,X);leaf(X,Z,_);leaf(_,Z,X)),R is Z. %revisar logica; parece devovler al abuelo no al padre
%getLeft(X):- root(X,_,_).

%X represente THIS
getDad(X,R):- (tree(_,Z,_,X)), R is Z.
getLeft(X,R):- (tree(Z,_,_,X);root(Z,_,_,X)), R is Z.
getRight(X,R):- (tree(_,_,Z,X);root(_,_,Z,X)), R is Z.
isSon(X,Y,R):- (getRight(X,Y);getLeft(X,Y)),R is Y.%X  es this, Y es le hijo que buscamos, R el resultado
getSons(X,R):- (tree(S,_,T,X);root(S,_,T,X)),R = [S|T].
getBrother(X,R):- (tree(X,_,Z,_);tree(Z,_,X,_);root(Z,_,X,_);root(X,_,Z,_)), R is Z.
getHeight(Nod,Init,Res):- getLeft(Nod,L),getHeight(L,Init+1,Res);Res is Init.
%recorre(Nod):- write(Nod),nl.
recorre(Nod):- write(Nod),nl,getRight(Nod,R),getLeft(Nod,L),(recorre(L);recorre(R)). % recorrido por profundidad "top-down"

inserta(Nod):- not(nod(Nod)),assert(nod(Nod)),lista(X),append(X,[Nod],Lres),retract(lista(_)),assert(lista(Lres)).%,plantar().%inserta un nodo a la base de conocimiento y reconstruye el arbol
plantar():- not(quita()). %borra el arbol, para reconstruirlo balanceado

%funcion recursiva que toma una lista saca el de enmedio y se llama a si misma dividiendo la lista en left y right
%la funcion debe pasar al padre, si no hay el nodo es root

makelist(L).

%quita():- retract(tree(_,_,_,_)),quita(),!. %esta funcion siempre devuelve false. llamar con not(quita()).
quita():- retract(nod(_)),quita(),!. %esta funcion siempre devuelve false. llamar con not(quita()).
borramela(Nod):- retract(nod(Nod)),plantar().

%referencias
% http://www.qmatica.com/DataStructures/Trees/AVL/AVLTree.html 
% https://www.cs.usfca.edu/~galles/visualization/AVLtree.html 