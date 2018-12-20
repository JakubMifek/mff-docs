:-use_module(library(clpfd)).
valid_domain(List, Min, Max):-
  List ins Min..Max.

constraint(_,[],_):-!.
constraint(X,[H|Qs],N):-
	abs(X - H) #\= N,
	N1 #= N + 1,
	constraint(X,Qs,N1),!,
	constraint(H,Qs,1).

solve(Sol):-
	length(Sol,N),
	valid_domain(Sol,1,N),
	all_different(Sol),
	Sol=[H|Qs],
	constraint(H,Qs,1),
	labeling([],Sol).
