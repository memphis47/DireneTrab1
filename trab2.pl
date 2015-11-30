%DPLL sat
:- dynamic elemento/1, ver/1, fal/1, clausula_tem_variavel/0.

assert_bt(X) :- assert(X).
assert_bt(X) :- retract(X), fail.

sat(ENTRADA) :-
	split_string(ENTRADA,'&'," ",L1),
	resolve_bloco(L1).

resolve_bloco([]).

resolve_bloco([H|T]):-
	sub_string(H,1,_,1,Res),
	split_string(Res,"#"," ",L2),
	atribui_elementos(L2).

atribui_elementos([]).
atribui_elementos([H|T]):-
	assert_bt(elemento())
	  
