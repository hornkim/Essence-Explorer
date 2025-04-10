:- module(project_dbms,[ 
            add_project_check/4,               
            remove_project_check/4,
            project_check/4,
            add_project/1,
            remove_project/1,
            project/1
        ]).

%% Example test
%% add_project_check(kims, 5,requirement,accepted).
%% add_project_check(H,I,J,K).

:- use_module(library(persistency)).

:- persistent
        project_check(name:atom, checkIndex:integer, elementID:atom, detailID:atom),
        project(name:atom),
        filter(name:atom).

:- db_attach('project.journal', []).

add_project_check(Name, CheckIndex, ElementID, DetailID) :-
        (
                project_check(Name, CheckIndex, ElementID, DetailID), !
        ;
                assert_project_check(Name, CheckIndex, ElementID, DetailID)
        ).

remove_project_check(Name, CheckIndex, ElementID, DetailID) :-
       retractall_project_check(Name, CheckIndex, ElementID, DetailID).


add_project(Name) :-
        (
                project(Name), !
        ;
                assert_project(Name)
        ).

remove_project(Name) :-
        retractall_project(Name).



