union_intersect([X|Xs],Ys,Us,[X|Is], Ns) :-
    member(X,Ys), union_intersect(Xs,Ys,Us,Is, Ns).

union_intersect([X|Xs],Ys,[X|Us],Is,[X|Ns]):-
    not(member(X,Ys)), union_intersect(Xs,Ys,Us,Is, Ns).

union_intersect([],Ys,Ys,[], []).
