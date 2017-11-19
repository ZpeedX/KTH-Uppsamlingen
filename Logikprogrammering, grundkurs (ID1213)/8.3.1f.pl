minimum([X|Xs],Y) :-
    minimum(Xs, X, Y).

minimum([], Y, Y).

minimum([X|Xs], Y, Z) :-
     X =< Y,
    minimum(Xs, X, Z).

minimum([X|Xs], Y, Z) :-
     X > Y,
    minimum(Xs, Y, Z).
