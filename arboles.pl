% arboles
%insert(Num,empty,tree(Num,empty,empty)).
%insert(Num,tree(Element,Left,Right),tree(Element,NewLeft,Right)):- Num<Element,insert(Num,Left,NewLeft).
%insert(Num,tree(Element,Left,Right),tree(Element,Left,NewRight)):- Num>Element,insert(Num,Right,NewRight).

%funcion que recibe lsita y genera un arbol

%arboles personal
%elem es el elemento actual
elem(num).%info de elemento
root(left,[],right,elem). %nodo tipo root
tree(left,dad,right,elem). % nodo tipo cualquiera
tree([],dad,right,elem). % nodo tipo cualquiera
tree(left,dad,[],elem). % nodo tipo cualquiera
tree([],dad,[],elem). %temp de leaf
leaf([],dad,[],elem). % nodo tipo hoja

%posible falta un 4 elemento THIS

%getDad(X,R):- (tree(X,Z,_);tree(_,Z,X);leaf(X,Z,_);leaf(_,Z,X)),R is Z. %revisar logica; parece devovler al abuelo no al padre
%getLeft(X):- root(X,_,_).

%X represente THIS
getDad(X,R):- (tree(_,Z,_,X);leaf(_,Z,_,X)), R is Z.
getLeft(X,R):- (tree(Z,_,_,X);root(Z,_,_,X)), R is Z.
getRight(X,R):- (tree(_,_,Z,X);root(_,_,Z,X)), R is Z.
isSon(X,Y,R):- (getRight(X,Y);getLeft(X,Y)),R is Y.%X  es this, Y es le hijo que buscamos, R el resultado
getSons(X,R):- (tree(S,_,T,X);root(S,_,T,X)),R = [S|T].