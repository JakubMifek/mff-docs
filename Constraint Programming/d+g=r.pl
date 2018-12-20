:-use_module(library(clpfd)).
valid_domain(List, Min, Max):-
  List ins Min..Max.

solve(Sol):-
	Sol=[D,O,N,A,L,G,E,R,B,T],
	Carry=[P1,P2,P3,P4,P5],
	valid_domain(Sol,0,9),
	valid_domain(Carry,0,1),
	D #\= 0, G #\= 0, R #\ 0,
	D+D #= T+10*P1,
	L+R+P1 #= R+10*P2,
	A+A+P2 #= E+10*P3,
	N+R+P3 #= B+10*P4,
	O+E+P4 #= O+10*P5,
	D+G+P5 #= R,
	all_different(Sol),
	labeling([],Sol).





