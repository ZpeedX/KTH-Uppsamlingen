handelse(matte, sand, 12.00, 13.00, "fdsf").
handelse(hello, kalle, 12.00, 13.00, "fdsf").
handelse(sald, kal, 12.30, 15.00, "fdsf").
handelse(tand, sund, 11.00, 12.30, "fdsf").
handelse(tand, trid, 11.00, 12.30, "fdsf").

nodoubles([], []):-!.
nodoubles([o(F,S)|Xs], Y):-
    member(o(S,F), Xs),!,
    nodoubles(Xs, Y).

nodoubles([o(F,S)|Xs], [o(F,S)|Y]):-
    not(member(o(S,F), Xs)),
    nodoubles(Xs, Y).


overL(List) :-
    setof(o(H,Z),(overlap(H,Z, _, _)), List1),
    nodoubles(List1, List).

ansvarig(List) :-
    setof(o(P,P1),(overlap(_,_, P, P1)), List1),
    nodoubles(List1, List).



overlap(H, Z, P1, P2) :-
    handelse(H, P1, T, S, _),
    handelse(Z, P2, T1, S1, _),
    \+ H = Z,
    T < S1,
    S > T1.
