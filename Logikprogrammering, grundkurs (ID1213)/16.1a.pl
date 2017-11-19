intersect(Xs ,Ys, Zs) :-
    setof(T, (member(T, Ys), member(T, Xs)) , Zs).

