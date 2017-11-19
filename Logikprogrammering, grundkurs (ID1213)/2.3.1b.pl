left_of(butterfly, fish).
left_of(hourglass, butterfly).
left_of(pen, hourglass).

above(camera, butterfly).
above(bike, pen).

left(O1,O2) :-
    left_of(O1,O2).

left(O1, O2) :-
    left_of(O1,O3),
    left(O3,O2).


higher(O1,O2) :-
    (above(O1,O2)
    ;above(O1,X)),
    (left(X,O2);
    left(O2,X)).
