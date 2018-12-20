:-use_module(library(clpfd)).
valid_domain(List, Min, Max):-
  List ins Min..Max.

solve(Sol):-
	Sol=[S,E,N,D,M,O,R,Y],
	Carry=[P1,P2,P3],
	valid_domain(Sol,0,9),
	valid_domain(Carry,0,1),
	S #\= 0, M #\= 0,
	D+E #= Y+10*P1,
	N+R+P1 #= E+10*P2,
	E+O+P2 #= N+10*P3,
	S+M+P3 #= O+10*M,
	all_different(Sol),
	labeling([],Sol).





