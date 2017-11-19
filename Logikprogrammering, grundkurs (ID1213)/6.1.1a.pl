male(isaac).
male(lot).
female(milcah).
female(yiscah).

father(abraham, isaac).
father(haran, lot).
father(haran, milcah).
father(haran, yiscah).


son(X,Y) :-
    father(Y,X),
    male(X).

daughter(X,Y) :-
    father(Y,X),
    female(X).

/*
daughter(X,haran).
   Call: (8) daughter(_978, haran) ? creep
   Call: (9) father(haran, _978) ? creep
   Exit: (9) father(haran, lot) ? creep
   Call: (9) female(lot) ? creep
   Fail: (9) female(lot) ? creep
   Redo: (9) father(haran, _978) ? creep
   Exit: (9) father(haran, milcah) ? creep
   Call: (9) female(milcah) ? creep
   Exit: (9) female(milcah) ? creep
   Exit: (8) daughter(milcah, haran) ? creep
X = milcah ;
   Redo: (9) father(haran, _978) ? creep
   Exit: (9) father(haran, yiscah) ? creep
   Call: (9) female(yiscah) ? creep
   Exit: (9) female(yiscah) ? creep
   Exit: (8) daughter(yiscah, haran) ? creep
X = yiscah.
*/
