:- module(new_elements, [add_element/2, list_alphas/0, list_activities/0, list_wps/0]).

:- dynamic concern_element/4.
:- dynamic alpha/3.
:- dynamic state/3.
:- dynamic resource/3.
:- dynamic activity/3.
:- dynamic work_product/3.
:- dynamic work_product_check/3.

:- op(500,xfx,'at_level').
:- op(600,xfx,'items').
:- op(500,xfx,'to_state').
:- op(500,xfx,'to_detail').
:- op(550,xfx,'or').
:- op(600,fx,'to_achieve').
:- op(600,fx,'contributes_to').


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     Add Elements
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
add_element(JSONIn, _{status:"list_alphas"}) :-
    JSONIn.type == alpha,
    format(user_output,"Create ALPHA (list_alphas): ~p~n",[JSONIn]),
    assertz(concern_element(alpha, JSONIn.practice,  JSONIn.concern, JSONIn.id)), 
    assertz(alpha(JSONIn.id, name, JSONIn.name)),
    atomics_to_string([JSONIn.description], Description),
    assertz(alpha(JSONIn.id, description, [Description])),
    assertz(alpha(JSONIn.id, detail, JSONIn.detailIDs)),
    make_resource(alpha, JSONIn.id, JSONIn.practice, JSONIn.concern),
    assertz(alpha(JSONIn.id, states, JSONIn.detailIDs)),
    maplist(add_state(JSONIn.id),JSONIn.detail, JSONIn.detailIDs).

add_element(JSONIn, _{status:"list_activities"}) :-
    JSONIn.type == activity,
    format(user_output,"Create Activity (list_activities) : ~p~n",[JSONIn]),
    assertz(concern_element(activity, JSONIn.practice,  JSONIn.concern, JSONIn.id)), 
    assertz(activity(JSONIn.id, name, JSONIn.name)),
    atomics_to_string([JSONIn.description], Description),
    assertz(activity(JSONIn.id, description, [Description])),
    assertz(activity(JSONIn.id, part_of, JSONIn.parentID)),
    assertz(activity(JSONIn.id, competencies, [])),
    assertz(activity(JSONIn.id, entry, [])),
    assertz(activity(JSONIn.id, roles, [])),
    assertz(activity(JSONIn.id, patterns, [])),
    assertz(action(JSONIn.id, mandatory, update, contributes_to add_alpha to_state add_state)),
    make_resource(activity, JSONIn.id, JSONIn.practice, JSONIn.concern).

add_element(JSONIn, _{status:"list_wps"}) :-
    JSONIn.type == work_product,
    format(user_output,"Create WorkProduct (list_wps) : ~p~n",[JSONIn]),
    assertz(concern_element(work_product, JSONIn.practice,  JSONIn.concern, JSONIn.id)), 
    assertz(work_product(JSONIn.id, name, JSONIn.name)),
    assertz(work_product(JSONIn.id, alpha, JSONIn.alphaID)),
    atomics_to_string([JSONIn.description], Description),
    assertz(work_product(JSONIn.id, description, [Description])),
    assertz(work_product(JSONIn.id, checks, JSONIn.detailIDs)),
    make_resource(work_product, JSONIn.id, JSONIn.practice, JSONIn.concern),
    maplist(add_check(JSONIn.id),JSONIn.detail, JSONIn.detailIDs).

add_state(AlphaID, Name, ID) :-
    assertz(state(ID, alpha, AlphaID)),
    atomics_to_string([Name], StringName),
    assertz(state(ID, name, StringName)),
    assertz(state(ID, description, ["Describe.."])),
    assertz(state(ID, checks, ["List.."])).

add_check(WpID, Name, ID) :-
    assertz(work_product_check(ID, work_product, WpID)),
    atomics_to_string([Name], StringName),
    assertz(work_product_check(ID, name, StringName)),
    assertz(work_product_check(ID, required, optional)),
    assertz(work_product_check(ID, description, ["Describe...."])),
    assertz(work_product_check(ID, checks, ["List...."])).


%%%%%%%%%%%%%%%%%%%%%%
% Make a Resource.
%%%%%%%%%%%%%%%%%%%%%%

make_resource(Type, ID, Practice, Concern) :-
    atomics_to_string([ID, "_detail"], Resource_Name),
    string_to_atom(Resource_Name, Resource),
    Goal =..[Type, ID, resources, [Resource]],
    assertz(Goal),
    assertz(resource(Resource, type, detail)),
    assertz(resource(Resource, name, Resource_Name)),
    atomics_to_string([Resource, ".html"], File),
    assertz(resource(Resource, file, File)),
    assertz(concern_element(resource, Practice, Concern, Resource)).

%%%%%%%%%%%%%%%%%%%%%%
%   LIST THINGS
%%%%%%%%%%%%%%%%%%%%%%
list_wps :-
    listing(concern_element),
    listing(work_product),
    listing(work_product_check),
    listing(resource).
    
list_alphas :-
    listing(concern_element),
    listing(alpha),
    listing(state),

    listing(resource).
        
list_activities :-
    listing(concern_element),
    listing(activity),
    listing(action),
    listing(resource).
    