flatten([],[]).
flatten([X|Xs], [X|H]):-
    (var(X);
    not(islist(X))),
    flatten(Xs, H),!.

flatten([X|Xs], H1):-
    append(X, H, H1),
    flatten(Xs, H).

islist([]).
islist([_|_]).
