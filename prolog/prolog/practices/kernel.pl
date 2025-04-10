
:- multifile alpha/3.
:- multifile state/3.
:- multifile association/3.
:- multifile concern_element/4.
:- multifile practice/3.
:- multifile activity_space/3.
:- multifile competency/3.
:- multifile competency_level/3.
:- multifile competency_type/3.
:- multifile concern/3.

:- discontiguous alpha/3.
:- discontiguous state/3.
:- discontiguous association/3.
:- discontiguous activity_space/3.
:- discontiguous concern_element/4.
:- discontiguous concern/3.
:- discontiguous competency/3.
:- discontiguous competency_level/3.
:- discontiguous competency_type/3.

:- op(500,xfx,'at_level').
:- op(600,xfx,'items').

%
% Concern Map
%

practice(kernel, name, "Kernel").
practice(kernel, description, ["The default Essence Kernel Elements"]).
practice(kernel, concerns, [customer, solution, endeavour]).

concern(customer, name, "Customer").
concern(customer, position, above(solution)).
concern(customer, color, green).

concern(solution, name, "Solution").
concern(solution, position, above(endeavor)).
concern(solution, color, yellow).

concern(endeavour, name, "Endeavour").
concern(endeavour, color, blue).

concern_element(alpha, kernel, customer, opportunity).
concern_element(alpha, kernel, customer, stakeholders).
concern_element(alpha, kernel, solution, requirements).
concern_element(alpha, kernel, solution, software_system).
concern_element(alpha, kernel, endeavour, work).
concern_element(alpha, kernel, endeavour, team).
concern_element(alpha, kernel, endeavour, wow).

concern_element(activity_space, kernel, customer, explore_possibilities).
concern_element(activity_space, kernel, customer, understand_needs).
concern_element(activity_space, kernel, customer, stakeholder_satisfaction).
concern_element(activity_space, kernel, customer, use_the_system).
concern_element(activity_space, kernel, solution, understand_requirements).
concern_element(activity_space, kernel, solution, shape_system).
concern_element(activity_space, kernel, solution, implement_system).
concern_element(activity_space, kernel, solution, test_system).
concern_element(activity_space, kernel, solution, deploy_system).
concern_element(activity_space, kernel, solution, operate_system).
concern_element(activity_space, kernel, endeavour, prepare_work).
concern_element(activity_space, kernel, endeavour, coordinate_activity).
concern_element(activity_space, kernel, endeavour, support_team).
concern_element(activity_space, kernel, endeavour, track_progress).
concern_element(activity_space, kernel, endeavour, stop_work).

concern_element(competency, kernel, customer, stakeholder_representation).
concern_element(competency, kernel, solution, analysis).
concern_element(competency, kernel, solution, development).
concern_element(competency, kernel, solution, testing).
concern_element(competency, kernel, endeavour, leadership).
concern_element(competency, kernel, endeavour, management). 


%
% software_system Alpha
%
alpha(software_system, name, "Software System").
alpha(software_system, description, ["A system made up of software, hardware, and data that provides its primary value by the execution of the software"]).
alpha(software_system, points, "A Good software system:" items ["meets requirements", "has appropriate architecture", "is maintainable, extensible and testable", "has low support cost"]).
alpha(software_system, states, [arch_selected, demoable, usable, ready, operational, retired]).

state(arch_selected, alpha, software_system).
state(arch_selected, name, "Architecture Selected").
state(arch_selected, checks, ["Architecture selected that address key technical risks", "Criteria for selecting architecture agreed", "Platforms, technologies, languages selected", "Buy, build, reuse decisions made"]).

state(demoable,  alpha, software_system).
state(demoable,  name,"Demonstratable").
state(demoable,  checks, [" Key architecture characteristics demonstrated","Relevant stakeholders agree architecture is appropriate", "Critical interface and system configurations exercised"]). 

state(usable, alpha, software_system).
state(usable, name, "Usable").
state(usable, checks,  [" System is usable and has desired quality characterisitcs","System can be operated by users", "Functionality and performance have been tested and accepted", "Defect levels acceptable", "Release  content known"]).

state(ready, alpha, software_system).
state(ready, name, "Ready").
state(ready, checks, ["User documentation available", "Stakeholder representatives accept system", "Stakeholder representatives want to make the system operational"]).

state(operational, alpha, software_system).
state(operational, name, "Operational").
state(operational,checks, ["System in use in operational environment", "System available to intended users", "At least one example of system is fully operational", "System supported to agreed service"]).

state(retired, alpha, software_system).
state(retired, name, "Retired"). 
state(retired, checks, ["System no longer supported", "Updates to system will no longer be produced", "System has been replaced or discontinued"]).  

%
% Stakeholders Alpha
% 

alpha(stakeholders, name, "Stakeholders").
alpha(stakeholders, description, ["The people, groups, or organisations who effect or are affected by a software system"]).
alpha(stakeholders, points, "Healthy stakeholders" items ["represent groups or organizations affected by the software system","representatives carry out their agreed to responsibilities","representatives cooperate to reach agreement","are satisfied with the use of the software system"]).
alpha(stakeholders, states, [recognized, represented, involved, in_agreement, deployment, in_use]).

state(recognized, alpha, stakeholders).
state(recognized, name, "Recognized").
state(recognized, checks, ["The stakeholders have been identified", "There is agreement on stakeholder groups to be represented", "Responsibilities of stakeholder representatives defined"]).

state(represented, alpha, stakeholders).
state(represented, name, "Represented").
state(represented, checks, ["Stakeholder representatives appointed","Stakeholder representatives agreed to take on responsibilities & authorized","Collaboration approach agreed","Representatives respect team way of working"]).

state(involved, alpha, stakeholders).
state(involved, name, "Involved").
state(involved, checks,  ["Stakeholder representatives carry out responsibilities","Stakeholder representatives provide feedback & take part in decisions in timely way","Stakeholder representatives promptly communicate to stakeholder group" ]).

state(in_agreement, alpha, stakeholders).
state(in_agreement, name, "In Agreement").
state(in_agreement, checks, ["Stakeholder representatives agree their input is valued and respected by the team","Stakeholder representatives agree with priorities","Stakeholder representatives have agreed upon minimal expectations for deployment"]).

state(deployment, alpha, stakeholders).
state(deployment, name, "Satisfied for Deployment").
state(deployment, checks, ["Stakeholder representatives provide feedback on system from their stakeholder group perspective","Stakeholder representatives confirm system ready for deployment "]).

state(in_use, alpha, stakeholders).
state(in_use, name, "Satisfied for Use").
state(in_use, checks, ["System has met or exceed minimal stakeholder expectations","Stakeholderneeds and expectations are being met"]).

%
% Opportunity Alpha
% 

alpha(opportunity, name, "Opportunity"). 
alpha(opportunity, description, ["The set of circumstances that makes it appropriate to develop or change a software system"]).
alpha(opportunity, points, "A good opportunity" items ["is identified addressing the need for a software-based solution","has established value","has a software-based solution that can be produced quickly and cheaply","creates a tangible benefit"]).
alpha(opportunity, states, [opportunity_identified, solution_needed, value_established, viable, addressed, benefit_acrued]).

state(opportunity_identified, alpha, opportunity).
state(opportunity_identified, name, "Identified").
state(opportunity_identified, checks, ["Opportunity identified that could be addressed by a software-based solution","A stakeholder wishes to make an investment in better understanding potential value","Other stakeholders who share opportunity identified"]).

state(solution_needed, alpha, opportunity).
state(solution_needed, name, "Solution Needed").
state(solution_needed, checks, ["Need for software-based solution confirmed","Stakeholders needs identified","Underlying problem and root cause identified","At least1 software-based solution proposed"]).

state(value_established, alpha, opportunity).
state(value_established, name, "Value Established").
state(value_established, checks, ["The value of a successful solution established","Impact of solution on stakeholders understood","Value of software system understood"]).

state(viable, alpha, opportunity).
state(viable, name, "Viable").
state(viable, checks, ["A solution has been outlined","Indications are solution can be developed & deployed within constraints","Risks are manageable"]).

state(addressed, alpha, opportunity).
state(addressed, name, "Addressed").
state(addressed, checks, ["A solution has been produced that demonstrably addresses opportunity","A usable system is available","Stakeholders agree worth deploying","Stakeholders satisfied solution addresses opportunity"]).

state(benefit_acrued, alpha, opportunity).
state(benefit_acrued, name, "Benefit Accrued").
state(benefit_acrued, checks, ["Operational use creating tangible benefits","Return on investment profile at least as good as anticipated"]).

%
% Requirements Alpha
% 

alpha(requirements, name, "Requirements"). 
alpha(requirements, description, ["What the software system must do to address the opportunity and satisfy the stakeholders"]).
alpha(requirements, points, "Good Requirements" items ["meet real needs"," have clear scope","are coherent and well organized","help drive development" ]).
alpha(requirements, states, [conceived, bounded, coherent, acceptable, addressed, fulfilled]).

state(conceived, alpha, requirements).
state(conceived, name, "Conceived"). 
state(conceived, checks,["The need for a new system is clear","Users are identified","Initial sponsors are identified"]).
 
state(bounded, alpha, requirements).
state(bounded, name, "Bounded"). 
state(bounded, checks, ["The purpose and extent of the system are agreed ","Success criteria are clear ","Mechanisms for handling requirements are agreed ","Constraints and assumptions identified"]).

state(coherent, alpha, requirements).
state(coherent, name, "Coherent"). 
state(coherent, checks, ["The big picture is clear and shared by all involved","Important usage scenarios explained","Priorities are clear","Conflicts are addressed","Impact is understood" ]).

state(acceptable, alpha, requirements). 
state(acceptable, name, "Acceptable"). 
state(acceptable, checks, ["Requirements describe a solution acceptable to the stakeholders","The rate of change to agreed requirements is low","Value is clear"]).

state(addressed, alpha, requirements).
state(addressed, name, "Addressed"). 
state(addressed, checks, ["Enough requirements are implemented for the system to be acceptable","Stakeholders agree the system is worth making operational"]).

state(fulfilled, alpha, requirements).
state(fulfilled, name, "Fulfilled"). 
state(fulfilled, checks, ["The system fully satisfies the requirements and the need","There are no outstanding requirements items preventing completion"]).

%
% Team Alpha
% 

alpha(team, name, "Team").
alpha(team, description, ["The group of people actively engaged in the development, maintenance, delivery and support of a specific software system."]).
alpha(team, points, "A healthy Team" items ["meets its team goals effectively", "has members that collaborates effectively", "focus on their work", "continually improves"]).
alpha(team, states, [seeded, formed, collaborating, performing, adjourned]).

state(seeded, alpha, team).
state(seeded, name, "Seeded").
state(seeded, checks, ["Team’s mission is clear", "Team knows how to grow to achieve the mission", "Required competencies are identified", "Team size is determined"]).

state(formed, alpha, team).
state(formed, name, "Formed").
state(formed, checks,["Team has enough resources to start", "Team organization & individual responsibilities understood ", "Members know how to perform work"]).

state(collaborating, alpha, team).
state(collaborating, name, "Collaborating"). 
state(collaborating, checks, ["Members working as one unit", "Communication is open and honest", "Members focused on team mission ", "Success of team ahead of personal objectives"]).

state(performing, alpha, team).
state(performing, name, "Performing"). 
state(performing, checks, ["Team working efficiently and effectively", "Adapts to changing context ", "Produce high quality output ", "Minimal backtracking and re-work ", "Waste continually eliminated"]).

state(adjourned, alpha, team).
state(adjourned, name, "Adjourned"). 
state(adjourned, checks, ["Team no longer accountable", "Responsibilities handed over ", "Members available for other assignment"]).


%
% Work Alpha
% 

alpha(work, name, "Work").
alpha(work, description, ["Activity involving mental or physical effort done in order to achieve a result."]).
alpha(work, points, "Healthy Work" items ["is sizeable, estimate-able and track-able","breakdown reduces dependencies between work items","management keeps risks, work and re-work under control"]).
alpha(work, states, [initiated, prepared, started, under_control, concluded, closed]).

state(initiated, alpha, work).
state(initiated, name, "Initiated"). 
state(initiated, checks,["Work initiator known", "Work constraints clear", "Sponsorship and funding model clear", "Priority of work clear"]).

state(prepared, alpha, work). 
state(prepared, name, "Prepared").
state(prepared, checks, ["Cost & effort estimated","Funding and resources to start work in place ", "Acceptance criteria understood", "Governance procedures agreed","Risk exposure understood ", "Dependencies clear"]).

state(started, alpha, work). 
state(started, name, "Started"). 
state(started, checks, ["Development work has started", "Work progress is monitored", "Work broken down into actionable items with clear description of done", "Team members are accepting and progressing work items"]).

state(under_control, alpha, work). 
state(under_control, name, "Under Control").
state(under_control, checks, ["Work going well, risks being managed", "Unplanned work & re-work under control", "Work items completed within estimates", "Measures tracked"]).

state(concluded, alpha, work). 
state(concluded, name, "Concluded").
state(concluded, checks, ["Work to produce results have been finished", "Work results are being achieved", "The client has accepted the resulting software system"]).

state(closed, alpha, work). 
state(closed, name, "Closed").
state(closed, checks, ["All remaining housekeeping tasks completed, and work officially closed", "Everything has been archived", "Lessons learned and metrics made available"]).


%
% Way of Working Alpha
% 

alpha(wow, name, "Way of Working").
alpha(wow, description, ["The tailored set of practices and tools used by a team to guide and support their work."]).
alpha(wow, points, "A Good way of working" items ["is agreed by the team ", "reduces risks and technical debts", "is effective and removes duplicate work and wastes", "improves itself"]).
alpha(wow, states, [principles_established, foundation_established, in_use, in_place, working_well, retired]).

state(principles_established, alpha, wow).
state(principles_established, name, "Principles Established").
state(principles_established, checks,["Principles and constraints established", "Principles and constraints committed to", "Practices and tools agreed to", "Context team operates in understood"]).

state(foundation_established, alpha, wow).
state(foundation_established, name, "Foundation Established").
state(foundation_established, checks,["Key practices and tools ready", "Gaps that exist between practices and tools analyzed and understood", "Capability gaps analyzed and understood", "Selected practices, and tools integrated"]).

state(in_use, alpha, wow).
state(in_use, name, "In Use"). 
state(in_use, checks,["Some members of the team are using the way of working", "Use of practices and tools regularly inspected", "Practices and tools being adapted and supported by team", "Procedures in place to handle feedback"]).

state(in_place, alpha, wow).
state(in_place, name, "In Place").
state(in_place, checks,["All members of the team are using the way of working", "All members have access to practices and tools to do their work", "Whole team involved in inspection and adaptation of way of working"]).

state(working_well, alpha, wow).
state(working_well, name, "Working Well").
state(working_well, checks,["Way of working is working well for team", "Team members are making progress as planned", "Team naturally applies practices without thinking about them", "Tools naturally support way of working"]).

state(retired, alpha, wow).
state(retired, name, "Retired"). 
state(retired, checks,["Way of working no longer in use by team", "Lessons learned are shared for future us"]).


%
% Alpha Associations 
%

association("Focuses", opportunity, requirements).
association("Scope and constrain", requirements, work).
association("Demand", stakeholders, requirements).
association("Provide ", stakeholders, opportunity).
association("Support", stakeholders, team).
association("Use and consume the", stakeholders, software_system).
association("Fulfills", software_system, requirements).
association("Helps address the", software_system, opportunity).
association("Applies the ", team, wow).
association("Performs and plans", team, work).
association("Produces", team, software_system).
association("Guides", wow, work).
association("set up to Address the", work, opportunity).
association("updates and changes the", work, software_system).


%  An activity space is a high-level abstraction representing “something to be done”. It uses a (possibly empty) collection of alphas as input to the work. 
%  When the work is concluded a collection of alphas (possibly some of the alphas used as input) has been updated. The update may cause a change of the alpha’s state. 
%  When the update and the state change of an alpha takes place is not defined; only that it has been done when the activity space is completed.
%  What should have been accomplished when the work performed in the activity space is completed, i.e., the activity space’s completion criteria, is expressed in 
%  terms of which states the output alphas should have reached. Using the checkpoints for the states of alphas, it is at the discretion of the team to decide when a 
%  state change has occurred and thus the completion criteria of the activity space have been met.

activity_space(explore_possibilities, name, "Explore Possibilities").
activity_space(explore_possibilities, description, ["Explore the possibilities presented by the creation of a new or improved software system. This includes the analysis of the opportunity to be addressed and the identification of the stakeholders"]).
activity_space(explore_possibilities, points, "Explore possibilities to" items ["Enable the right stakeholders to be involved", "Understand the stakeholders needs", "Identify opportunities for the use of the software system", "Understand why the software system is needed", "Establish the value offered by the software system"]).
activity_space(explore_possibilities, input, []).
activity_space(explore_possibilities, entry, []).
activity_space(explore_possibilities, completion, [stakeholders:recognized, opportunity:value_established]).

activity_space(understand_needs, name,"Understand Stakeholder Needs").
activity_space(understand_needs, description, ["Engage with the stakeholders to understand their needs and ensure that the right results are produced. This includes identifying and working with the stakeholder representatives to progress the opportunity"]).
activity_space(understand_needs, points, "Understand stakeholder needs to" items ["Ensure the right solution is created", "Align expectations", "Collect feedback and generate input", "Ensure that the solution produced provides benefit to the stakeholders"]).
activity_space(understand_needs, input,[stakeholders, opportunity, requirements, software_system]).
activity_space(understand_needs, entry, [stakeholders:recognized, opportunity:value_established]).
activity_space(understand_needs, completion, [stakeholders:in_agreement, opportunity:viable]).

activity_space(stakeholder_satisfaction, name,"Ensure Stakeholder Satisfaction").
activity_space(stakeholder_satisfaction, description, ["Share the results of the development work with the stakeholders to gain their acceptance of the system produced and verify that the opportunity has been successfully addressed"]).
activity_space(stakeholder_satisfaction, points, "Ensure the satisfaction of the stakeholders to" items ["Get approval for the deployment of the system","Validate that the system is of benefit to the stakeholders","Validate that the system is acceptable to the stakeholders","Independently verify that the system delivered is the one required","Confirm the expected benefit that the system will provide"]).
activity_space(stakeholder_satisfaction, input, [stakeholders, opportunity, requirements, software_system]).
activity_space(stakeholder_satisfaction, entry, [stakeholders:in_agreement, opportunity:value_established]).
activity_space(stakeholder_satisfaction, completion, [stakeholders:deployment, opportunity:addressed]).

activity_space(use_the_system, name,"Use the System").
activity_space(use_the_system, description, ["Observe the use of the system in a live environment and how it benefits the stakeholders"]).
activity_space(use_the_system, points, "Use the system to" items ["Generate measurable benefits", "Gather feedback from the use of the system", "Confirm that the system meets the expectations of the stakeholders", "Establish the return-on-investment for the system"]).
activity_space(use_the_system, input, [stakeholders, opportunity, requirements, software_system]).
activity_space(use_the_system, entry, [stakeholders:deployment, opportunity:addressed]).
activity_space(use_the_system, completion, [stakeholders:in_use, opportunity:benefit_acrued]).

activity_space(understand_requirements, name,"Understand the Requirements").
activity_space(understand_requirements, description, ["Establish a shared understanding of what the system to be produced must do."]).
activity_space(understand_requirements, points, "Understand the requirements to" items ["Scope the system","Understand how the system will generate value","Agree on what the system will do","Identify specific ways of using and testing the system","Drive the development of the system"]).
activity_space(understand_requirements, input, [ stakeholders, opportunity, requirements, software_system, work, wow]).
activity_space(understand_requirements, entry, []).
activity_space(understand_requirements, completion, [ requirements:coherent]).

activity_space(shape_system, name,"Shape the system").
activity_space(shape_system, description, ["Shape the system so that it is easy to develop, change and maintain, and can cope with current and expected future demands. This includes the overall design and architecting of the system to be produced"]).
activity_space(shape_system, points, "Shape the system to" items ["Structure the system and identify the key system elements", "Assign requirements to elements of the system","Ensure that the architecture is suitably robust and flexible"]).
activity_space(shape_system, input, [stakeholders, opportunity, requirements, software_system, work, wow]).
activity_space(shape_system, entry, [requirements:coherent]).
activity_space(shape_system, completion, [requirements:acceptable, software_system:arch_selected]).

activity_space(implement_system, name,"Implement the System").
activity_space(implement_system, description, ["Build a system by implementing, testing, and integrating one or more system elements. This includes bug fixing and unit testing"]).
activity_space(implement_system, points, "Implement the system to" items ["Create a working system", "Develop, integrate, and test the system elements", "Increase the number of requirements implemented", "Fix defects","Improve the system"]).
activity_space(implement_system, input, [requirements,software_system, wow]).
activity_space(implement_system, entry, [software_system:arch_selected]).
activity_space(implement_system, completion, [software_system:ready]).

activity_space(test_system, name,"Test the System"). 
activity_space(test_system, description, ["Verify that the system produced meets the stakeholders’ requirements"]).
activity_space(test_system, points, "Test the system to" items ["Verify that the software system matches the requirements", "Identify any defects in the software system"]).
activity_space(test_system, input,[requirements, software_system, wow]).
activity_space(test_system, entry, [requirements:acceptable, software_system:arch_selected]).
activity_space(test_system, completion, [requirements:fulfilled, software_system:ready]).

activity_space(deploy_system, name,"Deploy the System").
activity_space(deploy_system, description, ["Take the tested system and make it available for use outside the development team"]).
activity_space(deploy_system, points, "Deploy the system to" items ["Package the software system up for delivery to the live environment", "Make the software system operational"]).
activity_space(deploy_system, input,[stakeholders, software_system, wow]).
activity_space(deploy_system, entry, [software_system:ready]).
activity_space(deploy_system, completion,[ software_system:operational]).

activity_space(operate_system, name,"Operate the System").
activity_space(operate_system, description, ["Support the use of the software system in the live environment"]).
activity_space(operate_system, points, "Operate the system to" items ["Maintain service levels", "Support the stakeholders who use the system","Support the stakeholders who deploy, operate, and help support the system"]).
activity_space(operate_system, input, [ stakeholders, opportunity, requirements, software_system, wow]).
activity_space(operate_system, entry,[ software_system:ready]).
activity_space(operate_system, completion, [ software_system:retired]).

activity_space(prepare_work, name,"Prepare to do the Work").
activity_space(prepare_work, description, ["Set up the team and its working environment. Understand and commit to completing the work"]).
activity_space(prepare_work, points, "Prepare to do the work to" items  ["Put the initial plans in place", "Establish the initial wow", "Assemble and motivate the initial project team", "Secure funding and resources"]).
activity_space(prepare_work, input, [stakeholders, opportunity, requirements]).
activity_space(prepare_work, entry, []).
activity_space(prepare_work, completion, [team:seeded, wow:foundation_established, work:prepared]).

activity_space(coordinate_activity, name,"Coordinate Activity").
activity_space(coordinate_activity, description, ["Co-ordinate and direct the team’s work. This includes all on-going planning and re-planning of the work, and re-shaping of the team"]).
activity_space(coordinate_activity, points, "Coordinate activity to" items ["Select and prioritize work","Adapt plans to reflect results","Get the right people on the team", "Ensure that objectives are met","Handle change"]).
activity_space(coordinate_activity, input, [ requirements, team, work, wow]).
activity_space(coordinate_activity, entry, [ team:seeded, work:prepared]).
activity_space(coordinate_activity, completion,[ team:formed, work:under_control]).

activity_space(support_team, name,"Support the Team").
activity_space(support_team, description, ["Help the team members to help themselves, collaborate and improve their way of working"]).
activity_space(support_team, points, "Support the team to" items ["Improve team working", "Overcome any obstacles", "Improve ways of working"]).
activity_space(support_team, input, [ team, work, wow]).
activity_space(support_team, entry, [ team:formed, wow:foundation_established]).
activity_space(support_team, completion, [ team:collaborating, wow:in_place]).

activity_space(track_progress, name,"Track Progress").
activity_space(track_progress, description,["Meeasure and assess the progress made by the team"]).
activity_space(track_progress, points, "Track progress to" items ["Evaluate the results of work done","Measure progress","Identify impediments"]).
activity_space(track_progress, input,[ requirements, team, work, wow]).
activity_space(track_progress, entry,[ team:collaborating, wow:in_place, work:started]).
activity_space(track_progress, completion, [ team:performing, wow:working_well, work:concluded]).

activity_space(stop_work, name, "Stop the Work").
activity_space(stop_work, description, ["Shut-down the software engineering endeavor and hand over of the team’s responsibilities"]).
activity_space(stop_work, points, "Stop the work to" items ["Close the work","Hand over any outstanding responsibilities","Hand over any outstanding work items","stand down the team","Archive all work done"]).
activity_space(stop_work, input, [requirements, team, work, wow]).
activity_space(stop_work, entry, [team:performing, wow:working_well, work:concluded]).
activity_space(stop_work, completion, [team:adjourned, wow:retired, work:closed]).		

%
% Competency and levels
%

competency(stakeholder_representation, name, "Stakeholder Representation").
competency(stakeholder_representation, description, ["This competency encapsulates the ability to gather, communicate, and balance the needs of other stakeholders, and accurately represent their views"]).
competency(stakeholder_representation, type, generic).

competency(analysis, name, "Analysis").
competency(analysis, description, ["This competency encapsulates the ability to understand opportunities and their related stakeholder needs, and transform them into an agreed and consistent set of requirements"]).
competency(analysis, type, generic).

competency(development, name, "Development").
competency(development, description, ["This competency encapsulates the ability to design and program effective software systems following the standards and norms agreed by the team"]).
competency(development, type, generic).

competency(testing, name, "Testing").
competency(testing, description, ["This competency encapsulates the ability to test a system, verifying that it is usable and that it meets the requirements"]).
competency(testing, type, generic).

competency(leadership, name, "Leadership").
competency(leadership, description, ["This competency enables a person to inspire and motivate a group of people to achieve a successful conclusion to their work and to meet their objectives"]).
competency(leadership, type, generic).

competency(management, name, "Management").
competency(management, description, ["This competency encapsulates the ability to coordinate, plan and track the work done by a team"]).
competency(management, type, generic).

% The Generic Competency type and levels

competency_type(generic, name, "Generic").
competency_type(generic, description, ["A default list of competency levels."]).
competency_type(generic, levels, [assists, applies, masters, adapts, innovates]).

competency_level(assists, name, "Assists").
competency_level(assists, description, ["Demonstrates a basic understanding of the concepts involved and can follow instructions"]).

competency_level(applies, name, "Applies").
competency_level(applies, description, ["Able to apply the concepts in simple contexts by routinely applying the experience gained so far"]).

competency_level(masters, name, "Masters").
competency_level(masters, description, ["Able to apply the concepts in most contexts and has the experience to work without supervision"]).

competency_level(adapts, name, "Adapts").
competency_level(adapts, description, ["Able to apply judgment on when and how to apply the concepts to more complex contexts. Can make it possible for others to apply the concepts"]).

competency_level(innovates, name, "Innovates").
competency_level(innovates, description, ["A recognized expert, able to extend the concepts to new contexts and inspire others"]).

