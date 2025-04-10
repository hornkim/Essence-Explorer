%
%
% swipl Semat-server.pl
% server(8000).
%
%  http://localhost:8000
%
%
:- use_module(library(http/http_server)).
:- use_module(library(http/http_files)).
:- use_module(library(http/http_json)).
:- use_module(library(http/http_log)).
:- use_module(project_dbms).
:- use_module(jsonhandler).
:- use_module(semat_core).
:- use_module(semat_search).
:- use_module(new_elements).

:- [defaults, check, translate].
:- [projects/kim_project].
:- [practices/kernel, practices/user_story, practices/scrum, practices/architecture, practices/enterprise_arch, practices/ddd, practices/microservice, practices/tdd, practices/nfrs].

%
% serve web pages
%
:- http_handler(root(.), http_reply_from_files('.', []), [prefix]).

%
% URL handlers.
%
:- http_handler(root(api/allElements/X), handle_request_allElements(X), []).                        % GET
:- http_handler(root(api/allElements/X/concern/Y), handle_request_concern(X,Y), []).                % GET
:- http_handler(root(api/element/X), handle_request_element(X), []).                                % GET
:- http_handler(root(api/element/X/detail/Y/project/Z), handle_request_element_detail(X,Y,Z), []).  % GET 
:- http_handler(root(api/associations/X), handle_request_getElementAssocs(X), []).                  % GET
:- http_handler(root(api/activitesInSpace/X), handle_request_getActivitiesInSpace(X), []).          % GET
:- http_handler(root(api/search/X), handle_request_searchElement(X), []).                           % GET

:- http_handler('/api/setCheck', handle_request_setCheck, []).                                      % POST
:- http_handler('/api/getCheck', handle_request_getCheck, []).                                      % POST
:- http_handler('/api/addProject', handle_request_addProject, []).                                  % POST
:- http_handler('/api/getProjects', handle_request_getProjects, []).                                % POST

:- http_handler('/api/addElement', handle_request_addElement, []).                                 % POST

% Get Concern Elements - use the parameter 'pts' to specify practices
% no parameters mean all practices
% api/allElements/alpha/concern/customer
% api/allElements/activity_space/concern/customer
% api/allElements/alpha/concern/endeavour
% api/allElements/alpha/concern/customer?pts=architecture&pts=scrum
handle_request_concern(ID, Concern, Request) :-
    http_parameters(Request,
        [pts(Practices, [list(atom)])]),
    rest_handler(get_concern_elements, ID, Concern, Practices).

%
% Get all elements
% api/allElements/alpha
% api/allElements/pattern
% api/allElements/competency
% api/allElements/work_product
handle_request_allElements(ID,_) :-
    rest_handler(get_all_elements, ID).


% Get An Element 
% api/element/requirements
% api/element/analysis
% api/element/scrum
handle_request_element(ID,_) :-
    rest_handler(get_element, ID).

%
% Get an elements details (alpha states, work products, competency)
%  api/element/requirements/detail/conceived/project/default
%  api/element/requirements/detail/conceived/project/kim
%  api/element/product_backlog/detail/goal_set/project/default
%  api/element/story_card/detail/expressed/project/default
%  api/element/analysis/detail/adapts/project/default
handle_request_element_detail(ID, Detail, Project, _):-
    rest_handler(get_element_detail, ID, Detail, Project).

%
% get the activities in a space 
handle_request_getActivitiesInSpace(ID,_) :-
    rest_handler(getActivitiesInSpace, ID).

%
% get the associations 
handle_request_getElementAssocs(ID,_) :-	    
   rest_handler(get_element_assocs, ID). 

%
% do a search for Element Text
handle_request_searchElement(Text,_) :-	
    rest_handler(search_for_text, Text).


% project database Check Box
% {"index": 1, "elementID" : "opportunity", "detailID" : "identified", "action":"check"}
% action is [check, uncheck]
handle_request_setCheck(Request) :-	
    json_handler(do_setCheck, Request).

handle_request_getCheck(Request) :-	
    json_handler(do_getCheck, Request).

handle_request_addProject(Request) :-	
    http_read_json_dict(Request, _{name:Name}, [value_string_as(atom)]),
    add_project(Name),
    reply_json(_{status:"OK"}).

handle_request_getProjects(_) :-	
    findall(X,project(X), List),
    reply_json(_{projects:List}).

handle_request_addElement(Request) :-	
    json_handler(add_element, Request).
    
%
% Start the server on load
%
server(Port) :-
    http_server(http_dispatch, [port(Port)]).

:- initialization(server(8000)).
