node(a).
node(b).
node(c).
node(d).
node(e).

arc(a,b).
arc(a,c).
arc(b,c).
arc(b,d).
arc(c,d).
arc(d,e).

doubleArc(X,Z):-arc(X,Y),arc(Y,Z).

path(X,Y):-arc(X,Y).
path(X,Y):-arc(X,Z),!,path(Z,Y).
