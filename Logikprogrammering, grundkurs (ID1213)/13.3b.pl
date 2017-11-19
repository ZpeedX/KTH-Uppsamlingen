binary_max(tree(X,L,R),Y):-
    binary_max(M,tree(X,L,R),Y, M, X).

binary_max(H, void,void, _, H).
binary_max(M,tree(X,L, R), tree(F, L1, R1), F, H):-
    binary_max(Val1,L, L1, F, H),
    binary_max(Val2,R, R1, F, H),
    max(Val1,Val2,M1),
    max(M1, X, M).

max(X,Y,X):-
    X >= Y, !.
max(_,Y,Y).
