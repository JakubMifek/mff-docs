enum([]).
enum([H|T]):-indomain(H),enum(T).

step_labeling([]).
% var kontroluje, zda je H uz assignuty.
step_labeling([H|T]):-
	fd_min(H,V),
	assign(H,V),
	(var(H)->
	    step_labeling([H|T]);
	    step_labeling(T)).

% spravne jsou obe s # - podminky
assign(H,V):-H=V.
assign(H,V):-H\=V.




