square_root(N, L) :-
    between(1, N, L),
    N >= L**2,
    N < (L+1)**2,! .

