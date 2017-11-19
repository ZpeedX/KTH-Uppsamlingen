course(1, english, 10).
course(2, complexity, 10).
course(3, math, 10).
course(4, pe, 10).
course(5, swedish, 10).


graded_course(1, nick, e).
graded_course(2, nick, f).
graded_course(3, nick, f).
graded_course(4, nick, f).
graded_course(5, nick, e).


check_grades(Id,_,_):-
    Id > 5,!.

check_grades(Id, Student, Total):-
    graded_course(Id, Student, Grade),
    course(Id,_, G),
    plus(Id, 1, Res),
    ((not(Grade = 'f'), plus(Total, G, X));
    (true, X = Total)),
    (X > 20; Res =< 5),
    check_grades(Res, Student,X).

degree(Student) :-
    check_grades(1, Student,0).

