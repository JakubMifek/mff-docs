:-use_module(library(clpfd)).

valid_domain(List, Min, Max):-
  List ins Min..Max.
  
weights(S):-
	S = [A, B, C],
	valid_domain(S, -5, 5),
	abs(A - B) #>= 2,
	abs(B - C) #>= 2,
	abs(C - A) #>= 2,
	A #\= 0, B #\= 0, C #\= 0,
	A * 36 + B * 32 + C * 16 #= 0,
	labeling([], S).