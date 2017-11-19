normalized_sum(A+B):-!,
    constant(A),
    normalized_sum(B).

normalized_sum(X):-
    number(X).

