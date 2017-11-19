greater_or_equal(X, 0) :-
    natural_number(X).

greater_or_equal(s(X),s(Y)) :-
    greater_or_equal(X, Y).

greater(s(X),0) :-
    natural_number(X).

greater(s(X),s(Y)):-
    greater(X,Y).

less_or_equal(0, X) :-
    natural_number(X).

less_or_equal(s(X), s(Y)) :-
    less_or_equal(X,Y).

natural_number(0).

natural_number(s(X)) :-
    natural_number(X).


