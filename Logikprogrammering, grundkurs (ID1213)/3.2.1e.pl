sum_a([], 0).

sum_a([X|Xs], S) :-
    sum(Xs, F),
    plus(X, F, S).
