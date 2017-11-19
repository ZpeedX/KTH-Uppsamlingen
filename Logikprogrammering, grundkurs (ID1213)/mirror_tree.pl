mirror(void,void).
mirror(tree(X, L,R), tree(X,L1,R1)):-
    mirror(L, R1),
    mirror(R, L1).
