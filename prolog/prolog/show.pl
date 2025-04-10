
%
% Show All Alpha Names
%
%

show_all_alphas() :-
    findall(X, alpha(X,_,_),L),
    writeln(L).

%
% Show Alphas States List
%
%

show_alpha(Pattern) :-
    alpha(Pattern, Heading, Definition),
    writeln(Heading),
    writeln(Definition),
    alpha_points(Pattern, List), 
    maplist(prepend_dash, List),
    alpha_states(Pattern, States),
    show_states(Pattern, States).

show_states(Pattern, States) :-
    append(IDList, [Last], States),
    maplist(state_id_to_name(Pattern), IDList, NameList), 
    maplist(show_state, NameList),
    show_last_state(Pattern, Last).

show_state(Name) :-
    write(Name),
    write(' -> ').

show_last_state(Pattern, Item ) :- 
    state(Pattern, Item, Name, _,_),
    write(Name).


%
% Show Alphas State Check List
%

show_alpha_state(Pattern, State) :-
    state(Pattern, State, Name, _, CheckPoints),
    alpha(Pattern, Title, _),
    writeln(Title),
    atomics_to_string(["- ", Name, " -"], S2),
    writeln(S2),
    maplist(prepend_star, CheckPoints).


prepend_dash(Text) :-
    write(' - '),
    writeln(Text).

prepend_star(Text) :-
    write(' * '),
    writeln(Text).

