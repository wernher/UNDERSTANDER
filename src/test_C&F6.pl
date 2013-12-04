max([],A,A).
max([H|T],A,M) :- H > A,max(T,H,M).
max([H|T],A,M) :- H < A,max(T,A,M).
