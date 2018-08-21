remove_item(_, [], []) :- !.
remove_item(I, [I | Xs], O) :- !, remove_item(I, Xs, O).
remove_item(I, [X | Xs], [X | Os]) :- !, remove_item(I, Xs, Os).

remove_items(_, [], []) :- !.
remove_items(I, [X | Xs], O) :- member(X, I), !, remove_items(I, Xs, O).
remove_items(I, [X | Xs], [X | Os]) :-  remove_items(I, Xs, Os).


intersection([], _, []) :- !.
intersection([X | Xs], Y, F) :- member(X, Y), remove_item(X, Xs, Xout), !, F = [X | Fs], intersection(Xout, Y, Fs).
intersection([_ | Xs], Y, F) :- !, intersection(Xs, Y, F).

union([], L, L) :- !.
union([X | Xs], Y, F) :- member(X, Y), !, remove_item(X, Xs, Xout), !, remove_item(X, Y, Yout), !, F = [X | Fs], union(Xout, Yout, Fs).
union([X | Xs], Y, [X | F]) :- remove_item(X, Xs, Xout), !, union(Xout, Y, F).


is_set([]).
is_set([L | Ls]) :- member(L, Ls), !, fail.
is_set([_ | Ls]) :- is_set(Ls).

remove_dups([], []) :- !.
remove_dups([X | Xs], [X | Ys]) :- remove_item(X, Xs, Z), remove_dups(Z, Ys).

disjunct_union(X, Y, U) :- union(X, Y, Union), intersection(X, Y, Intersection), remove_items(Intersection, Union, U).