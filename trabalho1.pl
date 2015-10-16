comparaMaior(S1,S2) :- S1 > S2.

comparaMenor(S1,S2) :- S1 < S2.

comparaIgual(S1,S2) :- S1 =:= S2.


pesagem([],[],0,0) :- !.

pesagem([E1|T1],[E2|T2],S1,S2) :- 
    pesagem(T1,T2,Sum1,Sum2),
    S1 is Sum1+E1, 
    S2 is Sum2+E2. 
    

comparaFinal(S1,S2,Posicao,Peso,[X1,_,_],[Y1,_,_]):-
    comparaMaior(S1,S2),
write('Comparacao Maior Final Sucesso\n'),
write(X1),
write(Y1),
    Posicao is X1,
    Peso is Y1. 

comparaFinal(S1,S2,Posicao,Peso,[_,X2,_],[_,Y2,_]):-
write('Comparacao Igual Final\n'),
    comparaIgual(S1,S2),
    Posicao is X2,
    Peso is Y2. 

comparaFinal(S1,S2,Posicao,Peso,[_,_,X3],[_,_,Y3]):-
write('Comparacao Menor Final\n'),
    comparaMenor(S1,S2),
    Posicao is X3,
    Peso is Y3. 



moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12], Posicao, Peso) :-
    write('Ola\n'),
    pesagem([C1,C2,C3,C4],[C5,C6,C7,C8],S1,S2),
    write('Foi pesagem1\n'),
    comparaNivel1([C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12],S1,S2,Posicao,Peso).


comparaNivel1([C1,C2,C3,C4,C5,C6,C7,C8,_,_,_,_],S1,S2,Posicao,Pesagem) :- 
    comparaMaior(S1,S2),
    pesagem([C3,C5,C6],[C4,C7,C8],SN1,SN2),
    write('Foi pesagem2Ma\n'),
    comparaNivel2Maior([C1,C2,C3,C4,C5,C6,C7,C8],SN1,SN2,Posicao,Pesagem).

comparaNivel1([_,_,_,_,C5,C6,C7,C8,C9,C10,C11,C12],S1,S2,Posicao,Pesagem) :- 
    comparaIgual(S1,S2),
    pesagem([C6,C7,C8],[C10,C11,C12],SN1,SN2),
    write('Foi pesagem2Ig\n'),
    comparaNivel2Igual([C5,C6,C7,C8,C9,C10,C11,C12],SN1,SN2,Posicao,Pesagem).

comparaNivel1([C1,C2,C3,C4,C5,C6,C7,C8,_,_,_,_],S1,S2,Posicao,Pesagem) :- 
    comparaMenor(S1,S2),
    pesagem([C3,C5,C6],[C4,C7,C8],SN1,SN2),
    write('Foi pesagem2Me\n'),
    comparaNivel2Menor([C1,C2,C3,C4,C5,C6,C7,C8],SN1,SN2,Posicao,Pesagem).


%Grupo_Maior_Maior
comparaNivel2Maior([_,_,_,_,_,_,C7,C8],S1,S2,Posicao,Pesagem) :-
    comparaMaior(S1,S2),
    pesagem([C7],[C8],SN1,SN2),
    write('Foi pesagem3Ma\n'),
    comparaFinal(SN1,SN2,Posicao,Pesagem,['8','3','7'],['leve','pesado','leve']).

%Grupo_Maior_Igual
comparaNivel2Maior([C1,C2,_,_,_,_,_,_],S1,S2,Posicao,Pesagem) :- 
    comparaIgual(S1,S2),
    pesagem([C1],[C2],SN1,SN2),
    write('Foi pesagem3Ig\n'),
    comparaFinal(SN1,SN2,Posicao,Pesagem,['1','0','2'],['pesado','none','pesado']).

%Grupo_Maior_Menor
comparaNivel2Maior([_,_,_,_,C5,C6,_,_],S1,S2,Posicao,Pesagem) :- 
    comparaMenor(S1,S2),
    pesagem([C5],[C6],SN1,SN2),
    write('Foi pesagem3Me\n'),
    comparaFinal(SN1,SN2,Posicao,Pesagem,['6','4','5'],['leve','pesado','leve']).


%Grupo_Igual_Maior
comparaNivel2Igual([_,_,_,_,_,C10,C11,_],S1,S2,Posicao,Pesagem) :- 
    comparaMaior(S1,S2),
    pesagem([C10],[C11],SN1,SN2),
    comparaFinal(SN1,SN2,Posicao,Pesagem,['11','12','10'],['leve','leve','leve']).

%Grupo_Igual_Igual
comparaNivel2Igual([C5,_,_,_,C9,_,_,_],S1,S2,Posicao,Pesagem) :- 
    comparaIgual(S1,S2),
    pesagem([C5],[C9],SN1,SN2),
    comparaFinal(SN1,SN2,Posicao,Pesagem,['9','0','9'],['leve','none','pesado']).

%Grupo_Igual_Menor
comparaNivel2Igual([_,_,_,_,_,C10,C11,_],S1,S2,Posicao,Pesagem) :- 
    comparaMenor(S1,S2),
    pesagem([C10],[C11],SN1,SN2),
    comparaFinal(SN1,SN2,Posicao,Pesagem,['10','12','11'],['pesado','pesado','pesado']).


%Grupo_Menor_Maior
comparaNivel2Menor([_,_,_,C5,C6,_,_],S1,S2,Posicao,Pesagem) :- 
    comparaMaior(S1,S2),
    pesagem([C5],[C6],SN1,SN2),
    comparaFinal(SN1,SN2,Posicao,Pesagem,['5','4','6'],['pesado','leve','pesado']).

%Grupo_Menor_Igual
comparaNivel2Menor([C1,C2,_,_,_,_,_],S1,S2,Posicao,Pesagem) :- 
    comparaIgual(S1,S2),
    pesagem([C1],[C2],SN1,SN2),
    comparaFinal(SN1,SN2,Posicao,Pesagem,['2','0','1'],['leve','none','leve']).

%Grupo_Menor_Menor
comparaNivel2Menor([_,_,_,_,_,_,C7,C8],S1,S2,Posicao,Pesagem) :- 
    comparaMenor(S1,S2),
    pesagem([C7],[C8],SN1,SN2),
    comparaFinal(SN1,SN2,Posicao,Pesagem,['7','3','8'],['pesado','leve','pesado']).







%% comparaNivel2Maior([C1,C2,C3,C4,C5,C6,C7,C8],S1,S2,Pos,Pes) :- 
%%     comparaIgual(S1,S2),
%%     pesagem([C3,C5,C6],[C4,C7,C8],SN1,SN2),
%%     comparaNivel3MaiorIgual([C1,C2],SN1,SN2,Pos,Pes).

%% comparaNivel2Maior([C3,C4,C5,C6,C7,C8],S1,S2,Pos,Pes) :- 
%%     comparaMenor(S1,S2),
%%     pesagem([C3,C5,C6],[C4,C7,C8],SN1,SN2),
%%     comparaNivel3MaiorMenor([C4,C5,C6],SN1,SN2,Pos,Pes).

%% comparaNivel3MaiorMaior([C3,C4,C5,C6,C7,C8],S1,S2,Pos,Pes) :- 
%%     comparaMaior(S1,S2),
%%     pesagem([C3,C5,C6],[C4,C7,C8],SN1,SN2),
%%     comparaNivel3MaiorMaior([C3,C7,C8],SN1,SN2,Pos,Pes).









%%     comparaMaior([C7],[C8],0,0),
%%     comparaMaior([C3,C5,C6],[C4,C7,C8],0,0),
%%     comparaMaior([C3,C5,C6],[C4,C7,C8],0,0),
%%     pesagem([C1,C2,C3,C4],[C5,C6,C7,C8],S1,S2).    

%% %Grupo_Maior_Maior
%% moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,_,_,_], 8, leve) :-
%%     comparaMaior([C7],[C8],0,0),
%%     comparaMaior([C3,C5,C6],[C4,C7,C8],0,0),
%%     comparaMaior([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).

%% moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,_,_,_], 3, pesada) :- 
%%     comparaIgual([C7],[C8],0,0),
%%     comparaMaior([C3,C5,C6],[C4,C7,C8],0,0),
%%     comparaMaior([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).

%% moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,_,_,_], 7, leve) :- 
%%     comparaMenor([C7],[C8],0,0),
%%     comparaMaior([C3,C5,C6],[C4,C7,C8],0,0),
%%     comparaMaior([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).


%% %Grupo_Maior_Igual
%% moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,_,_,_], 1, pesada) :- 
%%     comparaMaior([C1],[C2],0,0),
%%     comparaIgual([C3,C5,C6],[C4,C7,C8],0,0),
%%     comparaMaior([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).

%% moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,_,_,_], 2, pesada) :- 
%%     comparaMenor([C1],[C2],0,0),
%%     comparaIgual([C3,C5,C6],[C4,C7,C8],0,0),
%%     comparaMaior([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).


%% %Grupo_Maior_Menor
%% moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,_,_,_], 6, leve) :- 
%%     comparaMaior([C5],[C6],0,0),
%%     comparaMenor([C3,C5,C6],[C4,C7,C8],0,0),
%%     comparaMaior([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).

%% moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,_,_,_], 4, pesado) :- 
%%     comparaIgual([C5],[C6],0,0),
%%     comparaMenor([C3,C5,C6],[C4,C7,C8],0,0),
%%     comparaMaior([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).

%% moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,_,_,_], 5, leve) :- 
%%     comparaMenor([C5],[C6],0,0),
%%     comparaMenor([C3,C5,C6],[C4,C7,C8],0,0),
%%     comparaMaior([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).

%% %Grupo_Igual_Maior
%% moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,C10,C11,C12], 11, leve) :- 
%%     comparaMaior([C10],[C11],0,0),
%%     comparaMaior([C6,C7,C8],[C10,C11,C12],0,0),
%%     comparaIgual([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).

%% moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,C10,C11,C12], 12, pesado) :- 
%%     comparaIgual([C10],[C11],0,0),
%%     comparaMaior([C6,C7,C8],[C10,C11,C12],0,0),
%%     comparaIgual([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).

%% moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,C10,C11,C12], 10, leve) :- 
%%     comparaMenor([C10],[C11],0,0),
%%     comparaMaior([C6,C7,C8],[C10,C11,C12],0,0),
%%     comparaIgual([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).


%% %Grupo_Igual_Igual
%% moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12], 9, leve) :- 
%%     comparaMaior([C5],[C9],0,0),
%%     comparaIgual([C6,C7,C8],[C10,C11,C12],0,0),
%%     comparaIgual([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).

%% moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12], 9, pesada) :- 
%%     comparaMenor([C5],[C9],0,0),
%%     comparaIgual([C6,C7,C8],[C10,C11,C12],0,0),
%%     comparaIgual([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).


%% %Grupo_Igual_Menor
%% moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,C10,C11,C12], 10, pesado) :- 
%%     comparaMaior([C10],[C11],0,0),
%%     comparaMenor([C6,C7,C8],[C10,C11,C12],0,0),
%%     comparaIgual([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).

%% moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,C10,C11,C12], 12, pesado) :- 
%%     comparaIgual([C10],[C11],0,0),
%%     comparaMenor([C6,C7,C8],[C10,C11,C12],0,0),
%%     comparaIgual([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).

%% moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,C10,C11,C12], 11, pesado) :- 
%%     comparaMenor([C10],[C11],0,0),
%%     comparaMenor([C6,C7,C8],[C10,C11,C12],0,0),
%%     comparaIgual([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).





%% %Grupo_Menor_Menor
%% moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,_,_,_], 8, pesada) :-
%%     comparaMenor([C7],[C8],0,0),
%%     comparaMenor([C3,C5,C6],[C4,C7,C8],0,0),
%%     comparaMenor([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).

%% moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,_,_,_], 3, leve) :- 
%%     comparaIgual([C7],[C8],0,0),
%%     comparaMenor([C3,C5,C6],[C4,C7,C8],0,0),
%%     comparaMenor([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).

%% moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,_,_,_], 7, pesada) :- 
%%     comparaMaior([C7],[C8],0,0),
%%     comparaMenor([C3,C5,C6],[C4,C7,C8],0,0),
%%     comparaMenor([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).


%% %Grupo_Menor_Igual
%% moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,_,_,_], 1, leve) :- 
%%     comparaMenor([C1],[C2],0,0),
%%     comparaIgual([C3,C5,C6],[C4,C7,C8],0,0),
%%     comparaMenor([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).

%% moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,_,_,_], 2, leve) :- 
%%     comparaMaior([C1],[C2],0,0),
%%     comparaIgual([C3,C5,C6],[C4,C7,C8],0,0),
%%     comparaMenor([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).


%% %Grupo_Menor_Maior
%% moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,_,_,_], 6, pesada) :- 
%%     comparaMenor([C5],[C6],0,0),
%%     comparaMaior([C3,C5,C6],[C4,C7,C8],0,0),
%%     comparaMenor([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).

%% moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,_,_,_], 4, leve) :- 
%%     comparaIgual([C5],[C6],0,0),
%%     comparaMaior([C3,C5,C6],[C4,C7,C8],0,0),
%%     comparaMenor([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).

%% moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,_,_,_], 5, pesada) :- 
%%     comparaMaior([C5],[C6],0,0),
%%     comparaMaior([C3,C5,C6],[C4,C7,C8],0,0),
%%     comparaMaior([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).
