no_doubles(Xs, Ys) :-
    no_doubles(Xs, [], Ys).

no_doubles([X|Xs], Ys, Zs) :-
    member(X,Xs), no_doubles(Xs,Ys, Zs).

no_doubles([X|Xs], Ys, Zs) :-
    nonmember(X,Xs),
    no_doubles(Xs, [X|Ys], Zs).

no_doubles([],Ys, Ys).

nonmember(X,[Y|Ys]) :-
    not(X = Y),
    nonmember(X,Ys).

nonmember(_,[]).
