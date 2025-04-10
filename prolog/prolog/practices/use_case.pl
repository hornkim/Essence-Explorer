 
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


practice(use_case_practice, name, "Use Case").

concern_element(alpha, use_case_practice, solution, use_case).

%
% Use Case Alpha
%
alpha(use_case, name, "Use Case").
alpha(use_case, description, ["A Use Case is a requirements modeling technique that Captures a dialogue, as a sequence of messages, between a system and its environment, actors, to complete a function."]).
alpha(use_case, points, "They" items ["Defines a sequence of actions a system performs in responce to an actor",
	"Use case are specified, use cases are designed, and at the end use cases are the source from which the testers construct test cases",
	"Yields a result of meaningful value to an actor; achieves a goal; the Walk Up and Away Test",
	"Includes at least one active actor",
	"Made up of a main happy flow and alternate flows",
	"Provides test cases",
	"Encompass a complete chunk of functionality"]).
alpha(use_case, states, [use_case_conceived, use_case_bounded, iuse_case_coherent, use_case_acceptable, use_case_addressed, use_case_fulfilled]).








