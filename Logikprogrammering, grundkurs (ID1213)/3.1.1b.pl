even(0).

even(X) :-
    natural_number(X).

odd(s(X)) :-
    natural_number(X).

natural_number(0).

natural_number(s(s(X))) :-
    natural_number(X).
