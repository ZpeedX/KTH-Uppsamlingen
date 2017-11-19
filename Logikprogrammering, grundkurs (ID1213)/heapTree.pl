treeToList(void, []) :-!.
treeToList(tree(X,L,R), [X|Xs]) :-
    treeToList(L, Ls),
    treeToList(R, Rs),
    append(Ls, Rs, Xs).


heapTree(Ts, Xs):-
    treeToList(Ts, Rs),
    toHeap.
