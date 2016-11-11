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