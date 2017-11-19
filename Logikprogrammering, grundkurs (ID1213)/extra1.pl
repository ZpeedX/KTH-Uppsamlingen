prefix([], _).


prefix([X|Xs],[X|Ys]) :-
    prefix(Xs, Ys).
