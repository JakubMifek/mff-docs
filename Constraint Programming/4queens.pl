:-use_module(library(clpfd)).
valid_domain(List, Min, Max):-
  List ins Min..Max.

solve(Sol):-
	Sol=[R1,R2,R3,R4],
	valid_domain(Sol,1,4),
	R4 #\= R3+1,
	R4 #\= R3-1,
	R4 #\= R2+2,
	R4 #\= R2-2,
	R4 #\= R1+3,
	R4 #\= R1-3,
	R3 #\= R2+1,
	R3 #\= R2-1,
	R3 #\= R1+2,
	R3 #\= R1-2,
	R2 #\= R1+1,
	R2 #\= R1-1,
	all_different(Sol),
	labeling([],Sol).

