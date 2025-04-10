:- multifile alpha/3.
:- multifile state/3.
:- multifile association/3.
:- multifile concern_element/4.
:- multifile practice/3.
:- multifile competency/3.
:- multifile competency_level/3.
:- multifile competency_type/3.

:- discontiguous alpha/3.
:- discontiguous state/3.
:- discontiguous association/3.
:- discontiguous activity_space/3.
:- discontiguous concern_element/4.
:- discontiguous competency/3.
:- discontiguous competency_level/3.
:- discontiguous competency_type/3.


% Microserice Design Practice

:- op(500,xfx,'at_level').
:- op(600,xfx,'items').
:- op(500,xfx,'to_state').
:- op(500,xfx,'to_detail').
:- op(550,xfx,'or').
:- op(600,fx,'to_achieve').
:- op(600,fx,'contributes_to').

practice(microservice_prac, name, "Microservices").
concern_element(alpha, microservice_prac, solution, microservice).
concern_element(alpha, microservice_prac, solution, ddd).

%
% Microservice Alpha
%
alpha(microservice, name, "Microservice").
alpha(microservice, description, ["A Microservice "]).
alpha(microservice, points, "Features" items ["Good ", ""]).
alpha(microservice, states, [ms_foundational, ms_stratified, ms_choreographed, ms_complete]).

state(ms_foundational, alpha, microservice).
state(ms_foundational, name, "Foundational").
state(ms_foundational, description, ["This is about establishing the scope of the microservice"]).
state(ms_foundational, checks, ["Initial requirments understood", "Initial domain model created"]).

state(ms_stratified, alpha, microservice).
state(ms_stratified, name, "Stratified").
state(ms_stratified, description, ["The key artifact of DDD, the bounded context, is formed here which is a potential candidate for a microser- vice."]).
state(ms_stratified, checks, ["The context map is created"]).

state(ms_choreographed, alpha, microservice).
state(ms_choreographed, name, "Choreographed").
state(ms_choreographed, description, ["The context map is created that establishes the communication path between the bounded contexts, and their teams"]).
state(ms_choreographed, checks, ["xxxx"]).

state(ms_complete, alpha, microservice).
state(ms_complete, name, "Completed").
state(ms_complete, description, ["Following the iterative process of analysis/design to implementation, models are implemented and tested as specific parts of the application get developed and new features are addressed in successive cycles."]).
state(ms_complete, checks, ["xxxx"]).


