%DPLL sat
:- dynamic elemento/1, ver/1, fal/1, clausulas_idefinidas/1.

assert_bt(X) :- assert(X).
assert_bt(X) :- retract(X), fail.

sat(ENTRADA) :-
	retractall(elemento(_)),
	retractall(ver(_)),
	retractall(fal(_)),
	retractall(clausulas_idefinidas(_)),
	split_string(ENTRADA,'&'," ",L1),
	resolve_bloco(L1).

resolve_bloco([]).

resolve_bloco([H|T]):-
	sub_string(H,1,_,1,Res),
	split_string(Res,"#"," ",L2),
	atribui_elementos(L2),
	verifica_sat([H|T]).

resolve_bloco([H|T]):-
	atribui_elementos(H),
	verifica_sat([H|T]).

atribui_elementos([]).

atribui_elementos([H|T]):-
	sub_string(H,1,_,0,Res),
	Res \= "",
	assert_bt(elemento(Res)),
	atribui_elementos(T).

atribui_elementos([H|T]):-
	assert_bt(elemento(H)),
	atribui_elementos(T).
	
atribui_elementos(X):-
	assert_bt(elemento(X)).

atribui_verdade:-
	elemento(X),
	assert_bt(ver(X)).

atribui_falso:-
	elemento(X),
	assert_bt(fal(X)).

verifica_sat([H|T]):-
	atribui_verdade,
	verifica_blocos([H|T]).

verifica_sat([H|T]):-
	atribui_falso,
	verifica_blocos([H|T]).
	
verifica_blocos([]).

verifica_blocos([H|T]):-
	sub_string(H,1,_,1,Res),
	split_string(Res,"#"," ",L2),
	verifica(Res,L2,H),
	verifica_blocos(T),
	verifica_resto.

verifica(Res,[H|T],Cls):-
	ver(X),
	verifica_total(Res,[H|T],X,Cls).
	
verifica(Res,[H|T],Cls):-
	fal(X),
	verifica_total(Res,[H|T],X,Cls).



verifica_total(Res,[],X,Cls):-
	assert_bt(clausulas_idefinidas(Cls)),
	retract(elemento(X)).

verifica_total(Res,[H|T],X,Cls):-
	X == H.

verifica_total(Res,[H|T],X,Cls):-
	sub_string(H,1,_,0,RP),
	RP \= "",
	X == RP,
	ver(X),
	verifica_total(Res,T,X,Cls).
	
verifica_total(Res,[H|T],X,Cls):-
	sub_string(H,1,_,0,RP),
	RP \= "",
	X == RP,
	fal(X).

verifica_total(Res,[H|T],X,Cls):-
	sub_string(H,1,_,0,RP),
	RP \= "",
	X \= RP,
	verifica_total(RP,T,X,Cls).

verifica_total(Res,[H|T],X,Cls):-
	X \= H,
	verifica_total(Res,T,X,Cls).


verifica_resto:-
	findall(X,clausulas_idefinidas(X), L), %supostamente retorna todas as clausulas_idefinidas
	length(L,TAM),
	TAM > 0,
	findall(X,elemento(X), LE), %supostamente retorna todas as clausulas_idefinidas
	length(LE,TAME),
	TAME > 0,
	verifica_sat(L).

verifica_resto:-
	findall(X,clausulas_idefinidas(X), LE), %supostamente retorna todas as clausulas_idefinidas
	length(LE,TAME),
	TAME > 0,
	findall(X,elemento(X), L), %supostamente retorna todas as clausulas_idefinidas
	length(L,TAM),
	TAM =:= 0,
	fail.

verifica_resto:-
	findall(X,clausulas_idefinidas(X), LE), %supostamente retorna todas as clausulas_idefinidas
	length(LE,TAME),
	TAME =:= 0.