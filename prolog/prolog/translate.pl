
module(translate,[translate_alphas()/0, translate_alpha()/1]).

:- op(500,xfx,'at_level').
:- op(600,xfx,'items').
:- op(500,xfx,'to_state').
:- op(500,xfx,'to_detail').
:- op(550,xfx,'or').
:- op(500,fx,'to_achieve').
:- op(500,fx,'contributes_to').

% pipe to file from command line
% swipl -f prolog/semat_server.pl -g "translate_competency_types" -g halt > comp.txt


% -----------------------------
%   Translate Practice
% -----------------------------
translate_practice(Practice) :-
    translate_alphas(Practice),
    translate_wps(Practice),
    translate_act_spaces(Practice),
    translate_activities(Practice),
    translate_competencies(Practice),
    translate_roles(Practice).

translate_competency_types() :-
    translate_comp_types(). 

% --------------------------------
%        Translate Alpha
% --------------------------------
translate_alphas(Practice) :-
    findall(X,alphaInPractice(X,Practice,_,_),List),
    list_elements(List, Practice, alpha, "Alphas"),
    maplist(translate_alpha,List),
    writeln("").

alphaInPractice(ID,Practice, Name, Concern) :-
    alpha(ID, name, Name),
    concern_element(alpha, Practice, Concern, ID).

translate_alpha(ID) :-  
    translate_name(ID, Name),
    translate_points(ID, Name),
    translate_states(ID, Name),
    translate_associations(ID, Name),
    writeln("").

translate_name(ID, Name) :-
    alphaInPractice(ID, Practice, Name, Concern),
    alpha(ID, description, DescList),
    writeNameDesc(Name, Concern, Practice, "Alpha", DescList),
    writeln("").

translate_points(ID, Name) :-
    get_attribute(alpha, ID, points, Prompt items Points),
    (Prompt = "_";
    atomics_to_string([ Name, " ", Prompt, " include:  "], Text),
    writeln(Text),
    maplist(writePoint,Points),
    writeln("")).

%
% -----------STATES---------- 
%   
translate_states(ID, Name) :-
    alpha(ID, states, List), 
    atomics_to_string([ Name, " goes through the following states: "], Text),
    write(Text),
    maplist(writeState,List),
    writeln("Each of these is described below."),
    maplist(describeState(ID, Name),List).

writeState(Item) :-
    state(Item, name, StateName),
    writeCommas(StateName). 

describeState(ID, Name, Item) :-
    state(Item, alpha, ID),
    state(Item, name, StateName),
    getState(Item, StateName, CheckList),
    atomics_to_string([Name, " state ", StateName, " has these checkpoints: "], Text),
    writeln(Text),
    maplist(writePoint,CheckList),
    writeln("").

% Associations

translate_associations(ID, Name) :-
    get_element_assocs(_{id:ID}, Assoc),
    writeln("The Associations are:"),
    maplist(writeAssoc(Name), Assoc.associations).

writeAssoc(Name, Item) :-
    (( Item.direction = ">",
    atomics_to_string([" - ", Name, " ", Item.association, "  ", Item.title], Text));
    ( Item.direction = "<",
    atomics_to_string([" - ", Item.title, " ", Item.association, "  ", Name], Text))),
    writeln(Text).


% --------------------------------
%      Translate Work Products
% --------------------------------
translate_wps(Practice) :-
    findall(X,wpInPractice(X,Practice,_,_),List),
    list_elements(List, Practice, work_product, "Work Products"),
    maplist(translate_wp,List),
    writeln("").

wpInPractice(ID,Practice, Name, Concern) :-
    work_product(ID,name,Name),
    concern_element(work_product, Practice, Concern, ID).

translate_wp(ID) :-  
    translate_wp_name(ID, Name),
    translate_wp_checks(ID, Name),
    writeln("").

translate_wp_name(ID, Name) :-
    wpInPractice(ID,Practice, Name, Concern),
    work_product(ID, description, DescList),
    writeNameDesc(Name, Concern, Practice, "Work Product", DescList),
    work_product(ID, alpha, Alpha),
    atomics_to_string([ Name, " has the Alpha ",Alpha],Text3),
    writeln(Text3).

translate_wp_checks(ID, Name) :-
    work_product(ID, checks, CheckList),
    atomics_to_string(["The work product ", Name, " has checks:"], Text),
    write(Text),
    maplist(writeCheckLine,CheckList),
    writeln(""),
    maplist(writeCheck(ID),CheckList).

writeCheckLine(CheckID) :-
    work_product_check(CheckID, name, CheckName),
    atomics_to_string([CheckName, ", "], Text),
    write(Text).      

writeCheck(ID, CheckID) :-
    work_product_check(CheckID, work_product, ID),
    work_product_check(CheckID, name, CheckName),
    work_product_check(CheckID, required, Required),
    work_product_check(CheckID, checks, CheckItemsList),
    atomics_to_string([ CheckName, " is a ",Required, " check with items:"],Text),
    writeln(Text),
    maplist(writePoint,CheckItemsList).

% --------------------------------
%      Translate Activity Space
% --------------------------------
translate_act_spaces(Practice) :-
    findall(X,actSpaceInPractice(X,Practice,_,_),List),
    list_elements(List, Practice, activity_space, "Activity Space"),
    maplist(translate_act_space,List),
    writeln("").

actSpaceInPractice(ID,Practice, Name, Concern) :-
    activity_space(ID, name, Name),
    concern_element(activity_space, Practice, Concern, ID).

translate_act_space(ID) :-
    translate_actspace_name(ID, Name),
    translate_actspace_points(ID, Name),
   % translate_act_input(ID, Name),
   % translate_act_entry(ID, Name),
   % translate_act_completion(ID, Name),
    writeln("").

translate_actspace_name(ID, Name) :-
    actSpaceInPractice(ID,Practice, Name, Concern),
    activity_space(ID, description, DescList),
    writeNameDesc(Name, Concern, Practice, "Activity Space", DescList).

translate_actspace_points(ID, Name) :-
    activity_space(ID, points, Prompt items List),
    atomics_to_string([ Name, " ", Prompt, " include:  "], Text),
    writeln(Text),
    maplist(writePoint,List),
    writeln("").

% translate_act_input(ID, Name),
% translate_act_entry(ID, Name),
% translate_act_completion(ID, Name),

% --------------------------------
%      Translate Activities
% --------------------------------
translate_activities(Practice) :-
    findall(X,actInPractice(X,Practice,_,_),List),
    maplist(translate_act,List),
    writeln("").
    
actInPractice(ID,Practice, Name, Concern) :-
    activity(ID,name,Name),
    concern_element(activity, Practice, Concern, ID).

translate_act(ID) :-
    translate_act_name(ID, _Name),
    writeln("").

translate_act_name(ID, Name) :-
    actInPractice(ID,Practice, Name, Concern),
    activity(ID, description, DescList),
    writeNameDesc(Name, Concern, Practice, "Activity", DescList).

% --------------------------------
%      Translate Competencies
% --------------------------------
translate_competencies(Practice) :-
    findall(ID,compInPractice(ID,Practice,_,_),List),
    maplist(translate_comp,List),
    writeln("").
    
compInPractice(ID,Practice, Name, Concern) :-
    competency(ID, name, Name),
    concern_element(competency, Practice, Concern, ID).

translate_comp(ID) :-
    translate_comp_name(ID, _Name),
    writeln("").

translate_comp_name(ID, Name) :-
    compInPractice(ID,Practice, Name, Concern),
    competency(ID, description, DescList),
    writeNameDesc(Name, Concern, Practice, "Competency", DescList).

% --------------------------------
%      Translate Roles
% --------------------------------
translate_roles(Practice) :-
    findall(X,rolesInPractice(X,Practice,_,_),List),
    maplist(translate_role,List),
    writeln("").
    
rolesInPractice(ID,Practice, Name, Concern) :-
    role(ID, name, Name),
    concern_element(role, Practice, Concern, ID).

translate_role(ID) :-
    translate_role_name(ID, _Name),
    writeln("").

translate_role_name(ID, Name) :-
    rolesInPractice(ID,Practice, Name, Concern),
    role(ID, description, DescList),
    writeNameDesc(Name, Concern, Practice, "Role", DescList).


% --------------------------------
%      Translate Competency Type
% --------------------------------
translate_comp_types() :-
    findall(ID,competency_type(ID, description,_),List),
    maplist(translate_comp_type,List),
    writeln("").
    
translate_comp_type(ID) :-
    translate_comp_type_name(ID, Name),
    translate_comp_type_levels(ID, Name),
    writeln("").

translate_comp_type_name(ID, Name) :-
    competency_type(ID, name, Name),
    competency_type(ID, description, DescList),
    atomics_to_string([ Name, " is a competency type"], Text1),
    writeln(Text1),
    atomics_to_string([ Name, " can be described as: "], Text2),
    write(Text2),
    maplist(writeCommas,DescList),
    writeln("").

translate_comp_type_levels(ID, Name) :-
    competency_type(ID, levels, List),
    atomics_to_string([ Name, " has the levels: "], Text1),
    write(Text1),
    maplist(write_name_name,List),
    writeln(""),
    maplist(write_comp_level,List).

write_name_name(ID) :-
    competency_level(ID, name, Name),
    writeCommas(Name).

write_comp_level(ID) :-
    competency_level(ID, name, Name),
    competency_level(ID, description, Desc),
    atomics_to_string([ Name, " description: "], Text), 
    write(Text),
    maplist(writeCommas,Desc),
    writeln("").


%----------------------------
%        Shared Bits 
%----------------------------
writeNameDesc(Name, Concern, Practice, Thing, DescList) :-
    heading(Name),
    atomics_to_string([ Name, " is an ", Thing, " in the practice named '", Practice, "'' for the concern called '", Concern,"'."], Text1),
    writeln(Text1),
    atomics_to_string([ Name, " can be described as: "], Text2),
    write(Text2),
    maplist(writeCommas,DescList).

heading(Name) :-
    writeln(Name),
    writeln("------------------").

writeCommas(Item) :-
    atomics_to_string([Item, ","], Text),
    write(Text).

writePoint(Item) :-
    atomics_to_string(["  - ", Item, ","], Text),
    writeln(Text).   

% List all the elements in a practice
list_elements(List, Practice, Type, TypeName) :-
    (List = [];
    atomics_to_string([ "The ", Practice, " has these ",TypeName,": "],Text),
    write(Text),
    maplist(list_elements(Type), List),
    writeln("")).

list_elements(Type, ID) :-
    Goal =..[Type, ID, name, Name],
    Goal,
    write(Name),
    write(',').




