:- use_module(library(clpfd)).
:- use_module(library(lists)).

furniture(Furniture):-
	Furniture=[P,Ch,B,T],
	domain(Furniture, 0, 60),
	P + 30 #= EP, EP #<= 60,
	Ch+10 #= ECh, ECh #<= 60,
	B+15 #= EB, EB #<= 60,
	T+15 #= ET, ET #<= 60,
	cumulative(
	   [task(P,30,EP,3,1),
		task(Ch,10,ECh,1,2),
		task(B,15,EB,3,3),
		task(T,15,ET,2,1)]),
	labeling([], Furniture).
	
get_table(P, W, E):-
	table([[P,W,E]],[[1,1,7],[1,2,1],[1,3,3],[2,1,8],[2,2,2],[2,3,5]]).
	
get_table2(P,W,E):-
	AX #= P - 1,
	BX #= AX * 3,
	X #= BX + W,
	element(X, [7,1,3,8,2,5], E).
	
get_table3(W, E):-
	W = [W1, W2, W3, W4],
	E = [E1, E2, E3, E4],
	element(W1, [7, 1, 3, 4], E1),
	element(W2, [8, 2, 5, 1], E2),
	element(W3, [4, 3, 7, 2], E3),
	element(W4, [3, 1, 6, 3], E4).
	
workers(Workers):-
	E = [E1, E2, E3, E4],
	get_table3(Workers, E),
	all_different(Workers),
	ES #= E1 + E2 + E3 + E4,
	ES #>= 19,
	maximize(labeling([ff], Workers), ES).
	
workers2(Workers):-
	E = [E1, E2, E3, E4],
	get_table3(Workers, E),
	all_different(Workers),
	ES #= E1 + E2 + E3 + E4,
	ES #>= 19,
	labeling([ff, maximize(ES)], Workers).
