sat(ENTRADA) :-
	separa_entrada(ENTRADA, ENTRADA_F),
	verifica_sat(ENTRADA_F).

separa_entrada(ENTRADA,ENTRADA_F):-
	string_codes(ENTRADA,ENTRADA_F).

removeHead([_|T],SAIDA):-
	SAIDA = T.

verifica_sat(ENTRADA_F):-
	L = ENTRADA_F,
	separa_listas_parenteses(L,L1,L2,0,0).

separa_listas_parenteses([],SAIDA,L2,_,NSAIDA):- 
		nth0(NSAIDA,L3,[_],L2),
		removeHead(L3,SAIDA).

separa_listas_parenteses([H|T],SAIDA,L2,N,NSAIDA):-
	H \= 40,    % Abre parenteses
	H \= 41,    % Fecha parenteses
	H \= 35,    % OU
	H \= 38,    % OU
	H \= 32,	% White Space
	nth0(N,L3,H,L2),
	N1 is N+1,
	separa_listas_parenteses(T,SAIDA,L3,N1,NSAIDA).

% White Space
separa_listas_parenteses([H|T],SAIDA,L2,N,NSAIDA):-
	H == 32,
	separa_listas_parenteses(T,SAIDA,L2,N,NSAIDA).

% E
separa_listas_parenteses([H|T],SAIDA,L2,N,NSAIDA):-
	H == 38,
	nth0(NSAIDA,L3,[],L2),
	removeHead(L3,SAIDA),
	N1 is NSAIDA + 1,
	separa_listas_parenteses(T,SAIDA,[],N,N1).

% OU
separa_listas_parenteses([H|T],SAIDA,L2,N,NSAIDA):-
	H == 35,
	separa_listas_parenteses(T,SAIDA,L2,N,NSAIDA).

% fecha parenteses
separa_listas_parenteses([H|T],SAIDA,L2,N,NSAIDA):-
	H == 41,
	separa_listas_parenteses(T,SAIDA,L2,N,NSAIDA).

% abre parenteses
separa_listas_parenteses([H|T],SAIDA,L2,N,NSAIDA):-
	H == 40,
	
	separa_listas_parenteses(T,SAIDA,L2,N,NSAIDA).
