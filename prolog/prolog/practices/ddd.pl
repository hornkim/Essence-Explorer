 
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

% Domain Driven Design Practice

:- op(500,xfx,'at_level').
:- op(600,xfx,'items').
:- op(500,xfx,'to_state').
:- op(500,xfx,'to_detail').
:- op(550,xfx,'or').
:- op(600,fx,'to_achieve').
:- op(600,fx,'contributes_to').


practice(dd_design, name, "Domain Driven Design").
practice(dd_design, description, ["DDD is"]).
concern_element(alpha, dd_design, solution, ddd).

%
% Domain Model Alpha
%
alpha(ddd, name, "Domain Model").
alpha(ddd, description, ["A Domain Model contains everything necessary to understand the domain.  A ubiquitous language is established, acting as the cross-team language. The creation of the domain model is strongly influenced by exploration and experimentation"]).
alpha(ddd, points, "Features" items ["Good ", ""]).
alpha(ddd, states, [ddd_initiated, ddd_foundational, ddd_implementable, ddd_evolved]).

state(ddd_initiated, alpha, ddd).
state(ddd_initiated, name, "Domain Model Initiated").
state(ddd_initiated, description, ["This is about creating an initial domain model"]).
state(ddd_initiated, checks, ["Initial requirments understood", "Initial domain model created"]).

state(ddd_foundational, alpha, ddd).
state(ddd_foundational, name, "Domain Model Foundational").
state(ddd_foundational, description, ["The domain model is made clear and aligns with other requirements."]). 
state(ddd_foundational, checks, ["Domain model aligned with functional requirements", "Team structure and design understood"]).

state(ddd_implementable, alpha, ddd).
state(ddd_implementable, name, "Domain Model Implementable").
state(ddd_implementable, description, ["Here a context map is developed as the domain model gets refined further. Teams are instantiated as owners of sub domains"]). 
state(ddd_implementable, checks, ["The context map is established", "The teams are structure base don the domain mdoel", "The context map show the team dependencies"]).

state(ddd_evolved, alpha, ddd).
state(ddd_evolved, name, "Domain Model Evolved").
state(ddd_evolved, description, ["In iterative development, implementation of the models take place along with testing as specific parts of the application are developed."]). 
state(ddd_evolved, checks, [""]).
