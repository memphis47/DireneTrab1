comparaMaior([],[],S1,S2) :- S1 > S2.

comparaMaior([E1|T1],[E2|T2],S1,S2) :- 
    Sum1 is S1+E1, 
    Sum2 is S2+E2, 
    comparaMaior(T1,T2,Sum1,Sum2).


comparaMenor([],[],S1,S2) :- S1 < S2.

comparaMenor([E1|T1],[E2|T2],S1,S2) :- 
    Sum1 is S1+E1, 
    Sum2 is S2+E2, 
    comparaMenor(T1,T2,Sum1,Sum2).


comparaIgual([],[],S1,S2) :- S1 =:= S2.

comparaIgual([E1|T1],[E2|T2],S1,S2) :- 
    Sum1 is S1+E1, 
    Sum2 is S2+E2, 
    comparaIgual(T1,T2,Sum1,Sum2).

%Grupo_Maior_Maior
moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,_,_,_], 8, leve) :-
    comparaMaior([C7],[C8],0,0),
    comparaMaior([C3,C5,C6],[C4,C7,C8],0,0),
    comparaMaior([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).

moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,_,_,_], 3, pesada) :- 
    comparaIgual([C7],[C8],0,0),
    comparaMaior([C3,C5,C6],[C4,C7,C8],0,0),
    comparaMaior([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).

moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,_,_,_], 7, leve) :- 
    comparaMenor([C7],[C8],0,0),
    comparaMaior([C3,C5,C6],[C4,C7,C8],0,0),
    comparaMaior([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).


%Grupo_Maior_Igual
moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,_,_,_], 1, pesada) :- 
    comparaMaior([C1],[C2],0,0),
    comparaIgual([C3,C5,C6],[C4,C7,C8],0,0),
    comparaMaior([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).

moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,_,_,_], 2, pesada) :- 
    comparaMenor([C1],[C2],0,0),
    comparaIgual([C3,C5,C6],[C4,C7,C8],0,0),
    comparaMaior([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).


%Grupo_Maior_Menor
moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,_,_,_], 6, leve) :- 
    comparaMaior([C5],[C6],0,0),
    comparaMenor([C3,C5,C6],[C4,C7,C8],0,0),
    comparaMaior([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).

moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,_,_,_], 4, pesado) :- 
    comparaIgual([C5],[C6],0,0),
    comparaMenor([C3,C5,C6],[C4,C7,C8],0,0),
    comparaMaior([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).

moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,_,_,_], 5, leve) :- 
    comparaMenor([C5],[C6],0,0),
    comparaMenor([C3,C5,C6],[C4,C7,C8],0,0),
    comparaMaior([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).

%Grupo_Igual_Maior
moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,C10,C11,C12], 11, leve) :- 
    comparaMaior([C10],[C11],0,0),
    comparaMaior([C6,C7,C8],[C10,C11,C12],0,0),
    comparaIgual([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).

moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,C10,C11,C12], 12, pesado) :- 
    comparaIgual([C10],[C11],0,0),
    comparaMaior([C6,C7,C8],[C10,C11,C12],0,0),
    comparaIgual([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).

moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,C10,C11,C12], 10, leve) :- 
    comparaMenor([C10],[C11],0,0),
    comparaMaior([C6,C7,C8],[C10,C11,C12],0,0),
    comparaIgual([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).


%Grupo_Igual_Igual
moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12], 9, leve) :- 
    comparaMaior([C5],[C9],0,0),
    comparaIgual([C6,C7,C8],[C10,C11,C12],0,0),
    comparaIgual([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).

moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12], 9, pesada) :- 
    comparaMenor([C5],[C9],0,0),
    comparaIgual([C6,C7,C8],[C10,C11,C12],0,0),
    comparaIgual([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).


%Grupo_Igual_Menor
moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,C10,C11,C12], 10, pesado) :- 
    comparaMaior([C10],[C11],0,0),
    comparaMenor([C6,C7,C8],[C10,C11,C12],0,0),
    comparaIgual([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).

moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,C10,C11,C12], 12, pesado) :- 
    comparaIgual([C10],[C11],0,0),
    comparaMenor([C6,C7,C8],[C10,C11,C12],0,0),
    comparaIgual([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).

moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,C10,C11,C12], 11, pesado) :- 
    comparaMenor([C10],[C11],0,0),
    comparaMenor([C6,C7,C8],[C10,C11,C12],0,0),
    comparaIgual([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).





%Grupo_Menor_Menor
moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,_,_,_], 8, pesada) :-
    comparaMenor([C7],[C8],0,0),
    comparaMenor([C3,C5,C6],[C4,C7,C8],0,0),
    comparaMenor([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).

moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,_,_,_], 3, leve) :- 
    comparaIgual([C7],[C8],0,0),
    comparaMenor([C3,C5,C6],[C4,C7,C8],0,0),
    comparaMenor([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).

moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,_,_,_], 7, pesada) :- 
    comparaMaior([C7],[C8],0,0),
    comparaMenor([C3,C5,C6],[C4,C7,C8],0,0),
    comparaMenor([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).


%Grupo_Menor_Igual
moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,_,_,_], 1, leve) :- 
    comparaMenor([C1],[C2],0,0),
    comparaIgual([C3,C5,C6],[C4,C7,C8],0,0),
    comparaMenor([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).

moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,_,_,_], 2, leve) :- 
    comparaMaior([C1],[C2],0,0),
    comparaIgual([C3,C5,C6],[C4,C7,C8],0,0),
    comparaMenor([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).


%Grupo_Menor_Maior
moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,_,_,_], 6, pesada) :- 
    comparaMenor([C5],[C6],0,0),
    comparaMaior([C3,C5,C6],[C4,C7,C8],0,0),
    comparaMenor([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).

moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,_,_,_], 4, leve) :- 
    comparaIgual([C5],[C6],0,0),
    comparaMaior([C3,C5,C6],[C4,C7,C8],0,0),
    comparaMenor([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).

moeda_diferente([C1,C2,C3,C4,C5,C6,C7,C8,_,_,_,_], 5, pesada) :- 
    comparaMaior([C5],[C6],0,0),
    comparaMaior([C3,C5,C6],[C4,C7,C8],0,0),
    comparaMaior([C1,C2,C3,C4],[C5,C6,C7,C8],0,0).
