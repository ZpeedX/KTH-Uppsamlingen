
left_of(butterfly, fish).
left_of(hourglass, butterfly).
left_of(pen, hourglass).

above(camera, butterfly).
above(bycicle, pen).

right_of(O1, O2) :-
left_of(O2,O1).

below(O1,O2) :-
above(O2,O1).
