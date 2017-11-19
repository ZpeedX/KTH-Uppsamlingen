element(T, L):-
    elements(T, L-[]).

elements(t(L,R), T):-
    elements(L, Ls),
    elements(R, Rs),
    appd(Ls,Rs, T).

elements(T, [T|S]-S):-
    T\=t(_,_).

appd(A-B,B-C, A-C).
