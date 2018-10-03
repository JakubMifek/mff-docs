man(jacob).
man(jerry).
man(michael).
man(arnold).
man(thomas).

woman(ivet).
woman(victoria).
woman(jane).
woman(denise).
woman(katherine).

parent(jacob, jerry).
parent(jacob, jane).
parent(victoria, jerry).
parent(victoria, jane).

parent(jerry, denise).
parent(ivet, denise).
parent(jerry, michael).
parent(ivet, michael).

parent(thomas, arnold).
parent(jane, arnold).
parent(thomas, catherine).
parent(jane, catherine).

father(X,Y):-man(X),parent(X,Y).
mother(X,Y):-woman(X),parent(X,Y).

son(X,Y):-man(X),parent(Y,X).
daughter(X,Y):-woman(X),parent(Y,X).

grandparent(X,Y):-parent(X,Z),parent(Z,Y).

siblings(X,Y):-parent(Z,X),parent(Z,Y),X\=Y.

uncle(X,Y):-man(X),siblings(X,Z),parent(Z,Y).
aunt(X,Y):-woman(X),parent(Z,Y),siblings(X,Z).

descendant(X,Y):-parent(Y,X).
descendant(X,Y):-parent(Y,Z),descendant(X,Z).
