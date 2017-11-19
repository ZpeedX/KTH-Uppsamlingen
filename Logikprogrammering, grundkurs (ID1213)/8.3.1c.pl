between(I,J, J) :-
    I =< J.

between(I,J,K) :-
    I < J,
    J1 is J -1,
    between(I, J1, K).
