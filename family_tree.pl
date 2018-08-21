male(brian).
male(kevin).
male(zhane).
male(fred).
male(jake).
male(bob).
male(stephen).
male(tom).
male(paul).

female(melissa).
female(jennifer).
female(mary).
female(sarah).
female(jane).
female(emily).

parent(melissa,brian).
parent(mary,sarah).
parent(stephen,jennifer).
parent(bob,jane).
parent(paul,kevin).
parent(tom,mary).
parent(jake,bob).
parent(zhane,melissa).
parent(tom,stephen).
parent(stephen,paul).
parent(emily,bob).
parent(tom, zhane).

brother(X, Y) :- male(X), parent(Z, X), parent(Z, Y), X \= Y.
sister(X, Y) :- female(X), parent(Z, X), parent(Z, Y), X \= Y.
aunt(X, Y) :- sister(X, Z), parent(Z, Y).
uncle(X, Y) :- brother(X, Z), parent(Z, Y).

grandmother(X, Y) :- parent(X, Z), parent(Z, Y), \+ male(X).

grandfather(X, Y) :- male(X), parent(X, Z), parent(Z, Y).