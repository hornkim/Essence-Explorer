:- op(500,xfx,'at_level').
:- op(500,xfx,'to_state').
:- op(500,xfx,'to_detail').
:- op(550,xfx,'or').
:- op(500,fx,'to_achieve').
:- op(500,fx,'contributes_to').
:- op(600,xfx,'items').


% 
% check  Alpha
% 
%   

check_all() :-
   check_alphas() ,
   check_wps(),
   check_activities().


check_alphas() :-
    writeln("-----------------  Check Alphas -----------------  "),
    findall(X,alpha(X,name,_),List),
    writeln(List),
    maplist(check_alpha,List).

check_alpha(ID) :-  
    writeln(ID),
    has_points(ID),
    has_states(ID),
    has_alpha_concern(ID).

has_points(ID) :-
    alpha(ID, points, _ items L),
    check_size(L,"Alpha Points").
has_points(ID) :-
    write("**   Points Error: "),
    writeln(ID).
    
has_states(ID) :-
    alpha(ID, states, List1), 
    check_size(List1,"Alpha States"),
    writeln(List1),
    findall(X,state(ID,X,_),List2),
    writeln(List2),
    List1 = List2.
has_states(ID) :-
    write("**   States Error: "),
    writeln(ID).

has_alpha_concern(ID) :-
    concern_element(alpha,_,_, ID).
has_alpha_concern(ID) :-
    write("**    Concern Missing for: "),
    writeln(ID).


% 
% check Work product
% 
%       

check_wps() :-
    writeln("-----------------   Check WPs -----------------  "),
    findall(X,work_product(X,_,_,_),List),
    writeln(List),
    maplist(check_wp,List).

check_wp(ID) :-  
    writeln(ID),
    has_details(ID),
    has_work_product_concern(ID).
    
has_details(ID) :-
    work_product_list(ID, List1), 
    check_size(List1,"WP Details"),
    writeln(List1),
    findall(X,work_product_detail(ID,X,_,_,_,_),List2),
    writeln(List2),
    List1 = List2.
has_details(ID) :-
    write("**   Detail Error: "),
    writeln(ID).

has_work_product_concern(ID) :-
    concern_element(work_product,_,_, ID).
has_work_product_concern(ID) :-
    write("**    Concern Missing for: "),
    writeln(ID).




% 
% check  Activities
% 
%       

check_activities() :-
    writeln("-----------------  Check Activity ------------- "),
    findall(X,activity(X,_,_),List),
    writeln(List),
    maplist(check_activity,List).

check_activity(ID) :-  
    writeln(ID),
    has_entry(ID),
    has_patterns(ID),
    has_roles(ID),
    has_association(ID),
    has_actions(ID),
    has_activity_concern(ID).

has_entry(ID) :-
    activity_entry(ID, L),
    check_size(L,"Activity Entry").
has_entry(ID) :-
    write("**   Entry Error: "),
    writeln(ID).

has_patterns(ID) :-
    activity_patterns(ID, L),
    check_size(L,"Patterns").
has_patterns(ID) :-
    write("**   Patterns Error: "),
    writeln(ID).

has_roles(ID) :-
    activity_roles(ID, L),
    check_size(L,"Roles").
has_roles(ID) :-
    write("**   Roles Error: "),
    writeln(ID).

has_association(ID) :-
    activity_entry(ID, _).
has_association(ID) :-
    write("**   Associations Error: "),
    writeln(ID).
    
has_actions(ID) :-
    findall(X,action(ID,_,X,_),List),
    check_size(List,"Actions").
%    writeln(List).

has_activity_concern(ID) :-
    concern_element(activity,_,_, ID).
has_activity_concern(ID) :-
    write("**    Concern Missing for: "),
    writeln(ID).


% Utility

check_size(L, S) :-
    length(L,0),
    write("**   Length 0  Warning : "),
    writeln(S).
check_size(_,_).
    