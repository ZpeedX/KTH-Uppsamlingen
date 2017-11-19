/*op(600,xfy,++)*/

e_normalize(Exp, X+(Norm)):-
    e_normalize_ds(Exp, Norm++0, X).

e_normalize_ds(A+B, Norm++Space, X) :-
    e_normalize_ds(A,Norm++NormB ,N1),
    e_normalize_ds(B, NormB++Space, N2),
    X is N1 + N2.

e_normalize_ds(A, (A+Space)++Space, 0) :-
   atom(A),!.

e_normalize_ds(X,(Space)++Space, X) :-
    number(X).

