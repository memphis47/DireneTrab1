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
    Posicao is X1,
    Peso = Y1. 

comparaFinal(S1,S2,Posicao,Peso,[_,X2,_],[_,Y2,_]):-
    comparaIgual(S1,S2),
    Posicao is X2,
    Peso = Y2. 

comparaFinal(S1,S2,Posicao,Peso,[_,_,X3],[_,_,Y3]):-
    comparaMenor(S1,S2),
    Posicao is X3,
    Peso = Y3. 



moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12], Posicao, Peso) :-
    pesagem([C1,C2,C3,C4],[C5,C6,C7,C8],S1,S2),                                  
    comparaNivel1([C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12],S1,S2,Posicao,Peso).


comparaNivel1([C1,C2,C3,C4,C5,C6,C7,C8,_,_,_,_],S1,S2,Posicao,Pesagem) :- 
    comparaMaior(S1,S2),
    pesagem([C3,C5,C6],[C4,C7,C8],SN1,SN2),
    comparaNivel2Maior([C1,C2,C3,C4,C5,C6,C7,C8],SN1,SN2,Posicao,Pesagem).

comparaNivel1([_,_,_,_,C5,C6,C7,C8,C9,C10,C11,C12],S1,S2,Posicao,Pesagem) :- 
    comparaIgual(S1,S2),
    pesagem([C6,C7,C8],[C10,C11,C12],SN1,SN2),
    comparaNivel2Igual([C5,C6,C7,C8,C9,C10,C11,C12],SN1,SN2,Posicao,Pesagem).

comparaNivel1([C1,C2,C3,C4,C5,C6,C7,C8,_,_,_,_],S1,S2,Posicao,Pesagem) :- 
    comparaMenor(S1,S2),
    pesagem([C3,C5,C6],[C4,C7,C8],SN1,SN2),
    comparaNivel2Menor([C1,C2,C3,C4,C5,C6,C7,C8],SN1,SN2,Posicao,Pesagem).


%Grupo_Maior_Maior
comparaNivel2Maior([_,_,_,_,_,_,C7,C8],S1,S2,Posicao,Pesagem) :-
    comparaMaior(S1,S2),
    pesagem([C7],[C8],SN1,SN2),
    comparaFinal(SN1,SN2,Posicao,Pesagem,[8,3,7],['leve','pesado','leve']).

%Grupo_Maior_Igual
comparaNivel2Maior([C1,C2,_,_,_,_,_,_],S1,S2,Posicao,Pesagem) :- 
    comparaIgual(S1,S2),
    pesagem([C1],[C2],SN1,SN2),
    comparaFinal(SN1,SN2,Posicao,Pesagem,[1,0,2],['pesado','none','pesado']).

%Grupo_Maior_Menor
comparaNivel2Maior([_,_,_,_,C5,C6,_,_],S1,S2,Posicao,Pesagem) :- 
    comparaMenor(S1,S2),
    pesagem([C5],[C6],SN1,SN2),
    comparaFinal(SN1,SN2,Posicao,Pesagem,[6,4,5],['leve','pesado','leve']).


%Grupo_Igual_Maior
comparaNivel2Igual([_,_,_,_,_,C10,C11,_],S1,S2,Posicao,Pesagem) :- 
    comparaMaior(S1,S2),
    pesagem([C10],[C11],SN1,SN2),
    comparaFinal(SN1,SN2,Posicao,Pesagem,[11,12,10],['leve','leve','leve']).

%Grupo_Igual_Igual
comparaNivel2Igual([C5,_,_,_,C9,_,_,_],S1,S2,Posicao,Pesagem) :- 
    comparaIgual(S1,S2),
    pesagem([C5],[C9],SN1,SN2),
    comparaFinal(SN1,SN2,Posicao,Pesagem,[9,0,9],['leve','none','pesado']).

%Grupo_Igual_Menor
comparaNivel2Igual([_,_,_,_,_,C10,C11,_],S1,S2,Posicao,Pesagem) :- 
    comparaMenor(S1,S2),
    pesagem([C10],[C11],SN1,SN2),
    comparaFinal(SN1,SN2,Posicao,Pesagem,[10,12,11],['pesado','pesado','pesado']).


%Grupo_Menor_Maior
comparaNivel2Menor([_,_,_,_,C5,C6,_,_],S1,S2,Posicao,Pesagem) :- 
    comparaMaior(S1,S2),
    pesagem([C5],[C6],SN1,SN2),
    comparaFinal(SN1,SN2,Posicao,Pesagem,[5,4,6],['pesado','leve','pesado']).

%Grupo_Menor_Igual
comparaNivel2Menor([C1,C2,_,_,_,_,_,_],S1,S2,Posicao,Pesagem) :- 
    comparaIgual(S1,S2),
    pesagem([C1],[C2],SN1,SN2),
    comparaFinal(SN1,SN2,Posicao,Pesagem,[2,0,1],['leve','none','leve']).

%Grupo_Menor_Menor
comparaNivel2Menor([_,_,_,_,_,_,C7,C8],S1,S2,Posicao,Pesagem) :- 
    comparaMenor(S1,S2),
    pesagem([C7],[C8],SN1,SN2),
    comparaFinal(SN1,SN2,Posicao,Pesagem,[7,3,8],['pesado','leve','pesado']).