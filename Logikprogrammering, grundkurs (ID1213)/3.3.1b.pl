/*Find the first x in the given list and remove it from the list*/
select(X,[X|Xs],Xs).
select(X,[Y|Ys],[Y|Zs]) :-
    not(X = Y),
    select(X,Ys,Zs).
