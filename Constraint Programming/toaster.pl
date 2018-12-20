:-use_module(library(clpfd)).

valid_domain(List, Min, Max):-
  List ins Min..Max.

different([], []):- true.
different([A|X1], [B|X2]):- A#\=B, different(X1, X2).

m_list([], 0).
m_list([H|T], L):-
	m_list(T,M),
	L is max(H, M).

toaster(T, L, S):-
	T1 #= T + 1,
	length(X, T),
	length(Y, T),
	append(X, Y, S),

	valid_domain([L], 1, T1),
        valid_domain(S, 1, L),
	all_different(X),
	all_different(Y),
	different(X, Y),

%	m_list(S, L),

	labeling([min(L)], S).






