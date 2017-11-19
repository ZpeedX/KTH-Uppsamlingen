flatten(X, Y):-
    flatten_dl(X, Y-[]).

flatten_dl(X, [X|Xs]-Xs):-
    (var(X);
    number(X)),!.

flatten_dl([X|Xs], Ys-Zs):-
    flatten_dl(X, Ys-B),
    flatten_dl(Xs, B-Zs),!.

flatten_dl([], Xs-Xs).

