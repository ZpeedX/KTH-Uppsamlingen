

married_couple(sofie, nick).

mother_in_law(X, Y) :-
    married_couple(X, Z),
    parent(Z,Y),
    female(X).
brother_in_law(X, Y) :-
    married_couple(Y, Z),
    brother(X,Z).

son_in_law(X, Y) :-
    married_couple(X, Z),
    parent(Y, Z).

