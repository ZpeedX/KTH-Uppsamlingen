sum_tree(void,0).
sum_tree(tree(X,Left,Right), S):-
    sum_tree(Left, K),
    sum_tree(Right,R),
    S is R + K + X.
