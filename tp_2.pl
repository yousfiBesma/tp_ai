member(X,[X|_]).
member(X,[_|Tail]):-member(X,Tail).
first(X,[X|_]).
last([E],E).
last([_|Tail],E):- last(Tail,E).
penultimate([E, _], E).
penultimate([_|Tail], E) :- penultimate(Tail, E).
del_k(X,[X|Tail],1,Tail).
del_k(X,[Head|Tail],K,[Head|R]):- K>1,
                            K1 is K-1,
                            del_k(X,Tail,K1,R).
length_B([], 0).
length_B([_|Tail],N):-
length_B(Tail,N1),
N is N1+1.

even(L):-
        length_B(L,N),
        N mod 2 =:= 0.

concatination([],L,L).
concatination([Head|Tail],L,[Head|R]):-
                                concatination(Tail,L,R).
reverse_B([],[]).
reverse_B([Head|Tail], R):-
        reverse_B(Tail,RT),
        concatination(RT,[Head],R).

palindrome(L):-reverse_B(L,L).
%?- member(a,[f,h,k,r,a,i]).
%?- member(s,[a,e,y,i,o]).
%?- last([a,f,h,t,u,b],A).
%?- length_B([1, 2, 3, 4], N).
%?- reverse_B([1, 2, 3, 4], R).
%?- penultimate([1, 2, 3, 4], E).
%?- even([1, 2, 3, 4]).
%?- palindrome([1, 2, 3, 2, 1]).
%?- concatination([1, 2], [3, 4], L).
%?- even([1, 2, 3]).
%?- even([1, 2, 3, 4]).
%?- del_k(X, [1, 2, 3, 4, 5], 3, L).
