subtree(X,X).

subtree(X,tree(_,Left,Right)) :-
    subtree(X,Left);
    subtree(X,Right).
