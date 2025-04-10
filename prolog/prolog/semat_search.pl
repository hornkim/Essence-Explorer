:- module(semat_search, [
    do_setCheck/2, 
    do_getCheck/2, 
    search_for_text/2
    ]).

:- use_module(project_dbms).

%% Data Base

do_setCheck(JSONin, _{status:"OK"}) :-
    JSONin.action = check,
    add_project_check(JSONin.name, JSONin.index, JSONin.elementID, JSONin.detailID).
do_setCheck(JSONin,_{status:"OK"}) :-
    JSONin.action = uncheck,
    remove_project_check(JSONin.name, JSONin.index, JSONin.elementID, JSONin.detailID).
do_setCheck(_, _{status:"Error"}).

do_getCheck(JSONin, _{action:"check"}) :-
    project_check(JSONin.name, JSONin.index, JSONin.elementID, JSONin.detailID).
do_getCheck(_, _, _, _, _{action:"uncheck"}).

%
% Search for element, where Text = lower case Name
% get ID, Concern, Name
%
search_for_text(Query, JSONout):-
    string_lower(Query, Name),
    search_text(Name, ID, Type, Concern),
    JSONout = _{id:ID, concern:Concern, type:Type}. 

search_text(Text, ID, alpha, Concern) :-
   alpha(ID, name, Name),
   concern_text(alpha, Name, Text, ID, Concern).

search_text(Text, ID, work_product, Concern) :-
    work_product(ID, name, Name),
    concern_text(work_product, Name, Text, ID, Concern).

search_text(Text, ID, activity, Concern) :-
    activity(ID, name, Name),
    concern_text(activity, Name, Text, ID, Concern).

search_text(Text, ID, activity_space, Concern) :-
    activity_space(ID, name, Name),
    concern_text(activity_space, Name, Text, ID, Concern). 

search_text(Text, ID, competency, Concern) :-
    competency(ID, name, Name),
    concern_text(competency, Name, Text, ID, Concern). 

search_text(Text, ID, role, Concern) :-
    role(ID, name, Name),
    concern_text(role, Name, Text, ID, Concern).

search_text(Text, ID, pattern, Concern) :-
    pattern(ID, name, Name),
    concern_text(pattern, Name, Text, ID, Concern).

search_text(_, 99, unknown, unknown).

concern_text(Type, Name, Text, ID, Concern) :-
    string_lower(Name, Text),
    concern_element(Type, _, Concern, ID).   
