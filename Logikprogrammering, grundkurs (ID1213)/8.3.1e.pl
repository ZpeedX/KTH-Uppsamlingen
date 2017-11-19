area(Xs,Ys) :-
    area(Xs,0,Ys).

area([_], S, S).
area([(X1,Y1), (X2,Y2)|XYs], Area, S) :-
    Area1 is (X1*Y2 - Y1*X2)/2 + Area,
    area([(X2,Y2)|XYs], Area1, S).


