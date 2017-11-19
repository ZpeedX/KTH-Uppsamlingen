timeList(Is, P) :-
    timeList(Is, 1, P).

timeList([I|Is], Temp, P) :-
    not(I = 0),
    Temp1 is Temp * I,
    timeList(Is, Temp1, P).

timeList([0|_], _, 0).
timeList([], P, P).

