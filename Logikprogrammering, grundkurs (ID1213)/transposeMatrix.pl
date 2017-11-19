
first([],[],[]).
first([[X|Xs]|Ys],[X|Fs],[Xs|Ls]):-
    first(Ys,Fs,Ls).

matrix([],[]).
matrix([[]|_],[]).
matrix(X, [Y|Ys]) :-
    first(X, Y, Z),
    matrix(Z,Ys).

