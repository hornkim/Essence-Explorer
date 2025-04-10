:- multifile alpha/3.
:- multifile state/3.
:- multifile alpha_containment/2.
:- multifile association/3.
:- multifile role/3.
:- multifile activity/3.
:- multifile action/4.
:- multifile work_product/3.
:- multifile work_product_check/3.
:- multifile concern_element/4.
:- multifile practice/3.
:- multifile pattern/3.
:- multifile competency/3.
:- multifile competency_level/3.

:- discontiguous alpha/3.
:- discontiguous state/3.
:- discontiguous association/3.
:- discontiguous role/3.
:- discontiguous activity/3.
:- discontiguous action/4.
:- discontiguous work_product/3.
:- discontiguous work_product_check/3.
:- discontiguous competency/3.
:- discontiguous competency_level/3.

:- op(500,xfx,'at_level').
:- op(600,xfx,'items').
:- op(500,xfx,'to_state').
:- op(500,xfx,'to_detail').
:- op(550,xfx,'or').
:- op(600,fx,'to_achieve').
:- op(600,fx,'contributes_to').


%
% Concern Map
%

practice(nfrs, name, "Non Functional Requirements").
practice(nfrs, description, ["NFRs are ..."]).

concern_element( alpha, nfrs, solution, nf_requirement).
concern_element(alpha, nfrs, solution, nf_scenario).

%
% User Story Alpha
%

alpha(nf_requirement, name, "Non Functional Requirement").
alpha(nf_requirement, description, ["Non Functional Requirements......"]). 
alpha(nf_requirement, points, []).
alpha(nf_requirement, states, [candidate_nfr, ready_to_implement_nfr, accepted_nfr, available_for_use_nfr ]).
alpha(nf_requirement, is_a, requirements).

state(candidate_nfr, alpha, nf_requirement).
state(candidate_nfr, name, "Candidate NFR").
state(candidate_nfr, description, ["The NFR has been identified as potentially valuable. This may be nothing more than a name or it could have quite a lot of detail but not yet be sufficient to progress to the next state."]).
state(candidate_nfr, checks, ["Story is associated with a User or Persona", "Story describes the user need","The value added by the story is clear"]).

state(ready_to_implement_nfr, alpha, nf_requirement).
state(ready_to_implement_nfr, name, "NFR Ready To Implement").
state(ready_to_implement_nfr, description, ["Once work begins on an NFR, it must be able to progress through to being a candidate for release without interruption. We call this flow.","Before commiting to start work on a story, the team must make sure that nothing will stop the story being completed. When this is true, the story is Ready to Implement and work can start knowing that the intended value can be"]).
state(ready_to_implement_nfr, checks, ["The story is the right size","The criteria for acceptance are clear", "Test artifects and data are available","The team has everything necessary for them to complete the story","The story is prioritized"]).

state(accepted_nfr, alpha, nf_requirement).
state(accepted_nfr, name, "NFR Accepted").
state(accepted_nfr, description, ["The NFR is accepted as complete by the customer. It may not yet be released for general use, but does not require any additional work for that to happen. Where several small stories are part of a larger feature, the customer may wait until they are all locally accepted before releasing the feature."]).
state(accepted_nfr, checks, ["The Customer (or Customer Team) agrees that the story is complete","The story has been tested and the results are acceptable","The story can deliver the anticipated value","The story can be deployed"]).

state(available_for_use_nfr, alpha, nf_requirement).
state(available_for_use_nfr, name, "NFR Available for Use"). 
state(available_for_use_nfr, description, ["The NFR is included in an operational system or product and can be used by the intended users to achieve the anticipated value"]).
state(available_for_use_nfr, checks, ["All expected users of the system, product or service can obtain the value delivered by the story","There are no caveats or conditions attached to the use of the story","The value of the story is available in the intended environments"]).

%
% NF Scenario
%

alpha(nf_scenario, name, "Non Functional Scenario").
alpha(nf_scenario, description, ["Non Functional Scenarios capture....."]). 
alpha(nf_scenario, points, []).
alpha(nf_scenario, states, [candidate_scenario, ready_to_imp_scenario, accepted_scenario, available_use_scenario ]).
alpha(nf_scenario, is_a, requirements).


