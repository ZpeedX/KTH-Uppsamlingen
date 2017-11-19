lengths(Xs, Y):-
    lengths(Xs, 0, Y).

lengths([_|Xs], N, S) :-
    N1 is N + 1,
    lengths(Xs,N1, S).
lengths([], S, S).
