double([],[]).

double([X|Xs],[X|Ys]):-
    double2([X|Xs],Ys).

double2([X|Xs],[X|Ys]):-
    double(Xs,Ys).
