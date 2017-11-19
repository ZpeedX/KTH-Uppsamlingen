parent(terach, abraham).
parent(abraham, isaac).
parent(isaac,jacob).
parent(jacob,benjamin).

ancestor(X,Z) :-
    parent(X,Y),
    ancestor(Y,Z).


ancestor(X,Y) :-
    parent(X,Y).
