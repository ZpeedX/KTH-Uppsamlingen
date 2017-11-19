/*op(600,xfy,++)*/

normalize(Exp, Norm):-
    normalize_ds(Exp, Norm++0).

normalize_ds(A+B, Norm++Space) :-
    normalize_ds(B, NormB++Space),
    normalize_ds(A,Norm++NormB).

normalize_ds(A, (A+Space)++Space) :-
    atom(A);
    number(A).

