:-use_module(clpfd).

valid_domain(List, Min, Max):-
  List ins Min..Max.

mosp(N, L, S, O):-

