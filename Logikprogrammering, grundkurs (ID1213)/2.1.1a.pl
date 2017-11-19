/*
parent(emil, fredrik).
%parent(emil, evan).
%parent(perttu, good).
%sibling(X,Y) :- parent(Z,X),parent(Z,Y).
%sibling(perttu,emil).
%cousin(X,Y) :- parent(A,X),parent(Z,Y),sibling(A,Z).
*/

female(sofie).
female(dima).
female(sara).
female(saga).

male(edward).
male(nick).
male(kalle).
male(dude).
male(song).

parent(nick, edward).
parent(sofie, edward).
parent(nick, dima).
parent(sofie, dima).
parent(kalle, sofie).
parent(kalle, sara).
parent(saga, sara).
parent(saga, sofie).
parent(song, nick).
parent(song, dude).


brother(Brother, Sib) :-
    parent(Parent, Brother),
    parent(Parent, Sib),
    male(Brother),
    not(Brother = Sib).

sister(Sister, Sib) :-
    parent(Parent, Sister),
    parent(Parent, Sib),
   female(Sister),
   not(Sister = Sib).

uncle(X, Y) :-
    brother(X, Z), parent(Z, Y).

niece(X, Y) :-
    sibling(Y, Z), parent(Z, X),
    female(X).

sibling(X,Y) :-
    parent(Z, X), parent(Z, Y),
    parent(A, X), parent(A, Y),
    male(Z), female(A).

cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    sibling(P1, P2).
