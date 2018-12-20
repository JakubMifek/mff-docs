:-use_module(library(clpfd)).
valid_domain(List, Min, Max):-
  List ins Min..Max.

solve(Sol):-
	Sol=[W,P,C],
	valid_domain(Sol,0,9),
	9#>=4*W+3*P+2*C,
	15*W+10*P+7*C #= Cost,
	labeling([max(Cost)],Sol).

knapsack(Size,ListOfSizes,ListOfCosts,Goods,Cost):-
	valid_domain(Goods, 0, Size),
	scalar_product(ListOfSizes,Goods,#=,SP),
	Size #>= SP,
	scalar_product(ListOfCosts,Goods,#=,Cost),
	labeling([max(Cost)],Goods).
