
max_heapTree(tree(X,L,R)):-
    max_heapTree(tree(X,L,R), X, 0,_, _).

max_heapTree(void, _, L, Z, K):-
    (var(Z); var(K)),
    (Z is L-1),!.

max_heapTree(void, _, L, Z, K):-
    Z == L,
    K = on,!.

max_heapTree(tree(X,L,R), M, Lv, Z, K):-
    Lv1 is Lv +1,
    X =< M,
    max_heapTree(L, X, Lv1, Z, K),
    max_heapTree(R, X, Lv1, Z, K).

min_heapTree(tree(X,L,R)):-
    min_heapTree(tree(X,L,R), X, 0, _,_).

min_heapTree(void, _, L, Z, K):-
    (var(Z);
    var(K)),
    (Z is L-1),!.

min_heapTree(void, _, L, Z, K):-
    Z == L,
    K = on,!.

min_heapTree(tree(X,L,R), M, Lv, Z, K):-
    Lv1 is Lv +1,
    X >= M,
    min_heapTree(L, X, Lv1, Z, K),
    min_heapTree(R, X, Lv1, Z, K).
