on(block1, block2).
on(block2, block3).
on(block3, block4).
on(block4, block5).


above(Block1, Block2) :-
    on(Block1,Block2).

above(Block1,Block2) :-
    on(Block1,Block3),
    above(Block3,Block2).
