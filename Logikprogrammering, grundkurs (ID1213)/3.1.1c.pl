fib(0,0):-!.
fib(1,1):-!.

fib(N, F) :-
  N1 is N-1,
  N2 is N-2,
  fib(N1, Result1),
  fib(N2, Result2),
  F is Result1 + Result2.
