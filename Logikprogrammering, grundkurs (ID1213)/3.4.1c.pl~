ordered_left(_,void).

ordered_left(X,tree(Y,Left,Right)):-
    Y < X,
    ordered_left(Y,Left),
    ordered_left(X,Right),
    ordered_right(Y,Right).

ordered_right(_,void).

ordered_right(X,tree(Y,Left,Right)):-
    Y > X,
    ordered_right(Y,Right),
    ordered_right(X,Left),
    ordered_left(Y,Left).

ordered(tree(X,Left,Right)):-
    ordered_left(X,Left),
    ordered_right(X,Right).
