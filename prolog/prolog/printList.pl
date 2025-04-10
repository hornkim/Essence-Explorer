% Print a list of stuff

:- module(printList,[printList/1]). 

printElement(L/C) :- format(user_output,'~0+~t~a - ~a~t~20+|', [L, C]).  
printElement(L) :- format(user_output,'~0+~t~a~t~20+|', L).              

printList([]) :- format(user_output,'~n',[]).  

printList([H|T]) :-
    printElement(H),
    printList(T).

printLists([], _).
printLists([H|T], N) :-
    M is N + 1,
    format(user_output,'~d- |', M),
    printList(H),
    printLists(T, M).