no_double([],[]).

no_double([X|Xs],Ys):-
  member(X,Xs),
  no_double(Xs,Ys).

no_double([X|Xs], [X|Ys]):-
  not(member(X,Xs)),
  no_double(Xs,Ys).

