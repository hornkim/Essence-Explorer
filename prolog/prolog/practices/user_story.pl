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

practice(user_stories, name, "User Story").
practice(user_stories, description, ["User Stories are a way to start a conversation"]).

concern_element(alpha, user_stories, solution, user_story).
concern_element(work_product, user_stories, solution, story_card).
concern_element(work_product, user_stories, solution, test_case).
concern_element(activity, user_stories, solution,find_user_story).
concern_element(activity, user_stories, solution, prepare_user_story).
concern_element(activity, user_stories, solution, accept_user_story).
concern_element(role, user_stories, solution, agile_analyst).

%
% User Story Alpha
%

alpha(user_story, name, "User Story").
alpha(user_story, description, ["User Stories are an agile requirements approach that helps shift the focus from writing about requirements to talking about them. User Stories include a written sentence or two and, more importantly, capture a series of conversations about the desired functionality."]). 
alpha(user_story, points, []).
alpha(user_story, states, [candidate_story, ready_to_implement, accepted, available_for_use ]).
alpha(user_story, is_a, requirements).

state(candidate_story, alpha, user_story).
state(candidate_story, name, "Candidate Story").
state(candidate_story, description, ["The story has been identified as potentially valuable. This may be nothing more than a name or it could have quite a lot of detail but not yet be sufficient to progress to the next state."]).
state(candidate_story, checks, ["Story is associated with a User or Persona", "Story describes the user need","The value added by the story is clear"]).

state(ready_to_implement, alpha, user_story).
state(ready_to_implement, name, "Ready To Implement").
state(ready_to_implement, description, ["Once work begins on a story, it must be able to progress through to being a candidate for release without interruption. We call this flow.","Before commiting to start work on a story, the team must make sure that nothing will stop the story being completed. When this is true, the story is Ready to Implement and work can start knowing that the intended value can be"]).
state(ready_to_implement, checks, ["The story is the right size","The criteria for acceptance are clear", "Test artifects and data are available","The team has everything necessary for them to complete the story","The story is prioritized"]).

state(accepted, alpha, user_story).
state(accepted, name, "Accepted").
state(accepted, description, ["The story is accepted as complete by the customer. It may not yet be released for general use, but does not require any additional work for that to happen. Where several small stories are part of a larger feature, the customer may wait until they are all locally accepted before releasing the feature."]).
state(accepted, checks, ["The Customer (or Customer Team) agrees that the story is complete","The story has been tested and the results are acceptable","The story can deliver the anticipated value","The story can be deployed"]).

state(available_for_use, alpha, user_story).
state(available_for_use, name, "Available for Use"). 
state(available_for_use, description, ["The story is included in an operational system or product and can be used by the intended users to achieve the anticipated value"]).
state(available_for_use, checks, ["All expected users of the system, product or service can obtain the value delivered by the story","There are no caveats or conditions attached to the use of the story","The value of the story is available in the intended environments"]).

%
% Work product Story Card
% 

work_product(story_card, name, "Story Card").
work_product(story_card, description, ["The physical manifestation of a User Story. Traditionally a paper index card but can also be a digital record in a software tool"]).
work_product(story_card, alpha, user_story).
work_product(story_card, checks, [expressed, conditions_described, captured, all_captured]).
work_product(story_card, detail, "").

work_product_check(expressed, work_product, story_card).
work_product_check(expressed, name, "Story Expressed").
work_product_check(expressed, required, mandatory).
work_product_check(expressed, description, ["The card is a representation of a user need. It is important that the information on the card makes that user need clear and obvious to both the customer and the team"]).
work_product_check(expressed, checks, ["Story is described in a meaningful and unique way on the card","Story is clear and unambiguous to the customer","Story is clear and unambiguous to the team"]).

work_product_check(conditions_described, work_product,story_card).
work_product_check(conditions_described, name, "Conditions of Satisfaction Described").
work_product_check(conditions_described, required, mandatory).
work_product_check(conditions_described, description, ["The criteria and tests that will show that the story has been successfully implemented are clearly described"]).
work_product_check(conditions_described, checks, ["The conditions of satisfaction are listed","When the conditions are satisfied, the anticipated value will be realized","Both functional and non-functional elements of the story have been considered"]).

work_product_check(captured, work_product,story_card).
work_product_check(captured, name, "Conversations Captured").
work_product_check(captured, required, optional).
work_product_check(captured, checks, ["Significant details from some conversations about the User Story are recorded"]).

work_product_check(all_captured, work_product,story_card).
work_product_check(all_captured, name, "All Conversations Captured").
work_product_check(all_captured, required, optional).
work_product_check(all_captured, checks, ["Details from conversations relevant to the User Story are captured"]).

%
% Work product Test Case
% 

work_product(test_case, name, "Test Case").
work_product(test_case, description, ["A set of actions to be performed on the solution to determine if the conditions of satisfaction are met correctly. There is often more than one Test Case for each User Story. Test Cases include acceptance tests (which the Customer Team is responsible for) plus additional tests defined by the developers."]).
work_product(test_case, alpha, user_story).
work_product(test_case, checks, [test_case_captured, executable, automated]).
work_product(test_case, detail, "").

work_product_check(test_case_captured, work_product, test_case). 
work_product_check(test_case_captured, name, "Test Ideas Captured").
work_product_check(test_case_captured, required, mandatory).
work_product_check(test_case_captured, description, ["Justification that the test case has sufficient rigour and completeness to give confidence that the story has been completed satisfactorily"]).
work_product_check(test_case_captured, checks, ["The key things that need to be tested have been documented","The Customer Team is happy that the test ideas together verify an acceptable implementation of the User Story"]).

work_product_check(executable, work_product, test_case). 
work_product_check(executable, name, "Executable").
work_product_check(executable, required, mandatory).
work_product_check(executable, description,  ["The tests are able to be run repeatedly"]).
work_product_check(executable, checks, ["The steps that need to be taken to execute and document the test case are clear","The inputs and required results of each step are listed","The test is fully repeatable","The criteria by which the test is judged to have suceeded or failed are clear"]).

work_product_check(automated, work_product, test_case).  
work_product_check(automated, name, "Automated").
work_product_check(automated, required, optional). 
work_product_check(automated, description, ["The tests are automated and can be run on demand"]).
work_product_check(automated, checks, ["The Test Case has been automated with the appropriate test automation tool","The automated Test Case is included in the automated test suites for the product","The automated Test Case has been demonstrated to execute as expected"]).


%
% Find User Story Activity
%

activity(find_user_story, name, "Find User Stories").
activity(find_user_story, description, ["Identify candidate user stories that will add value to the system, product or service being developed"]).
activity(find_user_story, competencies, [stakeholder_representation at_level 3, analysis at_level 3]).
activity(find_user_story, entry, []).
activity(find_user_story, roles, [agile_analyst]).
activity(find_user_story, patterns, []).
activity(find_user_story, part_of, understand_requirements ).

action(find_user_story, mandatory, update, to_achieve user_story to_state candidate_story or beyond).
action(find_user_story, mandatory, update, to_achieve story_card to_detail expressed or beyond).
action(find_user_story, optional, update, to_achieve test_case to_detail captured or beyond).


%
% Prepare User Story Activity
%
activity(prepare_user_story, name, "Prepare a User Story").
activity(prepare_user_story, description, ["User stories are best elaborated through conversations. Use these conversations, together with structured workshops or customer demonstrations to iteratively refine, improve and perhaps split User Stories, increasing understanding until a Story is available for use."]).
activity(prepare_user_story, competencies, [stakeholder_representation at_level 3, analysis at_level 3, testing at_level 3]).
activity(prepare_user_story, entry, []).
activity(prepare_user_story, roles, [agile_analyst]).
activity(prepare_user_story, patterns, []).
activity(prepare_user_story, part_of, understand_requirements ).

action(prepare_user_story, mandatory, update, to_achieve user_story to_state ready_to_implement or beyond).
action(prepare_user_story, mandatory, update, to_achieve story_card to_detail expressed or beyond).
action(prepare_user_story, optional, update, to_achieve test_case to_detail captured or beyond).


%
% Accept User Story Activity
%
activity(accept_user_story, name, "Accept a User Story").
activity(accept_user_story, description, ["The Product Team is responsible for writing and executing the acceptance Test Cases that will determine that the User Story is complete and can be released. The Product Team may work with developers or testers to create the tests, but as a minimum will specify them."]).
activity(accept_user_story, competencies, [stakeholder_representation at_level 3, development at_level 2, testing at_level 3]).
activity(accept_user_story, entry, []).
activity(accept_user_story, roles, [agile_analyst]).
activity(accept_user_story, patterns, []).
activity(accept_user_story, part_of, implement_system ).

action(accept_user_story, mandatory, update, to_achieve user_story to_state accepted or beyond).


%
% Roles
%

role(agile_analyst, name, "Agile Business Analyst").
role(agile_analyst, description, ["An agile business analyst is capable of understanding the business problem, from key stakeholders, capturing it as user stories and acceptance criterea in an iterative manner. They work closely with the product owner, scrum master and the development team to ensure the work outcomes meet the requirements"]).
role(agile_analyst, competencies, [stakeholder_representation at_level 3, analysis at_level 3]).
role(agile_analyst, points, "The roles and responsibilities of an Agile Business Analyst are" items ["Recognizes the Business Needs and works with stakeholders to understand their requirements and their vision of the product", "Analyze the Business Domain", "Work closely with the development team to understand the initial requirements and scope of the problem", "Helps Team Understand the Big Picture"]).


%
% Associations
%
activity_association(end_before_start, find_user_story, prepare_user_story ). 
activity_association(end_before_start, prepare_user_story, accept_user_story ). 

association("Captured By", user_story, story_card).
association("Validates", user_story, test_case).
association("Documents", agile_analyst, user_story).