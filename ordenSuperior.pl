% funciones de orden superior
%map list, recive funcion y la palica sobre lsita de vlaores
% maplist(func,list,resultado) 
%busca W es el resultado, si Z es = a X pon Y
replace(X,Y,Z,W) :- (X == Z, W is Y,!);W is Z.

%replace(X,Y,Z,W) :- (X == Z -> W is Y ; W is Z).
%repalce(X,Y,X,Y).
%replace(_,_,Z,Z).

%currying
%maplist(replace(1,6),[1,2,3,1,4,5,1,2,8],Z).
%replace tiene 2 argumentos, su 3 argumento es la lista (que es el segundo en al ufncion), el 4 es Z
%maplist compelta los parametros de replace
%maplist(plus(1),[1,2,3,1,4,5,1,2,8],Z).
%incrementa en 1 los elementos de la lista
%traduccion con map list

%metapredicados 
%generar predicados de manera dinamica
myMapList(_,[],[]).
myMapList(Func,[H|T],[R|T2]):- Func=..[Functor|Params],append(Params,[H,R],NewParams),Pred=..[Functor|NewParams],call(Pred),myMapList(Func,T,T2),!.
succ(In,Out):- Out is In +1.

