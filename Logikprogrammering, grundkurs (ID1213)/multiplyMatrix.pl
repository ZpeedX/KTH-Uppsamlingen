multi([],[],0).

multi([X|Xs],[Y|Ys], Z) :-
    multi(Xs, Ys, F),
    Z is X * Y + F.

first([],[],[]).
first([[X|Xs]|Ys],[X|Fs],[Xs|Ls]):-
    first(Ys,Fs,Ls).

multiply(_, [[]|_], []).
multiply(X, Y , [Z|Zs]) :-
    first(Y, T, R),
    multi(X, T, Z),
    multiply(X, R, Zs).

matrix([],_,[]).
matrix([X|Xs], Y, [Z|Zs]) :-
    multiply(X, Y, Z),
    matrix(Xs, Y, Zs).
