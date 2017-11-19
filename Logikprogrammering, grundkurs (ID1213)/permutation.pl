
perm([],[]).
perm([X|Xs], Y):-
    perm(Xs,W),
    select(X, Y, W).


permute(Xs, Ys):-
    findall(Ls, perm(Xs,Ls) ,Ys).
