:- multifile alpha/3.
:- multifile state/3.
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
% Concern Map: List the practice, concern and Element relationships
%
practice(scrum, name, "Scrum").
practice(scrum, description, [" This practice describes SCRUM"]).

concern_element(alpha, scrum, endeavour, improvement).
concern_element(alpha, scrum, endeavour, sprint).
concern_element(alpha, scrum, endeavour, sprint_goal).
concern_element(alpha, scrum, solution, product_goal).
concern_element(alpha, scrum, solution, product_backlog_item).
concern_element(work_product, scrum, solution, dod).
concern_element(work_product, scrum, solution, sprint_backlog).
concern_element(work_product, scrum, solution, increment).
concern_element(work_product, scrum, solution, product_backlog).
concern_element(activity, scrum, endeavour,daily_scrum).
concern_element(activity, scrum, endeavour,sprint_planning).
concern_element(activity, scrum, endeavour,sprint_retrospective).
concern_element(activity, scrum, endeavour,sprint_review).
concern_element(activity, scrum, solution, product_backlog_refinement).
concern_element(role, scrum, solution, product_owner).
concern_element(role, scrum, endeavour, scrum_master).
concern_element(role, scrum, solution, developers).
concern_element(role, scrum, solution, scrum_team).
concern_element(pattern, scrum, endeavour, self_manage).
concern_element(pattern, scrum, endeavour, transparency).
concern_element(pattern, scrum, endeavour, cross_functional).
concern_element(competency, scrum, endeavour, scrum_competency). 

%
% Sprint Alpha
% 
alpha(sprint, name, "Sprint").
alpha(sprint, description, ["The heartbeat of Scrum, where ideas are turned into value. A time-box of one month or less, a new Sprint starts immediately after the conclusion of the previous Sprint.","Regular Sprints create consistency and enable predictability"]).
alpha(sprint, states, [scheduled, planned, reviewed]).

state(scheduled, alpha, sprint).
state(scheduled, name, "Scheduled"). 
state(scheduled, description, ["The Sprint event dates are scheduled, including the start and end dates/times for the Sprint"]).
state(scheduled, checks,  ["The start and end dates/times for the Sprint are scheduled and agreed", "The Scrum events for the Sprint are scheduled"]).

state(planned, alpha, sprint).
state(planned, name, "Planned").
state(planned, description, ["There is a plan in place for the Sprint"]).
state(planned, checks,["The Team is aligned and committed to achieving the Sprint Goal", "The Sprint Backlog lays out the work to be performed for the Sprint", "The Team is confident that they can complete the identified work within the Sprint", "The Team are agreed on how to execute the plan", "All the work planned and currently in progress is visible to stakeholders"]).

state(reviewed, alpha, sprint).
state(reviewed, name, "Reviewed").
state(reviewed, description, ["The outcomes of the Sprint have been reviewed and factored into future priorities"]).
state(reviewed, checks, ["Progress toward the Product Goal has been discussed", "The Scrum Team and stakeholders have reviewed the outcome of the Sprint", "The Scrum Team have refined the Product Backlog based on their experiences during this Sprint", "The Scrum Team has planned ways to increase quality and effectiveness", "The value of the increment(s) is clear"]).


%
% Improvement Alpha
% 
alpha(improvement, name, "Improvement").
alpha(improvement, description, ["An action to be taken to improve the way a Scrum Team does its work. For example it could be an experiment to be tried, an improvement to be made or an impediment to be removed.", "It could also be an action to be taken to improve an enterprises way of working. For example, a change initiative, an improvement to be made, an experiment to be conducted, or an impediment to be removed"]).
alpha(improvement, states, [improvement_identified, improvement_ready, done]).

state(improvement_identified, alpha, improvement).
state(improvement_identified, name, "Identified").
state(improvement_identified, checks, ["A potential improvement has been identified", "The relative priority of enacting the improvement is agreed"]).

state(improvement_ready, alpha, improvement).
state(improvement_ready, name,  "Ready").
state(improvement_ready, checks, ["There is an agreed plan in place for this improvement to be enacted","It is clear how the achievement of the improvement will be detected or demonstrated"]).

state(done, alpha, improvement).
state(done, name,  "Done").
state(done, checks, ["The improvement has been enacted","The impact of the improvement has been discussed by the Scrum Team. This may have resulted in further improvements"]).

%
% Sprint Goal Alpha
% 
alpha(sprint_goal, name, "Sprint Goal").
alpha(sprint_goal, description, ["The single objective set for a Sprint. It creates coherence and focus, encouraging the Scrum Team to work together"]).
alpha(sprint_goal, states, [identified, sprint_goal_committed, accessed]).

state(identified, alpha, sprint_goal).  
state(identified, name, "Identified"). 

state(sprint_goal_committed, alpha, sprint_goal).
state(sprint_goal_committed, name, "Committed").

state(accessed, alpha, sprint_goal). 
state(accessed, name, "Accessed"). 


%
% Product Goal Alpha
% 
alpha(product_goal, name, "Product Goal").
alpha(product_goal, description, ["A long-term objective for the Scrum Team that describes a desired future state of the product which can serve as a target for the Scrum Team to plan against. The team must fulfil, or abandon, one objective before taking on the next"]).
alpha(product_goal, states, [product_goal_identified, committed, product_goal_fulfilled]).

state(product_goal_identified, alpha, product_goal). 
state(product_goal_identified, name, "Identified"). 

state(committed, alpha, product_goal). 
state(committed, name, "Committed"). 

state(product_goal_fulfilled, alpha, product_goal).  
state(product_goal_fulfilled, name, "Fulfilled or Abandoned"). 


%
% Product backlog Alpha
% 
alpha(product_backlog_item, name, "Product Backlog Item").
alpha(product_backlog_item, description, ["An improvement to be made to the product (for example a story, feature, function, requirement, enhancement or fix). Items that can be done by the Scrum Team within one Sprint are deemed ready for selection in the Sprint Planning event"]).
alpha(product_backlog_item, states, [product_backlog_item_identified, product_backlog_item_ready, product_backlog_item_done]).

state(product_backlog_item_identified, alpha, product_backlog_item).
state(product_backlog_item_identified, name, "Identified").
state(product_backlog_item_identified, checks, ["A backlog item has been identified"]).

state(product_backlog_item_ready, alpha, product_backlog_item).
state(product_backlog_item_ready, name, "Ready").
state(product_backlog_item_ready, checks, ["The Backlog Item is ready to be started"]).

state(product_backlog_item_done, alpha, product_backlog_item).
state(product_backlog_item_done, name, "Done").
state(product_backlog_item_done, checks, ["The backlog item has been enacted"]).


%
% Sprint Backlog Work product
% 
work_product(sprint_backlog, name, "Sprint Backlog").
work_product(sprint_backlog, description, ["A highly visible, real-time picture of the work that the Developers plan to accomplish during the Sprint in order to achieve the Sprint Goal"]).
work_product(sprint_backlog, alpha, sprint).
work_product(sprint_backlog, checks, [sprint_backlog_primed, sprint_backlog_goal_set, sprint_backlog_plan_in_place, sprint_backlog_other]).

work_product_check(sprint_backlog_primed, work_product, sprint_backlog).
work_product_check(sprint_backlog_primed, name, "Primed with Improvements").
work_product_check(sprint_backlog_primed, required, mandatory).
work_product_check(sprint_backlog_primed, checks, ["The Sprint Backlog has been primed with the most impactful improvements"]).

work_product_check(sprint_backlog_goal_set, work_product, sprint_backlog). 
work_product_check(sprint_backlog_goal_set, name, "Sprint Goal Set").
work_product_check(sprint_backlog_goal_set, required, mandatory).
work_product_check(sprint_backlog_goal_set, checks, ["A single objective for the Sprint is set"]).

work_product_check(sprint_backlog_plan_in_place, work_product, sprint_backlog). 
work_product_check(sprint_backlog_plan_in_place, name, "Actionable Plan in Place").
work_product_check(sprint_backlog_plan_in_place, required, optional).
work_product_check(sprint_backlog_plan_in_place, description, ["Detail is added to the Sprint Backlog to complement the Sprint Goal (why) and describe set of Product Backlog items selected for the Sprint (what), as well as an actionable plan for delivering the Increment (how)"]).
work_product_check(sprint_backlog_plan_in_place, checks, ["The set of Product Backlog items selected for the Sprint addresses the Sprint Goal", "It is a highly visible, realtime picture of the work in progress and to be done", "It is actionable and every member of the Scrum Team knows what they will do next", "It has enough detail so the Scrum Team can inspect their progress in the Daily Scrum"]).

work_product_check(sprint_backlog_other, work_product, sprint_backlog).
work_product_check(sprint_backlog_other, name, "Detail Captured"). 
work_product_check(sprint_backlog_other, required, optional).
work_product_check(sprint_backlog_other, checks, ["Any other detail the Development Team finds useful is also captured", "Other detail the Scrum Team finds useful to help it achieve the Sprint Goal is maintained and updated. For example, task breakdowns, dependencies, etc"]).

%
% Increment Work product
%
work_product(increment, name, "Increment"). 
work_product(increment, description, ["A concrete stepping stone towards the Product Goal. A Sprint may produce multiple Increments. Each Increment is additive to all prior Increments. In order to provide value the Increment must be usable and meet the Definition of Done"]).
work_product(increment, alpha, wow).
work_product(increment, checks, [items_listed, value_quantified]).

work_product_check(items_listed, work_product, increment).  
work_product_check(items_listed, name, "Product Backlog Items Listed").
work_product_check(items_listed, required,mandatory).
work_product_check(items_listed, checks, ["The Product Backlog Items Listed level is achieved"]).

work_product_check(value_quantified, work_product, increment).
work_product_check(value_quantified, name, "Value Quantified").
work_product_check(value_quantified, required, optional). 
work_product_check(value_quantified, checks, ["The Value Quantified level is achieved"]).

%
% Product Backlog Work product
%
work_product(product_backlog, name, "Product Backlog"). 
work_product(product_backlog, description, ["An emergent, ordered list of what is needed to improve the product. The single source of work undertaken by the Scrum Team. The items in the Product Backlog are known as Product Backlog Items"]).
work_product(product_backlog, alpha, requirements).
work_product(product_backlog, checks, [goal_set, items_ordered]).

work_product_check(goal_set, work_product, product_backlog). 
work_product_check(goal_set, name, "Goal Set").
work_product_check(goal_set, required, mandatory).
work_product_check(goal_set, checks, ["The Goal Set level is achieved"]).

work_product_check(items_ordered, work_product, product_backlog).
work_product_check(items_ordered, name, "Items Ordered").
work_product_check(items_ordered, required, mandatory).
work_product_check(items_ordered, checks, ["The Items Ordered level is achieved"]).

%
% Definition Of Done Work product
%
work_product(dod, name, "Definition of Done").
work_product(dod, description, ["A formal description of the state of the Increment when it meets the quality measures required for the product. It must be met by all Product Backlog Items. If there are multiple Scrum Teams working together on a product they must comply with the same definition of done"]).
work_product(dod, alpha, wow ).
work_product(dod, checks, [standard_set]).

work_product_check(standard_set, work_product, dod).
work_product_check(standard_set, name, "Quality Standards Set"). 
work_product_check(standard_set, required, mandatory). 
work_product_check(standard_set, checks, ["The Quality Standards Set level is achieved"]).


%%%%%%%%%%%%%%%%%%%%%%%
%       Activities
%%%%%%%%%%%%%%%%%%%%%%%

activity(daily_scrum, name, "Daily Scrum").
activity(daily_scrum, part_of,  coordinate_activity).
activity(daily_scrum, description, ["Plan the work for the next day to optimize progress towards the Sprint Goal. A daily, 15-minute event for the Scrum team"]).
activity(daily_scrum, competencies, [leadership at_level 3, management at_level 2]).
activity(daily_scrum, entry, []).
activity(daily_scrum, patterns, []).
activity(daily_scrum, roles, [developers]).

action(daily_scrum, mandatory, update, to_achieve sprint_backlog to_detail plan_in_place or beyond).
action(daily_scrum, mandatory, update, contributes_to work to_state under_control or beyond).
action(daily_scrum, mandatory, update, contributes_to sprint to_state reviewed).

activity(sprint_planning, name, "Sprint Planning").
activity(sprint_planning, part_of, coordinate_activity ).
activity(sprint_planning, description, ["Collaboratively plan the work to be performed in the Sprint and agree what can be delivered in the Sprint’s Increment. A whole team event of no more than 8 hours"]).
activity(sprint_planning, competencies, [leadership at_level 3, management at_level 2]).
activity(sprint_planning, entry, []).
activity(sprint_planning, patterns, []).
activity(sprint_planning, roles, [scrum_master, scrum_team]).

action(sprint_planning, optional, update, to_achieve product_goal to_state committed or beyond).
action(sprint_planning, optional, update, to_achieve sprint to_state planned).
action(sprint_planning, optional, update, to_achieve sprint_backlog to_detail plan_in_place or beyond).
action(sprint_planning, optional, update, to_achieve sprint_goal to_state committed).
action(sprint_planning, optional, update, contributes_to work to_state prepared or beyond).

activity(sprint_review, name, "Sprint Review").
activity(sprint_review, part_of, track_progress ).
activity(sprint_review, description, ["A working session, held at the end of the Sprint, to inspect the outcome of the Sprint and determine future adaptations. A time-boxed event of no more than 4 hours"]).
activity(sprint_review, competencies, [leadership at_level 3, stakeholder_representation at_level 3]).
activity(sprint_review, entry, []).
activity(sprint_review, patterns, []).
activity(sprint_review, roles, [product_owner, scrum_team]).

action(sprint_review, mandatory, update, to_achieve requirements to_state conceived or beyond).
action(sprint_review, mandatory, update, to_achieve product_backlog_item to_state identified).
action(sprint_review, mandatory, update, to_achieve sprint_goal to_state assessed).
action(sprint_review, mandatory, update, contributes_to work to_detail under_control or beyond).
action(sprint_review, optional, update, to_achieve product_backlog to_detail items_ordered).
action(sprint_review, mandatory, update, contributes_to sprint to_state reviewed).

activity(sprint_retrospective, name, "Sprint Retrospective").
activity(sprint_retrospective, description, ["Collaboratively plan and enact ways to increase quality and effectiveness. A Scrum Team event of no more than 3 hours"]).
activity(sprint_retrospective, competencies, [leadership at_level 3, management at_level 2]).
activity(sprint_retrospective, entry, []).
activity(sprint_retrospective, patterns, []).
activity(sprint_retrospective, roles, [scrum_master,scrum_team]).
activity(sprint_retrospective, part_of, support_team ).

action(sprint_retrospective, optional, update, to_achieve sprint_backlog to_detail primed).
action(sprint_retrospective, optional, update, to_achieve dod to_detail standard_set or beyond).
action(sprint_retrospective, mandatory, update, to_achieve improvement to_state identified or beyond).
action(sprint_retrospective, mandatory, update, contributes_to team to_state collaborating or beyond).
action(sprint_retrospective, mandatory, update, contributes_to sprint to_state reviewed or beyond).
action(sprint_retrospective, mandatory, update, contributes_to wow to_state in_use or beyond).

activity(product_backlog_refinement, name, "Product Backlog Refinement").
activity(product_backlog_refinement, part_of, understand_requirements).
activity(product_backlog_refinement, description, ["The ongoing activity of breaking down, and further defining Product Backlog Items into smaller, more precise items (adding detail such as description, order and size). A whole team activity led by the Product Owner"]).
activity(product_backlog_refinement, competencies, [leadership at_level 3, stakeholder_representation at_level 3]).
activity(product_backlog_refinement, entry, []).
activity(product_backlog_refinement, patterns, []).
activity(product_backlog_refinement, roles, [product_owner, scrum_team]).

action(product_backlog_refinement, mandatory, update, to_achieve requirements to_state conceived or beyond).
action(product_backlog_refinement, mandatory, update, to_achieve product_backlog to_detail goal_set or beyond).
action(product_backlog_refinement, mandatory, update, to_achieve product_backlog_item to_state identified).
action(product_backlog_refinement, mandatory, update, to_achieve product_backlog_item to_state ready).
action(product_backlog_refinement, mandatory, update, to_achieve product_goal to_state identified or beyond).

%
% patterns
%
pattern(cross_functional, type, advisory). 
pattern(cross_functional, name, "Cross Functional Team"). 
pattern(cross_functional, description, ["A cross-functional team has all the skills necessary to create value each Sprint"]).

pattern(self_manage, type, advisory). 
pattern(self_manage, name, "Self Management").
pattern(self_manage, description, ["Self-managing teams are teams that internally decide who does what, when and how"]).

pattern(transparency, type,  advisory).
pattern(transparency, name, "Transparency"). 
pattern(transparency, description, ["The emergent process and work must be visible to those performing the work as well as those receiving the work."]).

%
% Competency
%
competency(scrum_competency, name, "Scrum").
competency(scrum_competency, description, ["This competency encapsulates the knowledge and practice of scrum"]).
competency(scrum_competency, type, generic).

%
% Roles
%
role(scrum_team, name, "Scrum Team").
role(scrum_team, description, ["The fundamental unit of Scrum, the Scrum Team consists of one Scrum Master, one Product Owner and Developers. A small, focused team of people, typically 10 or fewer "]).
role(scrum_team, competencies, [stakeholder_representation at_level 3, analysis at_level 3]). 
role(scrum_team, points, "The Team is" items ["Autonomous" , "Cross-functional", "Self-managing", "Empowered"] ).

role(product_owner, name, "Product Owner").
role(product_owner, description, ["The Product Owner is accountable for maximizing the value of the product resulting from the work of the Scrum Team"]).
role(product_owner, competencies,  [stakeholder_representation at_level 3, analysis at_level 3]).
role(product_owner, points, "They are accountable for effective Product Backlog management including" items [ "Developing and explicitly communicating the Product Goal", "Creating, clearly communicating, and ordering Product Backlog Items", "Ensuring the Product Backlog is transparent, visible and understood"] ).

role(developers, name, "Developers").
role(developers, description, ["Developers are the people in the Scrum Team that are committed to creating any aspect of a usable Increment each Sprint"]).
role(developers, competencies, [stakeholder_representation at_level 3, analysis at_level 3]).
role(developers, points, "They are accountable for" items ["Creating a plan for the Sprint, the Sprint Backlog", "Instilling quality by adhering to a Definition of Done", "Adapting their plan each day toward the Sprint Goal", "Holding each other accountable as professionals"]).

role(scrum_master, name, "Scrum Master").
role(scrum_master, description, ["The Scrum Master is accountable for ensuring that Scrum is understood and enacted"]).
role(scrum_master, competencies, [management at_level 3, scrum_competency at_level 3, leadership at_level 3]).
role(scrum_master, points, "They are true leaders who serve the team in several ways" items ["Coaching self-management and cross-functionality", "Removing impediments", "Helping the Product Owner manage the Product Backlog effectively", "Helping the Team focus and create high-value products", "Helping the organization understand and enact Scrum They are also accountable for the Scrum Teams effectiveness"] ).


% role associations - Two way
association("Part Of", product_owner, scrum_team).
association("Consists Of", scrum_team, product_owner).

association("Part Of", scrum_master, scrum_team).
association("Consists Of", scrum_team, scrum_master).

association("Part Of", developers, scrum_team).
association("Consists Of", scrum_team, developers).

% role associations - one way
association("Leads", product_owner, product_backlog_refinement).
association("Invites Stakeholders to", product_owner, sprint_review).
association("Responsible for Managing", product_owner, product_backlog).
association("Responsible for Managing", product_owner, product_backlog_item).
association("Decides to Release", product_owner, increment).
association("Responcible for Updating", developers, sprint_backlog).
association("Creat Usable", developers, increment).
association("Facilitates", scrum_master, sprint_planning).
association("Facilitates", scrum_master, sprint_retrospective).
association("Coaches and Helps", scrum_master, developers).
association("Coaches and Helps", scrum_master, product_owner).
association("Drives Relentless", scrum_master, improvement).
association("Involved in", scrum_team, product_backlog_refinement).
association("Perform Collaboratively", scrum_team, sprint_planning).
association("Perform Collaboratively", scrum_team, sprint_retrospective).
association("Perform Collaboratively", scrum_team, sprint_review).
association("Responcible for Conducting", developers, daily_scrum).
association("Invites stakeholders to", product_owner, sprint_review).

% Improvement
association("Added to", improvement, sprint_backlog).
association("Includes", sprint_backlog, improvement).

% Product Backlog Item (Alpha)
association("Constrains", dod, product_backlog_item).
association("Lists", product_backlog, product_backlog_item).
association("Must Meet", product_backlog_item, dod).
association("Part Of", product_backlog_item, product_backlog).
association("Realises", increment, product_backlog_item).

% Product Goal (Alpha)
association("Added to", product_goal, product_backlog).
association("Focuses on", product_backlog, product_goal).
association("Stepping Stone Towards", increment, product_goal).
association("Supports", sprint_goal, product_goal).

% sprint (alpha)
association("Creates one or more", sprint, increment).
association("Produced by ", increment, sprint).
association("Progresses", sprint, product_backlog).

% sprint_goal (alpha)
association("Added to", sprint_goal, sprint_backlog).
association("Addresses", sprint, sprint_goal).
association("Focusses on", sprint_backlog, sprint_goal).

% definition of done (wp)
association("Qualifies", dod, increment).
association("Guided by", developers, dod).

% sprint_backlog (wp)
association("Lists", sprint_backlog, product_backlog_item).
association("Is", scrum_team, cross_functional). 
association("Practice", scrum_team, self_manage). 
association("Practice", scrum_team, transparency). 
