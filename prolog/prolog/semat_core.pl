:- module(semat_core,[ 
    get_concern_elements/4, 
    get_all_elements/2, 
    get_element/2, 
    get_element_detail/4,  
    get_element_assocs/2, 
    getActivitiesInSpace/2, 
    getState/3, 
    get_attribute/4
    ]). 

:- use_module(library(yall)).
:- use_module(library(apply)).
:- use_module(printList).
%:- use_module(new_elements).

:- op(500,xfx,'at_level').
:- op(600,xfx,'items').
:- op(500,xfx,'to_detail').
:- op(500,xfx,'to_state').
:- op(550,xfx,'or').
:- op(500,fx,'to_achieve').
:- op(500,fx,'contributes_to').

%
% Get All Elements in a Concern, with type ID, e.g alpha, in the list of practices
% api/allElements/alpha/concern/customer?pts=architecture&pts=scrum
% concern_element(alpha, scrum, endeavour, improvement).
%
get_concern_elements(TypeID, Concern, Practices, JSONout) :-
        %printList(Practices),
        maplist(get_concern_practice(TypeID, Concern), Practices, IDListList),
        flatten(IDListList, IDList),
        ids_to_names(IDList, NameList), 
        JSONout = _{ids:IDList, names:NameList}. 

get_concern_practice(TypeID, Concern, Practice, IDList) :-
    findall(X, concern_element(TypeID, Practice, Concern, X), IDList).


%
% Get All Elements of a ID type, e.g. alpha
%  
get_all_elements(ID, JSONout) :-
    Goal =..[ID, X, name, _],
    findall(X, Goal, IDList),
    sort(IDList, SortedList),
    ids_to_names(SortedList, NameList),
    JSONout = _{ids:SortedList, names:NameList}. 

%
% get the elements in a practice 
%
get_element(ID, JSONout) :-
    practice(ID, _, _),
    practice(ID, description, DescList),
    practice(ID, name, Name),
    findall(X, concern_element(_, ID,_, X), ElementIDList),
    ids_to_names(ElementIDList, ElementIDListNames), 
    maplist(element_id_to_concern, ElementIDList, Concern_List), 
    maplist(element_id_to_type, ElementIDList, TypeList), 
    getResources(practice, ID, Resources),
    JSONout = _{name:Name, description:DescList, elementIDs:ElementIDList, elementNames:ElementIDListNames, types:TypeList, concerns:Concern_List, resources:Resources }.

%
% get a speciic Element by ID
%    

get_element(ID, JSONout) :-
    concern_element(alpha, _, Concern, ID),
    alpha(ID, instance_of, Super),
    alpha(ID, name, Title),
    get_attribute(alpha, Super,  name, Name),    
    atomics_to_string([Title, " (", Name,")"], Name_Title),
    get_attribute(alpha, Super, description, Description),
    get_attribute(alpha, Super, points, Prompt items Points),
    get_attribute(alpha, Super, states, StateIDs),
    getResources(alpha, Super, Resources),
    maplist([X,Y]>>state(X,name,Y), StateIDs, NameList),
    get_associations(ID, Assoc_List),
    JSONout = _{id: ID, concern:Concern, parent:Super, title:Name_Title, description:Description, states:StateIDs, names:NameList, prompt:Prompt, points:Points, associations:Assoc_List, resources:Resources}.

get_element(ID, JSONout) :-
    concern_element(alpha, _, Concern, ID),
    get_attribute(alpha, ID, name, Title),    
    get_attribute(alpha, ID, description, Description),
    get_attribute(alpha, ID, points, Prompt items Points),
    get_attribute(alpha, ID, states, StateIDs),
    getResources(alpha, ID, Resources),
    maplist([X,Y]>>state(X,name,Y), StateIDs, NameList),
    get_associations(ID, Assoc_List),
     get_isa(ID, Parent),
    JSONout = _{id: ID, concern:Concern, parent:Parent, title:Title, description:Description, states:StateIDs, names:NameList, prompt:Prompt, points:Points, associations:Assoc_List, resources:Resources}.
    
get_element(ID, JSONout) :-
    concern_element(competency, _, Concern, ID),
    competency(ID, name, Title),   
    competency(ID, description, Description),   
    competency(ID, type, Type),   
    competency_type(Type, levels, Level_List),
    maplist([X,Y]>>competency_level(X, name, Y), Level_List, Name_List),
    JSONout = _{id: ID, concern:Concern, title:Title, description:Description,  levels:Level_List, names:Name_List}.

get_element(ID, JSONout) :-
    concern_element(role,_,Concern, ID),
    role(ID, name, Title),
    role(ID, description, Description),
    role(ID, competencies, Comp_List),
    get_attribute(role, ID, points, Prompt items Points),
    maplist(competency_level_id_to_name, Comp_List, Comp_Names),
    maplist([X,Y]>>(X = Y at_level _), Comp_List, Comp_IDs),
    association_list(ID,Assoc_List),
    JSONout = _{id:ID, concern:Concern, title:Title, description:Description,  prompt:Prompt, points:Points, compids:Comp_IDs, competencies:Comp_Names, associations:Assoc_List }.

get_element(ID, JSONout) :-
    concern_element(activity_space, _,Concern, ID),
    activity_space(ID, name, Title),
    activity_space(ID, description, Description),   
    activity_space(ID, points, Prompt items Points),
    activity_space(ID, input, Inputs_IDs),
    activity_space(ID, entry, Entry),
    activity_space(ID, completion, Completion),
    ids_to_names(Inputs_IDs, Input_Names), 
    maplist(activity_id_to_name_output, Entry, Entry_Names),
    maplist(activity_id_to_name_output, Completion, Completion_Names),
    JSONout = _{id:ID, concern:Concern, title:Title, description:Description,  prompt:Prompt, points:Points,  inputs:Input_Names, entry:Entry_Names, completion:Completion_Names }.

get_element(ID, JSONout) :-
    concern_element(activity,_,Concern, ID),
    activity(ID, name, Title),   
    activity(ID, description, Description),  
    get_attribute(activity, ID, part_of, ActivitySpace),
    element_id_to_name(ActivitySpace, ActivitySpace_Name),
    get_attribute(activity, ID, points, Prompt items Points),
    activity(ID, competencies, Comp_List),
    maplist(competency_level_id_to_name, Comp_List, Comp_Names),
    activity(ID, roles, Role_List),
    ids_to_names(Role_List, Role_Names),
    findall(X, make_action(ID, achieves, X), Achieves_List),
    findall(X, make_action(ID, contributes, X), Contributes_List),
    findall(X, raw_action(ID, X), Action_List),
    activity(ID, entry, Entry),
    maplist(activity_id_to_name_output, Entry, Entry_Names),
    activity_association_list(ID,Assoc_List),
    findall(X, activity_action(ID,_,_,_,X,_,_,_),Links_List),
    ids_to_names(Links_List, Links_Names), 
    ids_to_types(Links_List, Types), 
    JSONout = _{id:ID, concern:Concern, title:Title, description:Description, activityspace: ActivitySpace_Name, activityspaceid: ActivitySpace, prompt:Prompt, points:Points, achieves:Achieves_List, contributes:Contributes_List,  competencies:Comp_Names,roles:Role_Names, entry:Entry_Names, associations:Assoc_List, links:Links_List, names:Links_Names, types:Types, actions:Action_List}.


get_element(ID, JSONout) :-
    concern_element(work_product,_,Concern, ID),
    work_product(ID, instance_of, Super),
    work_product(ID, name, Title),
    get_attribute(work_product, Super, name, Name ),
    atomics_to_string([Title, " (", Name,")"], Name_Title),
    get_attribute(work_product, Super, description, Description),
    get_attribute(work_product, Super, alpha, AlphaID),
    get_attribute(work_product, Super, checks, CheckIDs),
    getResources(work_product, Super, Resources),
    get_attribute(work_product, Super, points, Prompt items Points),
    alpha(AlphaID, name, AlphaName),
    maplist([X,Y]>>work_product_check(X,name,Y), CheckIDs, CheckList), 
    JSONout = _{id:ID, concern:Concern, title:Name_Title, description:Description, alpha:AlphaName, prompt:Prompt, points:Points, details:CheckIDs, names:CheckList, resources:Resources}.

get_element(ID, JSONout) :-
    concern_element(work_product,_,Concern, ID),
    get_attribute(work_product, ID, name, Title ),
    get_attribute(work_product, ID, description, Description),
    get_attribute(work_product, ID, alpha, AlphaID),
    get_attribute(work_product, ID, checks, CheckIDs),
    getResources(work_product, ID, Resources),
    get_attribute(work_product, ID, points, Prompt items Points),
    alpha(AlphaID, name, AlphaName),
    maplist([X,Y]>>work_product_check(X,name,Y), CheckIDs, CheckList), 
    JSONout = _{id:ID, concern:Concern, title:Title, description:Description,  alpha:AlphaName, prompt:Prompt, points:Points, details:CheckIDs, names:CheckList, resources:Resources}.

get_element(ID, JSONout) :-
    concern_element(pattern,_,Concern, ID),
    pattern(ID, name, Title),
    pattern(ID, type, Type),
    pattern(ID, description, Description),
    getResources(pattern, ID, Resources),
    association_list(ID,Assoc_List),
    JSONout = _{id:ID, concern:Concern, title:Title, description:Description, type:Type,  associations:Assoc_List, resources:Resources }.

get_element(ID, JSONout) :-
    concern_element(resource,Practice, Concern, ID),
    resource(ID, name, Title),
    resource(ID, type, Type),
    resource(ID, file, File),
    JSONout = _{id:ID, concern:Concern, title:Title, practice:Practice, file:File, type:Type}.

get_element_detail(ID, Detail, Project, JSONout) :-
    get_detail(ID, Detail, Project, JSONout).

% get an Alphas states
get_detail(ID, State, Project, JSONout) :-
    state(State, alpha, ID),
    state(State, name, Name),
    get_attribute(state, State, description, Description), 
    getState(State, Name, CheckPoints),
    alpha(ID, name, Title),
    concern_element(alpha,_, Concern, ID),
    findall(X, project_check(Project, X,ID,State),Checked),
    JSONout = _{id:ID, detailID: State, title:Title, state:Name, concern:Concern, description:Description, checks:CheckPoints, checked:Checked}.
get_detail(ID, State, Project, JSONout) :-
    alpha(ID, instance_of, Parent), 
    get_element_detail(Parent, State, Project, JSONout).
get_detail(ID, State, Project, JSONout) :-
    alpha(ID, is_a, Parent), 
    get_element_detail(Parent, State, Project, JSONout).

% get a Work product Detail
get_detail(ID, Detail, Project, JSONout) :-
    work_product(ID, name, Title),
    work_product_check(Detail, work_product, ID),
    work_product_check(Detail, name, Name),
    work_product_check(Detail, required, Required),
    get_attribute(work_product_check, Detail, description, Description), 
    work_product_check(Detail, checks, CheckPoints),
    get_attribute(work_product_check, Detail, points, Prompt items Points),
    concern_element(work_product, _, Concern, ID),
    findall(X, project_check(Project, X,ID,Detail),Checked),
    JSONout = _{id:ID, detailID:Detail, title:Title, concern:Concern, detail:Name, mandatory:Required, description:Description, prompt:Prompt, points:Points, checks:CheckPoints, checked:Checked}.
get_detail(ID, Detail, Project, JSONout) :-
    work_product(ID, instance_of, Parent), 
    get_element_detail(Parent, Detail, Project, JSONout).
get_detail(ID, Detail, Project, JSONout) :-
    work_product(ID, is_a, Parent), 
    get_element_detail(Parent, Detail, Project, JSONout).

% get a Competency Level Detail
get_detail(ID, Detail, _, JSONout) :-
    competency(ID, type, Type),
    competency_type(Type, description, TypeDescription),
    competency_level(Detail, name, Name),
    competency_level(Detail, description, LevelDescription),
    JSONout = _{id:ID, typeDescription:TypeDescription, name:Name, levelDescription:LevelDescription}.

%
% get associations array for an ID to draw canvas
% Bit of a HACK for alpha only --> get_alpha_isa
% alpha(user_story, is_a, requirements).
%
get_element_assocs(ID, JSONout) :-
    alpha(ID, instance_of, Super),
    find_assocs_raw(ID, Assoc_List),
    JSONout = _{id: ID, instance:Super,  associations:Assoc_List}.

get_element_assocs(ID, JSONout) :-
    find_assocs_raw(ID, Assoc_List_In),
    get_alpha_isa(ID, Assoc_List_In, Assoc_List_Out),
    JSONout = _{id: ID,  associations:Assoc_List_Out}.

get_alpha_isa(ID, JSONin, JSONout ) :-
    alpha(ID, is_a, ParentID),
    concern_element(Type, _, Concern, ParentID),
    get_attribute(Type, ParentID, name, Title),   
    Item = _{id: ParentID, title:Title, concern:Concern, type:Type, association:"is a"},
    append(JSONin, [Item], JSONout).
get_alpha_isa(_, JSONin, JSONin ).

   
find_assocs_raw(ID, AssocList) :-
    findall(X:Desc, association(Desc, ID, X),ID_List1),
    findall(Y:Desc, association(Desc, Y, ID),ID_List2),
    maplist(get_assoc_element(ID), ID_List1, AssocList1),    
    maplist(get_assoc_element(ID), ID_List2, AssocList2),    
    append(AssocList1, AssocList2, AssocList).

get_assoc_element(ID, Target:Desc, JSONout) :-
    association(Desc, ID, Target),
    concern_element(Type, _, Concern, Target),
    get_attribute(Type, Target, name, Title),    
    JSONout = _{id: Target, title:Title, concern:Concern, type:Type, association:Desc, direction: ">"}.

get_assoc_element(ID, Target:Desc, JSONout) :-
    association(Desc, Target, ID),
    concern_element(Type, _, Concern, Target),
    get_attribute(Type, Target, name, Title),    
    JSONout = _{id: Target, title:Title, concern:Concern, type:Type, association:Desc, direction: "<"}.

% Activities in an Activity Space
%
getActivitiesInSpace(ID, JSONout):-
    findall(X, activity(X, part_of, ID), ActivityList),
    sort(ActivityList, SortedList),
    maplist(element_id_to_name, SortedList, NameList), 
    concern_element(activity_space, _,Concern, ID),
    JSONout = _{activityIDs:SortedList, names:NameList, concern:Concern}.

%
% Get an elements resources
% The Type and File
%
getResources(Type, ID, JSONout) :-
    get_attribute(Type, ID, resources, Items),
    maplist(get_resource, Items, JSONout). 
getResources(_, _, _{type:"", file:""}). 

get_resource(Item, JSONout) :-
    resource(Item, type, RType),
    resource(Item, file, File), 
    JSONout = _{type:RType, file:File}. 


%
% Get an Object (of Type)  Attribute value - if missing try to inherit
% Some objects may have no attribute specified and retun an empty result
% 
get_attribute(Type, ID, Name, Value) :-
    Goal =..[Type, ID, Name, Value],
    Goal.
get_attribute(Type, ID, Name, Value) :-
    Goal =..[Type, ID, is_a, Super],
    Goal,
    get_attribute(Type, Super, Name, Value). 
get_attribute(work_product, _, artefact, "").
get_attribute(_, _, detail, "").
get_attribute(_, _, points,"_" items []).
get_attribute(_, _, description,[]).

get_associations(ID, AssocList) :-    
    association_list(ID, AssocList).
get_associations(ID, AssocList) :-   
    alpha(ID, is_a, Super),
    association_list(Super, AssocList).

get_isa(ID, ParentName) :-
    alpha(ID, is_a, ParentID),
    alpha(ParentID, name, ParentName).
get_isa(_,unknown).

% a check is not provided so make it from Name.
getState(State, _, CheckPoints) :-
    state(State, checks, CheckPoints).
getState(_, Name, [CheckPoints]) :-
    atomics_to_string(["The ", Name], State_Name),
    atomics_to_string([State_Name, " state is achieved"], CheckPoints). 

%
% association(opportunity, requirements, "Opportunity focuses Requirements").
%     Requirements - Opportunity focuses Requirements
% association("Drives Relentless", scrum_master, improvement).
% association("Added To", improvement, sprint_backlog).
% association("Includes", sprint_backlog, improvement).
% association("Practice", scrum_team, self_manage). 
%
% some association e.g. Pattterns are reversed and so collect a second
% list to cover those, swapping ID and Target.

association_list(ID, AssocList) :-
    findall(X:Desc, association(Desc, ID, X),ID_List1),
    maplist(assoc_id_to_name(ID), ID_List1, AssocList1),
    findall(Y:Desc, association(Desc, Y, ID),ID_List2),
    maplist(assoc_id_to_name(ID), ID_List2, AssocList2),
    append(AssocList1, AssocList2, AssocList).

% construct the Target Name with Assoc Description
assoc_id_to_name(ID, Target:Desc, Name_Desc) :-
    alpha(Target, name, Name),
    make_name_desc(ID, Target, Desc, Name, Name_Desc).
assoc_id_to_name(ID, Target:Desc, Name_Desc) :-
    role(Target, name, Name),
    make_name_desc(ID, Target, Desc, Name, Name_Desc).
assoc_id_to_name(ID, Target:Desc, Name_Desc) :-
    activity(Target, name,  Name),
    make_name_desc(ID, Target, Desc, Name, Name_Desc).    
assoc_id_to_name(ID, Target:Desc, Name_Desc) :-
    work_product(Target, name, Name),
    make_name_desc(ID, Target, Desc, Name, Name_Desc).    
assoc_id_to_name(ID, Target:Desc, Name_Desc) :-
    pattern(Target, name, Name),
    make_name_desc(ID, Target, Desc, Name, Name_Desc).


make_name_desc(ID, Target, Desc, Name, Name_Desc) :-
    association(Desc, ID, Target),
    atomics_to_string([Desc, " - ", Name], Name_Desc).  
make_name_desc(ID, Target, Desc, Name, Name_Desc) :-
    association(Desc, Target,ID),
    atomics_to_string([Desc, " - ", Name], Name_Desc).  

%        get a list of Activity Associations
% activity_association(part_of, daily_scrum, coordinate_activity).
% activity_association(end_before_start, find_user_story, prepare_user_story ). 
%
activity_association_list(ID,AssocList) :-
    findall(Y:X, activity_association(Y, ID, X), ID_List),
    maplist(activity_assoc_ids_to_string, ID_List, AssocList).

activity_assoc_ids_to_string(Type:Y, Name_Desc) :-
    space_or_activity(Y, Name),
    activity_assoc_name(Type, Type_Name),
    atomics_to_string([Type_Name, ": ", Name], Name_Desc).

space_or_activity(ID, Name) :-
    activity_space(ID, name, Name).
space_or_activity(ID, Name) :-
    activity(ID, name, Name).

activity_assoc_name(part_of, "Part Of").
activity_assoc_name(end_before_start, "End Before Start").
activity_assoc_name(start_before_start, "Start before Start").
activity_assoc_name(start_before_end,"Start Before End").
activity_assoc_name(end_before_end,"End Before End").


%
%  Convert IDs to Names  - when I dont know the element types.
%

ids_to_names(In, Out) :-
    maplist(element_id_to_name, In, Out).

element_id_to_name(ID, Name) :-
    alpha(ID, name, Name).
element_id_to_name(ID, Name) :-
    work_product(ID, name, Name).
element_id_to_name(ID, Name) :-
    role(ID, name, Name).
element_id_to_name(ID, Name) :-
    activity_space(ID, name, Name).  
element_id_to_name(ID, Name) :-
    activity(ID, name, Name).      
element_id_to_name(ID, Name) :-
    competency(ID, name, Name). 
element_id_to_name(ID, Name) :-
    pattern(ID, name, Name).
element_id_to_name(ID, Name) :-
    practice(ID, name, Name).
element_id_to_name(ID, Name) :-
    resource(ID, name, Name).

%
% Get the type or concern of the ID.
%

ids_to_types(In, Out) :-
    maplist(element_id_to_type, In, Out).

element_id_to_concern(ID, Concern) :-
    concern_element(_, _, Concern, ID).

element_id_to_type(ID, Type) :-
    concern_element(Type, _, _, ID).

activity_id_to_name_output(Alpha:State, Value) :-
    alpha(Alpha, name, Name1),
    state(State, alpha, Alpha), 
    state(State, name, Name2),
    atomics_to_string([Name1, "::", Name2], Value).
activity_id_to_name_output(WP:Detail, Value) :-
    work_product(WP, name, Name1),
    work_product_check(Detail, work_product, WP), 
    work_product_check(Detail, name, Name2),
    atomics_to_string([Name1, "::", Name2], Value).

competency_level_id_to_name(Comp at_level Level, Value) :-
    competency(Comp, name, Name),
    atomics_to_string([Name, " = ", Level], Value).


raw_action(ID, JSONout) :-
    activity_action(ID, Operator, Type, How, Element, State, Beyond, Optional),
    element_id_to_name(Element, ElementName),
    get_elements_detail(Type, State, StateName),
    JSONout = _{id:ID,  operator:Operator, type:Type, how:How, element:Element, elementName:ElementName, state:State, stateName:StateName, beyond:Beyond, optional: Optional}.


%
% make_action - Make a Action String from the parts.
% activity_action - Parse an action statement into parts.
% action(prepare_user_story, update, to_achieve user_story to_state ready_to_implement or beyond, mandatory).
%

make_action(ID, How, Value) :-
    activity_action(ID, Action, Type, How, Element, To, Beyond, Mandatory),
    element_id_to_name(Element, ElementName),
    get_elements_detail(Type, To, ToName),
    add_beyond(Beyond, Beyond_Value),
    atomics_to_string([Action, " - ",ElementName, " to: ", ToName, Beyond_Value, " (", Mandatory, ")"], Value).
    

% get the details type from Elemnts type, then the name from ID
get_elements_detail(alpha, ID, Name) :-    
    state(ID, name, Name).
get_elements_detail(work_product, ID, Name) :-
    work_product_check(ID, name, Name).

add_beyond(beyond, " or beyond ").
add_beyond(not_beyond, " ").

activity_action(ID, Operator, Type, How, Element, State, Beyond, Optional) :-
    action(ID, Optional, Operator, Sentence),
    command(Sentence, Type, How, Element, State, Beyond).

command(Sentence, alpha, How, Element, State, Beyond) :-
    achieves(Sentence, How, Rest ),
    find_or(Rest, Beyond, Element to_state State).

command(Sentence, work_product, How, Element, State, Beyond) :-
    achieves(Sentence, How, Rest ),
    find_or(Rest, Beyond, Element to_detail State).

achieves(to_achieve Rest, achieves, Rest ).
achieves(contributes_to Rest, contributes, Rest).

find_or(Rest or beyond, beyond, Rest).
find_or(Rest, not_beyond, Rest).


    
    


