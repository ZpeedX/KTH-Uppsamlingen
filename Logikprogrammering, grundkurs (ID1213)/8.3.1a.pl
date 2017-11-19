triangle(N,T):-
    triangle(N,N,T).

triangle(N,T, S):-
    N > 0,
    N1 is N-1,
    G is T + N1,
    triangle(N1,G, S).

triangle(0, X, X).
