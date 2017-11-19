triangle(N,T):-
    N > 1, N1 is N-1, triangle(N1,T1), T is N + T1.

triangle(1, 1).
