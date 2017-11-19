adjacent(X,Y,[Y|[X|_]]).
adjacent(X,Y,[X|[Y|_]]).

adjacent(X, Y, [_|Zs]) :-
    adjacent(X, Y, Zs).


last([X],X).
last([_|T], X) :-
    last(T, X).
