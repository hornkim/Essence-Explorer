:- discontiguous alpha/3.
:- discontiguous state/3.
:- discontiguous activity_space/3.
:- discontiguous concern_element/4.
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
% Practice Concern Map
%

practice(architecture, name, "Architecture").
practice(architecture, description, ["The Architecture practice describes what has to be done to manage the architecture of a system, now and into the future. The 'system' covers the business, software, application and technical aspects."]).
practice(architecture, resources, [architecture_detail]).

concern_element(alpha, architecture, solution, current_architecture).
concern_element(alpha, architecture, solution, target_architecture).
concern_element(alpha, architecture, solution, solution_architecture).
concern_element(alpha, architecture, solution, reference_architecture).
concern_element(alpha, architecture, solution, architectural_decision).

concern_element(activity, architecture, solution, understand_solution_context).
concern_element(activity, architecture, solution, understand_solution_requirements).
concern_element(activity, architecture, solution, solution_options_identified).
concern_element(activity, architecture, solution, solution_refined).
concern_element(activity, architecture, solution, outline_the_solution).
concern_element(activity, architecture, solution, plan_implement_solution).
concern_element(activity, architecture, solution, dev_arch_poc).
concern_element(activity, architecture, solution, current_arch_managed).
concern_element(activity, architecture, solution, current_arch_updated).
concern_element(activity, architecture, solution, target_arch_managed).
concern_element(activity, architecture, solution, target_architecture_updated).
concern_element(activity, architecture, solution, arch_roadmap).
concern_element(activity, architecture, solution, review_architecture).
concern_element(activity, architecture, solution, target_architecture_updated).
concern_element(activity, architecture, solution, reference_arc_blueprint).

concern_element(work_product, architecture, solution, soap).
concern_element(work_product, architecture, solution, scd).
concern_element(work_product, architecture, solution, model). 
concern_element(work_product, architecture, solution, target_sad_doc).
concern_element(work_product, architecture, solution, current_sad_doc).
concern_element(work_product, architecture, solution, system_arch_doc).
concern_element(work_product, architecture, solution, ref_impl_blue).
concern_element(work_product, architecture, solution, arch_poc).

concern_element(work_product, architecture, solution, arch_dec_rec).
concern_element(work_product, architecture, solution, arch_dec_log).

concern_element(role, architecture, solution, solution_architect).
concern_element(role, architecture, solution, program_architect).
concern_element(competency, architecture, solution, architecture_competency).

concern_element(pattern, architecture, solution, technical_complexity).
concern_element(pattern, architecture, solution, arch_principal).

concern_element(resource, architecture, solution, cur_arch_detail). 
concern_element(resource, architecture, solution, target_arch_detail).  
concern_element(resource, architecture, solution, sol_arch_detail).  
concern_element(resource, architecture, solution, sol_arch_guide).
concern_element(resource, architecture, solution, ref_arch_detail).  
concern_element(resource, architecture, solution, arch_decision_detail).  
concern_element(resource, architecture, solution, soap_detail). 
concern_element(resource, architecture, solution, soap_template). 
concern_element(resource, architecture, solution, sys_context_detail).  
concern_element(resource, architecture, solution, model_detail).  
concern_element(resource, architecture, solution, sad_detail).  
concern_element(resource, architecture, solution, arch_poc_detail).  
concern_element(resource, architecture, solution, arch_princ_detail).  
concern_element(resource, architecture, solution, technical_complexity_guidance).



% ----------------------
%          Alphas
% -----------------------

%
% Alphas - Current Archetecture
%

alpha(current_architecture, name, "Current Architecture").
alpha(current_architecture, description, ["The Current Architecture describes the 'as is' or baseline state of an application, system or platform. It cumulatively unifies emergent design, intentional design, the SOAPs and Solution Blueprints.", 
	"In building new solutions it may be prohibitive for an architect to gain a working understanding of the current system without good quality requirements, significant prior experience and understanding. Taking the time to understand the current system may significantly delay the work. The current architecture play a critical role in explaining what exists now, the choices made, quickly and easily, to make new development more agile." ]).
alpha(current_architecture, states, [ca_changes_identified, ca_new_items_described, ca_models_updated, ca_current_accepted]).
alpha(current_architecture, resources, [cur_arch_detail]).

state(ca_changes_identified, alpha, current_architecture).
state(ca_changes_identified, name, "Changes Identified").
state(ca_changes_identified, description, ["New implemented requirements and system changes have been Identified. These are reviewed for those impacting the architecture.
"]).
state(ca_changes_identified, checks, ["New requirements are available for the system, that suggest new designs or a changed architecture.",
	"A new SOAP or Solution Architecture has been produced and implemented", "Emergent design has been communicated or discovered", "Other systems have integrated to this system.",
	"Other Stakeholders have changed the system, e.g. API changes or Data base changes."]).

state(ca_new_items_described, alpha, current_architecture).
state(ca_new_items_described, name, "New or Modified Components Described").
state(ca_new_items_described, description, ["The significant new or changed Components and Interfaces are described, along with the important Decisions made. These may be driven by a changed context e.g. new channels, integrations or user types."]).
state(ca_new_items_described, checks, ["New channels, interfaces or changed APIs captured","New components described","Changed Components described","Platform and Infrastructure changes captured","Architectural Decisions captured"]).

state(ca_models_updated, alpha, current_architecture).
state(ca_models_updated, name, "Models and Views Updated").
state(ca_models_updated, description, ["The model is updated and the required views generated"]).
state(ca_models_updated, checks, ["The Models and Views are Updated"]).

state(ca_current_accepted, alpha, current_architecture).
state(ca_current_accepted, name, "Accepted").
state(ca_current_accepted, description, ["The new description of the current system architecture is accepted by Stakeholders"]).
state(ca_current_accepted, checks, ["Accepted State is Achieved"]).

%
% Alphas - Target Archetecture
%

alpha(target_architecture, name, "Target Architecture").
alpha(target_architecture, description, ["The Target, Future State, or 'to be' Architecture embodies the significant design decisions, principles and goals for the future state of a system, application or Digital Platform.",
	"This architecture supports the future goals and strategy of the business or product, any new capabilities, business processes, data information, and application services required to meet these.",
	"The description of the future state enables the right people to understand what must be done to meet the Enterprise goals, objectives, mission, and vision in the context within which the Enterprise operates.",
	"This architecture also aligns the system with future IT and Integration changes, dependencies on other systems, stakeholders, teams and initiatives. It helps the whole of IT evolve in a coordinated manner."]).
alpha(target_architecture, states, [ta_goals_identified, ta_approaches_agreed, ta_models_agreed, ta_future_accepted]).
alpha(target_architecture, resources, [target_arch_detail]).

state(ta_goals_identified, alpha, target_architecture).
state(ta_goals_identified, name, "Architectural Goals Identified").
state(ta_goals_identified, description, ["The future goals of the product or systems are identified used to drive the potential future changes to the system."]).
state(ta_goals_identified, checks, ["The Product, Enterprise Archiecture and IT strategy are understood", "The future initiatives are understood and analysed for impact on the system", "The goals for the system are identified"]).

state(ta_approaches_agreed, alpha, target_architecture).
state(ta_approaches_agreed, name, "Approaches and Decisions Agreed").
state(ta_approaches_agreed, description, ["The new approaches and Architectural Decisions Finalised"]).
state(ta_approaches_agreed, checks, ["Approaches are agreed.", "The Architectural Decisions have been Approved"]).

state(ta_models_agreed, alpha, target_architecture).
state(ta_models_agreed, name, "Views Agreed and Modelled").
state(ta_models_agreed, description, ["The model is updated and the required views generated"]).
state(ta_models_agreed, checks, ["The Model is are Agreed and Updated.", "The Views are Agreed and Updated"]).

state(ta_future_accepted, alpha, target_architecture).
state(ta_future_accepted, name, "Accepted").
state(ta_future_accepted, description, ["The target architecture is accepted by Stakeholders"]).
state(ta_future_accepted, checks, ["The Accepted state is achieved"]).

%
% Alphas - Solution Architecture
%

alpha(solution_architecture, name, "Solution Architecture").
alpha(solution_architecture, description, ["The Solution Architecture embodies the significant intentional decisions, principles and trade-offs made regarding a particular change to a system. A set of views is provided to cater for different Stakeholder needs",
	 "Solution architecture can be viewed as providing constraints on design, and thus guiding a system implementation. The solution could be software and or technical architecture components"]).
alpha(solution_architecture, points, "Requires" items ["Architecturally Agreed Requirements, both functional and non-functional, the systemic-qualities.",
	"Justification of how the solution provides the requirements.",
	"Agreed Solution Context from prior SOAP, updated based on more detailed requirements.", 
	"Managed Architectural Decisions",
	"Discussion of solution options, and justification of the final choice, with tradeoffs explained.", 
	"Agreed model views and viewpoints for the stakeholders.", 
	"Discussion of how the solution will be validated and the requirements objectively tested"]).
alpha(solution_architecture, states, [sa_scope_defined, sa_rqmts_identified, sa_solution_identified,sa_solution_agreed, sa_views_models_agreed, sa_established, sa_validated]).
alpha(solution_architecture, resources, [sol_arch_detail,sol_arch_guide]).

state(sa_scope_defined, alpha, solution_architecture).
state(sa_scope_defined, name, "Scope and Complexity Defined").
state(sa_scope_defined, description, ["The goal is to establish the scope complexity, and extent of the system, determine the boundaries of the solution, and get this agreed amongst stakeholders early on."]).
state(sa_scope_defined, checks, ["Solution complexity is understood","The scope and problem are defined","Complexity and Scope is agreed amongst stakeholders"]).

state(sa_rqmts_identified, alpha, solution_architecture).
state(sa_rqmts_identified, name, "Solution Requirements Identified").
state(sa_rqmts_identified, description, ["Architectural scenarios are identified to understand and pinpoint the requirements on the architecture.",
	"The solution has been deemed potentially technically complex, and solution options are required."]).
state(sa_rqmts_identified, checks, ["The goals of the new solution have been identified and described with clear evaluation criteria.",
	"Any constraints that apply to the architecture have been identified and described.",
	"Scenarios describing the changes have been documented.",
	"A Domain Model has been created "]).

state(sa_solution_identified, alpha, solution_architecture).
state(sa_solution_identified, name, "Candidate Solutions Identified").
state(sa_solution_identified, description, ["Solution options are elaborated and reviewed. POCs carried out to eliminate risk or determine Systemic Quality issues. A single solution is identified, the trade offs and rationale described.",
	"There are many possible architectures that could be selected to support the development of the software system. The various options will need to be explored and assessed against the architectural goals and constraints. Trade-offs will have to be made between the different architectural characteristics to produce an architecture that is fit for purpose. In addition, some of the architectural requirements may have to be negotiated to keep development costs under control."]).
state(sa_solution_identified, checks, ["Solution Options Elaborated",
	"POCS carried out where required",
	"Solution Options ranked and one chose and justified",
	"Peer review by architecture team",
	"Stakeholders informed of options and choice",
	"Decisions documented for approval"]).

state(sa_solution_agreed, alpha, solution_architecture).
state(sa_solution_agreed, name, "Solution and Decisions Agreed").
state(sa_solution_agreed, description, ["The architectural decisions are documented and agreed by stakeholders. The components are decided and applicable to teams.",
	"The testing approach for the architecture is determined and tests identified."]).
state(sa_solution_agreed, checks, ["Build vs Buy vs Open Source Vs Re-use decisions made.",
	"Patterns, Frameworks and Styles selected",
	"Architectural decisions documented and agreed",
	"Component choices have been made, justified and related to team structures",
	"Architectural tests identified"]).

state(sa_views_models_agreed, alpha, solution_architecture).
state(sa_views_models_agreed, name, "Views Agreed and Modelled").
state(sa_views_models_agreed, description, ["Each stakeholder has a particular viewpoint and requires specific views on the system. The views portray a viewpoint on the system model. As the solution is unique the set of views needs to be evaluated and agreed for each solution."]).
state(sa_views_models_agreed, checks, ["Views are created to satisfy the stakeholders",
	"The models are updated and views generated"]).

state(sa_established, alpha, solution_architecture).
state(sa_established, name, "Established").
state(sa_established, description, ["The architecture is established by building and demonstrating a software system which creates confidence that the most appropriate solution has been chosen. The best way to do this is implement a skinny, keleton, system and execute those architectural scenarios considered the most difficult or risky; successful execution provides evidence that the selected architecture is a suitable choice.",
	"Risks and issues have been resolved and tradeoffs agreed with stakeholders.",
	"The architecture documentation is finalised including the views, decisions and justifications for choices. How the non-functional requirements are satisfied is fully explained."]).
state(sa_established, checks, ["Key features and unknown characteristics of the architecture have been identified for exploration.",
	"Just enough of the architecture has been implemented to address these areas of concern.",
	"An executable skinny system has been built.",
	"The most difficult or risky architectural scenarios have been demonstrated.",
	"Demonstration results have been gathered to justify selection of the architecture."]).

state(sa_validated, alpha, solution_architecture).
state(sa_validated, name, "Validated").
state(sa_validated, description, ["The architecture is validated by architectural tests being executed and evaluated; the corresponding test results have been captured, analyzed and approved.","Architectural tests need to be run against for every release of the software system, not just the initial architectural prototypes."]).
state(sa_validated, checks, ["The software system, starting with the initial skinny system and continuing as the system evolves, has been proven to meet the architectural requirements.", "The system is reviewed for compliance to the architecture."]).

%
% Alphas - Reference Architecture
%

alpha(reference_architecture, name, "Reference Architecture").
alpha(reference_architecture, description, ["A Reference Architecture provides a template or blueprint solution for a particular domain, or Digital Platform, together with a working implementation.",
	"This architecture may use styles, frameworks and patterns, and provides a common vocabulary with which to discuss implementations, often with the aim to stress commonality, and proven concept re-use",
	"Rather than being academic a templated implementation; a concrete buildable and runnable 'skinny' system, is provided. The implementation demonstrates empirically the quality benefits of the blueprint, with built in tests for the targeted requirements.",
	"The implementation and documentation requires ongoing maintenance and re-architecture, as the frameworks and platforms employed will be upgraded and change. Dedicated support is critical to keep a reference architecture relevant."]).
alpha(reference_architecture, states, [ra_rqmts_identified, ra_dommain_bounded, ra_styles_chosen, ra_built, ra_documented]).
alpha(reference_architecture, resources, [ref_arch_detail]).

state(ra_rqmts_identified, alpha, reference_architecture).
state(ra_rqmts_identified, name, "Architectural Requirements Identified").
state(ra_rqmts_identified, description, ["The Requirements are identified"]).
state(ra_rqmts_identified, checks, ["The functional Requirments are identified", "The Non-Functional requirements are identified"]).

state(ra_dommain_bounded, alpha, reference_architecture).
state(ra_dommain_bounded, name, "Domain Bounded").
state(ra_dommain_bounded, description, ["The Reference Architecture domain is bounded and well understood"]).
state(ra_dommain_bounded, checks, ["The domain is bounded", "The domain is modelled and understood"]).

state(ra_styles_chosen, alpha, reference_architecture).
state(ra_styles_chosen, name, "Styles, Patterns and Frameworks chosen").
state(ra_styles_chosen, description, ["The Reference Architecture provides a guiding Styles, and specifies Patterns and Frameworks to guide the design and implementation"]).
state(ra_styles_chosen, checks, ["The overarching Style is chosen", "The Patterns are chosen", "The Frameworks are chosen"]).

state(ra_built, alpha, reference_architecture).
state(ra_built, name, "Implementation Built").
state(ra_built, description, ["The implementation is built and tested"]).
state(ra_built, checks, ["The Implementation is built","The functional tests pass", "The non-functional tests pass"]).

state(ra_documented, alpha, reference_architecture).
state(ra_documented, name, "The documentation is complete").
state(ra_documented, description, ["The implemtation is described in a SAD"]).
state(ra_documented, checks, ["The Models and views are complete", "The decisions are complete.", "The SAD is completed"]).


%
% Alphas - Architectural Decision
%

alpha(architectural_decision, name, "Architectural Decision").
alpha(architectural_decision, description, ["An Architectural Decision adresses an architectural issues about additions, subtractions and modifications to the architecture that require non triveal decision making and trade offs.",
	"A Decision is documented in an Architectural Decision Record (ADR) work product. The deciosn are recorded in an Architectural Decision Record Log"]).
alpha(architectural_decision, states, [ad_identified, ad_proposed,ad_changed,ad_finalised ]).
alpha(architectural_decision, detail, "architectural_decision.html").
alpha(architectural_decision, resources, [arch_decision_detail]).

state(ad_identified, alpha, architectural_decision).
state(ad_identified, name, "Decision Issue Identified").
state(ad_identified, description, ["The Issue is identified, recorded, and logged"]).
state(ad_identified, checks, ["The decisoin issue is identified", "The decision issue is recorded", "The decision issue is logged"]).

state(ad_proposed, alpha, architectural_decision).
state(ad_proposed, name, "Proposed").
state(ad_proposed, description, ["The Decision is proposed for review, where is can be accpted or rejected"]).
state(ad_proposed, checks, ["The decision is proposed for review", "the decison is reviewed"]).

state(ad_changed, alpha, architectural_decision).
state(ad_changed, name, "Changed").
state(ad_changed, description, ["The decision is not rejected but accepeted with change"]).
state(ad_changed, checks, ["The decision is updated to meet approval"]).

state(ad_finalised, alpha, architectural_decision).
state(ad_finalised, name, "Finalised").
state(ad_finalised, description, ["The decison has been Accepted / Rejected/ Superseeded"]).
state(ad_finalised, checks, ["The decision is finalised", "The result is logged"]).


%-----------------   
%    Activities
%-----------------
%
%
% You need to gather and analyze relevant information from various sources, such as business stakeholders, users, domain experts, existing systems, industry standards, and best practices. You need to identify and prioritize the functional and non-functional requirements, the risks and assumptions, and the success criteria and metrics. 
% You need to communicate and validate your understanding with the relevant stakeholders and get their feedback and approval.

activity(understand_solution_context, name, "Understand Problem and Context").
activity(understand_solution_context, description, ["Context analysis begins with an understanding of the actors, human or system, the boundaries of the solution, and understanding the business problem. The goal is to establish the scope and extent of the system, the technical complexity and get this agreed amongst stakeholders early on. The aim is to gain consensus with sponsors.The Solution Complexity will determine the type of architecture team involvement (see Pattern).",
	"The system boundaries helps understand dependencies with other teams, and the type of interfaces amongst them. The boundaries also define the integrations with other systems both internal and external. A number of relationships could exist between teams; it may be collaborative, client-service or a facilitating one. These need to be understood.",
	"Early on the complexity of the problem needs to be clarified. This begins with understanding the complexity of the interactions with actors both human and system.",
	"The SOAP provides a succinct description of the scope and problem. Solution Context Diagrams help explain the scope and boundaries of the endeavour.",
	"if this is a Greenfields system then the Solution is a new system, otherwise it is a change to a system.",
	"The aim is to provide just enough detail to allow decisions to be made on resourcing next steps, align stakeholders and understand the context."]).
activity(understand_solution_context, competencies, [stakeholder_representation at_level 3, analysis at_level 3, architecture_competency at_level 3]).
activity(understand_solution_context, entry, []).
activity(understand_solution_context, roles, [solution_architect]).
activity(understand_solution_context, patterns, []).
activity(understand_solution_context, part_of, understand_requirements ).

action(understand_solution_context, optional, update, to_achieve soap to_detail soap_high_level).
action(understand_solution_context, optional, update, to_achieve solution_architecture to_state sa_scope_defined or beyond).
action(understand_solution_context, mandatory, update, contributes_to scd to_detail scd_high_level or beyond).
action(understand_solution_context, mandatory, update, contributes_to solution_architecture to_state sa_rqmts_identified or beyond).


activity(understand_solution_requirements, name, "Understand Solution Requirements").
activity(understand_solution_requirements, description, ["The initial architectural requirements are identified with the non-functional quality attributes and constraints defined. The required non-functional metrics and any tests for these clarified.",
	"If its a Greenfield project then the architecturally significant requirements have been prioritised from the complete set of requirements.",
	"The architect is responsible for further identifying and analysing requirements that are significant to the solution."]).
activity(understand_solution_requirements, points, "Requirements gathering and solution architecture is an iterative process: " items ["Some requirements may need to be revisited when decisions about the solution are being made.",
	"Some requirements may be too expensive, are hard to achieve given constraints, and these traded off.",
	"Business requirements will result in derived technical requirements.",
	"Non-functional requirements will expand to more detailed scenarios, with associated metrics.",
	"Constraints will need to be clarified for impact."]).
activity(understand_solution_requirements, competencies, [stakeholder_representation at_level 3, analysis at_level 3]).
activity(understand_solution_requirements, entry, []).
activity(understand_solution_requirements, roles, [solution_architect]).
activity(understand_solution_requirements, patterns, []).
activity(understand_solution_requirements, part_of, understand_requirements ).

action(understand_solution_requirements, optional, update, to_achieve soap to_detail soap_conceptual).
action(understand_solution_requirements, optional, update, to_achieve solution_architecture to_state sa_rqmts_identified or beyond).
action(understand_solution_requirements, mandatory, update, contributes_to requirements to_state coherent or beyond).
action(understand_solution_requirements, mandatory, update, contributes_to system_arch_doc to_detail sad_high_level).


activity(solution_options_identified, name, "Solution Options Identified").
activity(solution_options_identified, description, ["The construction of the architecture starts with a set of candidate solutions.",
	"The application layers address the functional requirements, and the platform layers the non-functional. Each application layer solution may have alternative platforms or set of platform options available.",
	"Different components and mechanisms may be applicable at different layers.The candidate solutions are ranked. Ranking depends on the requirements match and may have to trade off, quality, cost etc.",
	"The time and cost to explore options is determined, and a cut off established. "]).
activity(solution_options_identified, competencies, [stakeholder_representation at_level 3, analysis at_level 3]).
activity(solution_options_identified, entry, [requirements:bounded]). 
activity(solution_options_identified, roles, [solution_architect]).
activity(solution_options_identified, patterns, []).
activity(solution_options_identified, part_of, shape_system).

action(solution_options_identified, mandatory, update, contributes_to solution_architecture to_state sa_solution_identified).
action(solution_options_identified, mandatory, update, contributes_to architectural_decision to_state ad_identified).


activity(solution_refined, name, "Solution Refined").
activity(solution_refined, description, ["POCs may be required to quantitatively test and tangibly resolve problems and issues. The result may rule out candidates. The requirements may change or need refinement as things are discovered, which in effect may cause re-architecture.",
	"Architectural decisions may need to be made and documented. The capabilities and resources available to implement the system may be key at this stage, and raise problems, risks, issues or constraints. Reducing team dependencies and communications needs to be taken into account.",
	"A single candidate solution is determined that best balances the tradeoffs."]).
activity(solution_refined, points, "The candidate solutions are examined and iteratively ruled out, following these steps:" items ["Analyse problems, risks, unknowns and uncertainties.",
	"Choose strategies to resolve the problems or a subset.",
	"Restructure the potential architecture, and rule out options.",
	"Repeat until a suitable candidate is found."]).
activity(solution_refined, competencies, [stakeholder_representation at_level 3, analysis at_level 3]).
activity(solution_refined, entry, []).
activity(solution_refined, roles, [solution_architect]).
activity(solution_refined, patterns, []).
activity(solution_refined, part_of, shape_system ).

action(solution_refined, mandatory, update, contributes_to solution_architecture to_state sa_solution_agreed).
action(solution_refined, mandatory, update, contributes_to architectural_decision to_state ad_identified or beyond).


activity(outline_the_solution, name, "Outline the Solution").
activity(outline_the_solution, description, ["The chosen solution is described in the SOAP and or the Solution Blueprint. Which of these is used is determined by the soluton complexity and extent, and the needs of stakeholders.",
	"Importantly, the team structure is relevant in deciding the extend of these documents. Mature teams may require considerably less detail than less experienced.",
	"The solution blueprint requires a set of viewpoints to be chosen that are relevant to the concerns of the stakeholders. The architecture is modelled and views generated. The documents are kept lean with just enough detail to meet stakeholder, the team maturity, and corporate needs.",
	"The chosen solution is presented to stakeholders and agreement is obtained to go ahead."]).
activity(outline_the_solution, competencies, [stakeholder_representation at_level 3, analysis at_level 3]).
activity(outline_the_solution, entry, [soap:soap_conceptual,requirements:coherent]).
activity(outline_the_solution, roles, [solution_architect]).
activity(outline_the_solution, patterns, []).
activity(outline_the_solution, part_of, shape_system ).

action(outline_the_solution, optional, update, to_achieve system_arch_doc to_detail sad_high_level).
action(outline_the_solution, mandatory, update, to_achieve solution_architecture to_state sa_solution_agreed).
action(outline_the_solution, mandatory, update, contributes_to solution_architecture to_state sa_views_models_agreed or beyond). 
action(outline_the_solution, mandatory, update, contributes_to model to_detail high_level_view or beyond).


activity(plan_implement_solution, name, "Plan and Implement the Solution").
activity(plan_implement_solution, description, ["The solution implementation needs to be planned and aligned with teams and resources. The systemic qualities of 'buildability' and 'planability' are the focus. The resources required to build the system can impact the architecture, and vica versa. Work may need to be partitioned (security, location, skills) and thus implemented as seperate components.",
	"The team structures also impacts the system. Has the architecture been designed appropriately for the existing teams or the teams will change to suit the new solution. The capabilities of the teams will need to be analysed and how the architecture is delivered planned, across teams or across time.",
	"The type of relationships between teams needs to be clarified and it understood how they will be engaged. For example a Platform team may provide services for a stream aligned team. A complicated subsystem team may be created to reduce the load of a stream-aligned team.",
	"Risks needs to be managed and ultimately be under control. POCs may need to be planned prior to other parts of the solution. The work thus needs to be partitioned based on the architecture, and the development and implementation strategy selected. Estimation will be more refined and accurate at this stage.",
	"The architecture is validated by its completion as an implemented change to the system. The required non-functional metrics are demonstrated in the production system."]).
activity(plan_implement_solution, competencies, [stakeholder_representation at_level 3, analysis at_level 3]).
activity(plan_implement_solution, entry, []).
activity(plan_implement_solution, roles, [solution_architect]).
activity(plan_implement_solution, patterns, []).
activity(plan_implement_solution, part_of, shape_system ).

action(plan_implement_solution, mandatory, update, to_achieve solution_architecture to_state sa_established or beyond).
action(plan_implement_solution, optional, update, contributes_to system_arch_doc to_detail sad_high_level or beyond).


activity(dev_arch_poc, name, "Develop an Architectural POC").
activity(dev_arch_poc, description, ["A POC is developed to test a specific hypothesis based on controlled scientific approach. This may relate to resolving a risk, checking that non-functional requirements can be met by a candidate solution, checking the capability of teams or learning a new technology."]).
activity(dev_arch_poc, competencies, [stakeholder_representation at_level 3, analysis at_level 3, architecture_competency at_level 3]).
activity(dev_arch_poc, entry, []).
activity(dev_arch_poc, roles, [solution_architect]).
activity(dev_arch_poc, patterns, []).
activity(dev_arch_poc, part_of, shape_system ).

action(dev_arch_poc, optional, update, to_achieve arch_poc to_detail arch_poc_high_level or beyond).
action(dev_arch_poc, mandatory, update, contributes_to architectural_decision to_state ad_identified or beyond).
action(dev_arch_poc, mandatory, update, contributes_to solution_architecture to_state sa_solution_identified or beyond). 


activity(current_arch_managed, name, "Current Architecture Managed").
activity(current_arch_managed, description, ["The Current Architecture is continually monitored and reviewed for changes as it evolves. New intentional solutions, bug fixes and emergent design will result in changes that need to be captured. Minor changes to the system, captured by developers in design, may be imported or referenced to organise the system description.
"]).
activity(current_arch_managed, competencies, [stakeholder_representation at_level 3, analysis at_level 3, architecture_competency at_level 3]).
activity(current_arch_managed, entry, [solution_architecture:sa_validated, system_arch_doc:sad_high_level]).
activity(current_arch_managed, roles, [solution_architect]).
activity(current_arch_managed, patterns, []).
activity(current_arch_managed, part_of, shape_system ).

action(current_arch_managed, mandatory, update, contributes_to current_architecture to_state ca_changes_identified or beyond). 
action(current_arch_managed, optional, update, contributes_to current_sad_doc to_detail csad_high_level or beyond).


activity(current_arch_updated, name, "Current Architecture Updated").
activity(current_arch_updated, description, ["The identified changes to the current system are incorporated in the Current System Architecture"]).
activity(x, points, "The changesinclude:" items ["New Views Established",
	"Views and Models are updated",
	"Changes Agreed and validated against system"]).
activity(current_arch_updated, competencies, [stakeholder_representation at_level 3, analysis at_level 3]).
activity(current_arch_updated, entry, []).
activity(current_arch_updated, roles, [solution_architect]).
activity(current_arch_updated, patterns, []).
activity(current_arch_updated, part_of, shape_system ).

action(current_arch_updated, mandatory, update, contributes_to current_architecture to_state ca_new_items_described or beyond). 
action(current_arch_updated, optional, update, contributes_to current_sad_doc to_detail csad_high_level or beyond).


activity(target_arch_managed, name, "Target Architecture Managed").
activity(target_arch_managed, description, ["Target architecture changes are not often based on agreed requirements but based on strategy, future goals, and directions. These may relate to Enterprise Architecture, IT in general, other systems directions or the future needs of the business or product team. ",
	"New capabilities may be required for the product or business, that require future initiatives to deliver. New IT capabilities may be coming available in the future that the system can employ.",
	"Technical debt may also play a strong role, for example, where legacy components need to be retired, components that do not meet quality requirements upgraded, platform components that are no longer supported replaced, or upgraded components brought into line.",
	"The target architecture generally shows a high level response to the kinds of changes, and how the future system will incorporate them, and evolve."]).
activity(target_arch_managed, competencies, [stakeholder_representation at_level 3, analysis at_level 3,  architecture_competency at_level 3]).
activity(target_arch_managed, entry, []).
activity(target_arch_managed, roles, [solution_architect]).
activity(target_arch_managed, patterns, []).
activity(target_arch_managed, part_of, shape_system ).

action(target_arch_managed, mandatory, update, contributes_to target_architecture to_state ta_goals_identified or beyond). 
action(target_arch_managed, optional, update, contributes_to target_sad_doc to_detail tsad_high_level or beyond).


activity(target_architecture_updated, name, "Target Architecture Updated").
activity(target_architecture_updated, description, ["The Target Architecture changes are incorporated, as company goals change."]).
activity(target_architecture_updated, points, "Changes can arrise from:" items ["New potential solutions, options and components.",
	"New digital platforms",
	"Legacy migrations",
	"New Views Established",
	"Views and Models are updated",
	"Changes Agreed"]).
activity(target_architecture_updated, competencies, [stakeholder_representation at_level 3, analysis at_level 3]).
activity(target_architecture_updated, entry, []).
activity(target_architecture_updated, roles, [solution_architect]).
activity(target_architecture_updated, patterns, []).
activity(target_architecture_updated, part_of, shape_system ).

action(target_architecture_updated, mandatory, update, contributes_to target_architecture to_state ta_approaches_agreed or beyond). 
action(target_architecture_updated, optional, update, contributes_to target_sad_doc to_detail tsad_high_level or beyond).


% BEFORE STARTING
% Current System Architecture Document (SAD): Detailed
% Target Architecture: Accepted
% Target System Architect Document (SAD): High level
% REQUIRED COMPETENCIES
% ACHIEVES
% Architecture Roadmap: High Level or beyond
% CONTRIBUTES TO
% SOAP: High Level
% Solution Blueprint: High level

%Note: state is Gap identified.

activity(arch_roadmap, name, "Architecture Roadmapping").
activity(arch_roadmap, description, ["The Architecture Roadmapping work provides a guide to how to transition from the current state architecture to the future state architecture through a prioritised sequence of interdependent transformation programs, projects and other initiatives.",
	"The gap between the current state and future state highlights what must change. This moves the current architecture to the target, either via new solutions or planned intermediate architectures.",
	"The intermediate architectures can be described as SOAPs or Solution Blueprints depending on the detail required."]).
activity(arch_roadmap, competencies, [stakeholder_representation at_level 3, analysis at_level 3]).
activity(arch_roadmap, entry, [current_architecture:ca_future_accepted, target_architecture:ta_future_accepted, current_sad_doc:csad_high_level, target_sad_doc:tsad_high_level]).
activity(arch_roadmap, roles, [solution_architect]).
activity(arch_roadmap, patterns, []).
activity(arch_roadmap, part_of, understand_requirements ).

% CONTRIBUTES TO
% Architectural Review: Non- Functional Scenarios Defined defined or beyond


activity(review_architecture, name, "Review an Architecture").
activity(review_architecture, description, ["A system can be reviewed against its functional and non-functional requirements and goals. The aim is to determine how well it meets these future goals. For example, can the system evolve and scale to meet future expectations.",
	"A well respected approach to this is the ATAM. https://en.wikipedia.org/wiki/Architecture_tradeoff_analysis_method "]).
activity(review_architecture, competencies, [stakeholder_representation at_level 3, analysis at_level 3]).
activity(review_architecture, entry, []).
activity(review_architecture, roles, [solution_architect]).
activity(review_architecture, patterns, []).
activity(review_architecture, part_of, understand_requirements ).

% CONTRIBUTES TO
% Reference Implementation Blueprint: Architecture Doc Detailed
activity(reference_arc_blueprint, name, "Implement Reference Architecture Blueprint").
activity(reference_arc_blueprint, description, ["Implement a reference architecture that includes both the implemented solution and an Architectural Blueprint."]).
activity(reference_arc_blueprint, competencies, [stakeholder_representation at_level 3, analysis at_level 3]).
activity(reference_arc_blueprint, entry, []).
activity(reference_arc_blueprint, roles, [solution_architect]).
activity(reference_arc_blueprint, patterns, []).
activity(reference_arc_blueprint, part_of, understand_requirements ).



%
% Work products
% 

work_product(soap, name, "SOAP").
work_product(soap, description, ["A Solution On a Page (SOAP) is an early, or high level, description of the problem and the initiative with its potential solution described, the stakeholders, the solution context, business drivers, benefits and outcomes.",
	"In some cases, a SOAP may be all thats required, as an alternative to a SAD or Solution Blueprint."]).
work_product(soap, alpha, user_story).
work_product(soap, checks, [soap_high_level, soap_conceptual, soap_detailed]).
work_product(soap, resources, [soap_detail, soap_template]).

work_product_check(soap_high_level, work_product, soap).  
work_product_check(soap_high_level, name, "High Level").
work_product_check(soap_high_level, required, optional). 
work_product_check(soap_high_level, description, ["Describe the system context, and predominently identify stakeholders, and the extent of the black box solution that provides the basis for requirements gathering. define the technical complexity"]).
work_product_check(soap_high_level, checks, ["Identify Business Outcomes","System Context and Interfaces","Technical Complexity defined"]).

work_product_check(soap_conceptual, work_product, soap).  
work_product_check(soap_conceptual, name, "Conceptual").
work_product_check(soap_conceptual, required, optional). 
work_product_check(soap_conceptual, description, ["A notional system inpact level that takes business needs and maps them to a business and It solution to the level to identofy skills respources required to complete requiremnest and scoping."]).
work_product_check(soap_conceptual, checks, ["Refine System Context - Interfaces","High Level Solution Options"]).

work_product_check(soap_detailed, work_product, soap).  
work_product_check(soap_detailed, name, "Detailed").
work_product_check(soap_detailed, required, optional). 
work_product_check(soap_detailed, description, ["A solution overview that is detailed."]).
work_product_check(soap_detailed, points, "The purpose is to" items ["be maintained as an overview of the solution blueprint if there is a much larger document.",
	"used as part of an enduring current system architecture.",
	"all that is provided for solutions with minimal architectural complexity as guidance between business and IT as to the solution.",
	"Provide alignment to Architecture Principles"]).
work_product_check(soap_detailed, checks, ["The Problem and business goals are well defined."," The System Context is finalised"," The non-functional requirements are defined","The Teams are architected"]).



work_product(scd, name, "System Context Description").
work_product(scd, description, ["System Context Description is an early, or high level, description of the problem context.Diagrams are generally better than text for understanding the context of a system and there are three commonly used approaches to develop diagrams of the system context: Context Diagrams, Use Case Diagrams, Domain Models"]).
work_product(scd, points, "The purpose of the System Context is" items ["To clarify and confirm the extent and scope of the solution at an early stage.",
	"To clarify and confirm the environment in which the system has to operate.",
	"Show the system in its business driven context to help achieve the business goals.",
	"Define the domain and its boundaries.",
	"Provide the basis to allow the creation of the relevant SOAP or Blueprint.",
	"Mitigating the risk of covering areas that are out of scope or of being overlooked.",
	"Verify the information flows between the solution to be deployed and external entities."]).
work_product(scd, alpha, software_system ).
work_product(scd, checks, [scd_high_level, scd_detailed]).
work_product(scd, resources, [sys_context_detail]).

work_product_check(scd_high_level, work_product, scd).  
work_product_check(scd_high_level, name, "Described").
work_product_check(scd_high_level, required, optional). 
work_product_check(scd_high_level, description, ["Describe the system context, and predominently identify stakeholders"]).
work_product_check(scd_high_level, checks, ["Identify Business Outcomes","System Context and Interfaces","Technical Complexity defined"]).

work_product_check(scd_detailed, work_product, scd).  
work_product_check(scd_detailed, name, "Detailed & Modelled").
work_product_check(scd_detailed, required, optional). 
work_product_check(scd_detailed, description, ["A solution context model that is detailed"]).
work_product_check(scd_detailed, points, "The detail is to" items ["maintain an overview of the solution blueprint if there is a much larger document.",
	"used as part of an enduring current system architecture.",
	"all that is provided for solutions with minimal architectural complexity as guidance between business and IT as to the solution.",
	"Provide Alignment to Architecture Principles"]).
work_product_check(scd_detailed, checks, ["The Detailed level is achieved"]).


work_product(model, name, "Model").
work_product(model, description, ["A model is a primary tool for describing the architecture of a system. Creating conceptual and visual models helps explain the system, communicate its structure and function, and deal with complexity and change.",
	"Archtecture models are conceptual so there are no right answers. There are multiple model types and ways of viewing these. Each stakeholder has a particular set of concerns that are important to them. These concerns  are framed by a viewpoint and particular views on those models.",  
	"Where a view is  a representation of a whole system from the perspective of a related set of concerns. These is no one set."]).
work_product(model, alpha, user_story).
work_product(model, checks, [high_level_view, basic_views, comprehensive_views]).
work_product(model, resources, [model_detail]).

work_product_check(high_level_view, work_product, model).  
work_product_check(high_level_view, name, "High Level View").
work_product_check(high_level_view, required, optional). 
work_product_check(high_level_view, description, ["A High Level view covers the system from a general viewpoints for set of stakeholders."]).
work_product_check(high_level_view, checks, ["The High Level Views is achieved"]).

work_product_check(basic_views, work_product, model).  
work_product_check(basic_views, name, "Basic Views").
work_product_check(basic_views, required, optional). 
work_product_check(basic_views, description, ["Basic views cover a minimal set of viewpoints seperately addressing a set of stakeholders "]).
work_product_check(basic_views, checks, ["The Basic views are achieved"]).

work_product_check(comprehensive_views, work_product, model).  
work_product_check(comprehensive_views, name, "Comprehensive Views").
work_product_check(comprehensive_views, required, optional). 
work_product_check(comprehensive_views, description, ["Comprehensive views cover the needs of all the stakeholders and viewpoints"]).
work_product_check(comprehensive_views, checks, ["The Comprehensive views are achieved"]).


work_product(ref_impl_blue, name, "Reference Implementation Blueprint").
work_product(ref_impl_blue, description, ["A Reference Implementation Blueprint provides both an implemented solution for a particular domain, and an architecture blueprint description.",
	"This blueprint may use styles, frameworks and patterns, to provides a common vocabulary with which to discuss implementations, often with the aim to stress commonality, and proven concept re-use."]).
work_product(ref_impl_blue, alpha, reference_architecture).
work_product(ref_impl_blue, checks, [rib_high_level, rib_conceptual, rib_detailed]).
work_product(ref_impl_blue, resources, [ref_impl_detail]).

work_product_check(rib_high_level, work_product, ref_impl_blue).  
work_product_check(rib_high_level, name, "High Level").
work_product_check(rib_high_level, required, optional). 
work_product_check(rib_high_level, description, ["A High Level view covers the system from a general viewpoints for set of stakeholders."]).
work_product_check(rib_high_level, checks, ["The High Level Views is achieved"]).

work_product_check(rib_conceptual, work_product, ref_impl_blue).  
work_product_check(rib_conceptual, name, "Conceptual").
work_product_check(rib_conceptual, required, optional). 
work_product_check(rib_conceptual, description, ["Basic views cover a minimal set of viewpoints seperately addressing a set of stakeholders "]).
work_product_check(rib_conceptual, checks, ["The Basic views are achieved"]).

work_product_check(rib_detailed, work_product, ref_impl_blue).  
work_product_check(rib_detailed, name, "Detailed").
work_product_check(rib_detailed, required, optional). 
work_product_check(rib_detailed, description, ["Comprehensive views cover the needs of all the stakeholders and viewpoints"]).
work_product_check(rib_detailed, checks, ["The Comprehensive views are achieved"]).


work_product(system_arch_doc, name, "Solution SAD").
work_product(system_arch_doc, description, ["A Solution System Architecture Document (SSAD) documents a a change to a system, to solve a particular problem. The solution is portrayed using a number of different architectural views to depict different aspects of the solution. It is intended to capture and convey the significant architectural decisions and tradeoffs which have been made.",
	"The document covers a slice through the software and technical architecture, required to provide the solution. It covers the non-functional qualitiy attributes required, outlines the structure, components, and interactions of the changes"]).
work_product(system_arch_doc, alpha, reference_architecture).
work_product(system_arch_doc, checks, [sad_high_level, sad_conceptual, sad_detailed]).
work_product(system_arch_doc, resources, [sad_detail]).

work_product_check(sad_high_level, work_product, system_arch_doc).  
work_product_check(sad_high_level, name, "High Level").
work_product_check(sad_high_level, required, optional). 
work_product_check(sad_high_level, description, ["A High Level view covers the system from a general viewpoints for set of stakeholders."]).
work_product_check(sad_high_level, checks, ["The High Level Views is achieved"]).

work_product_check(sad_conceptual, work_product, system_arch_doc).  
work_product_check(sad_conceptual, name, "Conceptual").
work_product_check(sad_conceptual, required, optional). 
work_product_check(sad_conceptual, description, ["Basic views cover a minimal set of viewpoints seperately addressing a set of stakeholders "]).
work_product_check(sad_conceptual, checks, ["The Basic views are achieved"]).

work_product_check(sad_detailed, work_product, system_arch_doc).  
work_product_check(sad_detailed, name, "Detailed").
work_product_check(sad_detailed, required, optional). 
work_product_check(sad_detailed, description, ["Comprehensive views cover the needs of all the stakeholders and viewpoints"]).
work_product_check(sad_detailed, checks, ["The Comprehensive views are achieved"]).


work_product(current_sad_doc, name, "Current SAD").
work_product(current_sad_doc, description, ["A Current System Architecture Document (CSAD) provides a comprehensive architectural overview of the current system in production. It uses a number of different architectural views to depict different aspects of the system. It is intended to capture and convey the significant architectural decisions and tradeoffs which have been made.",
	"The document covers the software and technical architecture required to meet the past non-functional qualities required. It outlines the existing structure, components, and interactions of a system"]).
work_product(current_sad_doc, alpha, reference_architecture).
work_product(current_sad_doc, checks, [csad_high_level, csad_conceptual, csad_detailed]).
work_product(current_sad_doc, resources, [sad_detail]).

work_product_check(csad_high_level, work_product, current_sad_doc).  
work_product_check(csad_high_level, name, "High Level").
work_product_check(csad_high_level, required, optional). 
work_product_check(csad_high_level, description, ["A High Level view covers the system from a general viewpoint for set of stakeholders."]).
work_product_check(csad_high_level, checks, ["The High Level Views is achieved"]).

work_product_check(csad_conceptual, work_product, current_sad_doc).  
work_product_check(csad_conceptual, name, "Conceptual").
work_product_check(csad_conceptual, required, optional). 
work_product_check(csad_conceptual, description, ["Basic views cover a minimal set of viewpoints seperately addressing a set of stakeholders "]).
work_product_check(csad_conceptual, checks, ["The Basic views are achieved"]).

work_product_check(csad_detailed, work_product, current_sad_doc).  
work_product_check(csad_detailed, name, "Detailed").
work_product_check(csad_detailed, required, optional). 
work_product_check(csad_detailed, description, ["Comprehensive views cover the needs of all the stakeholders and viewpoints"]).
work_product_check(csad_detailed, checks, ["The Comprehensive views are achieved"]).


work_product(target_sad_doc, name, "Target SAD").
work_product(target_sad_doc, description, ["A Target System Architecture Document (TSAD) provides a architectural overview of the future of the system; where its likely to head to meet the strategic objectives. It uses a number of different architectural views to depict different aspects of the system. It is intended to capture and convey the significant architectural decisions and tradeoffs which have been made on the system.",
	"The document covers the software and technical architecture required to meet the future non-functional qualities required. It outlines the new or to change structure, components, and interactions of the system"]).
work_product(target_sad_doc, alpha, reference_architecture).
work_product(target_sad_doc, checks, [tsad_high_level, tsad_conceptual, tsad_detailed]).
work_product(target_sad_doc, resources, [sad_detail]).

work_product_check(tsad_high_level, work_product, target_sad_doc).  
work_product_check(tsad_high_level, name, "High Level").
work_product_check(tsad_high_level, required, optional). 
work_product_check(tsad_high_level, description, ["A High Level view covers the system from a general viewpoints for set of stakeholders."]).
work_product_check(tsad_high_level, checks, ["The High Level Views is achieved", "The needs of Stakeholders is understood"]).

work_product_check(tsad_conceptual, work_product, target_sad_doc).  
work_product_check(tsad_conceptual, name, "Conceptual").
work_product_check(tsad_conceptual, required, optional). 
work_product_check(tsad_conceptual, description, ["Basic views cover a minimal set of viewpoints seperately addressing a set of stakeholders "]).
work_product_check(tsad_conceptual, checks, ["The Basic views are achieved"]).

work_product_check(tsad_detailed, work_product, target_sad_doc).  
work_product_check(tsad_detailed, name, "Detailed").
work_product_check(tsad_detailed, required, optional). 
work_product_check(tsad_detailed, description, ["Comprehensive views cover the needs of all the stakeholders and viewpoints"]).
work_product_check(tsad_detailed, checks, ["The Comprehensive views are achieved"]).

% Architectural Decision Record

work_product(arch_dec_rec, name, "Architectural Decision Record").
work_product(arch_dec_rec, description, ["An Architectural Decision Record (ADR) is a document that captures an important architectural decision made along with its context and consequences.", 
	"It helps maintain transparency and clarity around the decision-making process for future reference."]).
work_product(arch_dec_rec, points, "A decision should cover" items ["Issue and Context Description",
	"The Decision made", "Status now, where process is up to","Assumptions and constraints",
	"The Options considered.","Arguments justifying the rationale behind the selected position","Implications of the choice"]).
work_product(arch_dec_rec, alpha, architectural_decision).
work_product(arch_dec_rec, checks, [adr_high_level, adr_conceptual, adr_detailed]).
work_product(arch_dec_rec, resources,[arch_dec_detail]).

work_product_check(adr_high_level, work_product, arch_dec_rec).  
work_product_check(adr_high_level, name, "High Level").
work_product_check(adr_high_level, required, optional). 
work_product_check(adr_high_level, description, ["A High Level view covers the system from a general viewpoints for set of stakeholders."]).
work_product_check(adr_high_level, checks, ["The High Level Views is achieved"]).

work_product_check(adr_conceptual, work_product, arch_dec_rec).  
work_product_check(adr_conceptual, name, "Conceptual").
work_product_check(adr_conceptual, required, optional). 
work_product_check(adr_conceptual, description, ["Basic views cover a minimal set of viewpoints seperately addressing a set of stakeholders "]).
work_product_check(adr_conceptual, checks, ["The Basic views are achieved"]).

work_product_check(adr_detailed, work_product, arch_dec_rec).  
work_product_check(adr_detailed, name, "Detailed").
work_product_check(adr_detailed, required, optional). 
work_product_check(adr_detailed, description, ["Comprehensive views cover the needs of all the stakeholders and viewpoints"]).
work_product_check(adr_detailed, checks, ["The Comprehensive views are achieved"]).

% Decision Log

work_product(arch_dec_log, name, "Architectural Decision Log").
work_product(arch_dec_log, description, ["The Architectural Decision Log is the collection of all ADRs created and maintained for a particular project, product, stream, or organisation."]).
work_product(arch_dec_log, alpha, architectural_decision).
work_product(arch_dec_log, checks, [adl_initiated, adl_maintained]).
work_product(arch_dec_log, resources,[arch_dec_detail]).

work_product_check(adl_initiated, work_product, arch_dec_log).  
work_product_check(adl_initiated, name, "Initiated").
work_product_check(adl_initiated, required, optional). 
work_product_check(adl_initiated, description, ["The Decison Log has been initiated and is starting to collect records."]).
work_product_check(adl_initiated, checks, ["The Decision log has been Initiated "]).

work_product_check(adl_maintained, work_product, arch_dec_log).  
work_product_check(adl_maintained, name, "Maintained").
work_product_check(adl_maintained, required, optional). 
work_product_check(adl_maintained, description, ["The Decison Log is fully operational and maintained. It has become a credible source for understanding past decison."]).
work_product_check(adl_maintained, checks, ["The Decion log is fully operational and maintained"]).


work_product(arch_poc, name, "Architectural POC").
work_product(arch_poc, description, ["Architectural Proof of Concept is a way to mitigate risk or uncertainty associated with the change. A POC tests a specific hypothesis empirically, to achieve an isolated functional, non-functional or technical goal.", 
	"The POC system built should not be treated as an evolution or system increment but be thrown away. The main reason for this is the POC focuses on the hypothesis, not general Quality Attributes or code quality. As a result it may provide a very poor base for a proper solution."]).
work_product(arch_poc, alpha, architectural_decision).
work_product(arch_poc, checks, [arch_poc_high_level, arch_poc_architected, arch_poc_defined, arch_poc_documented]).
work_product(arch_poc, resources, [arch_poc_detail]).

work_product_check(arch_poc_high_level, work_product, arch_poc).  
work_product_check(arch_poc_high_level, name, "Hypothesis Defined").
work_product_check(arch_poc_high_level, required, mandatory). 
work_product_check(arch_poc_high_level, description, ["The hypothesis is defined, and it is objectively testable"]).
work_product_check(arch_poc_high_level, checks, ["The Hypothesis is defined"]).

work_product_check(arch_poc_architected, work_product, arch_poc).  
work_product_check(arch_poc_architected, name, "Achitecture Defined").
work_product_check(arch_poc_architected, required, mandatory). 
work_product_check(arch_poc_architected, description, ["The architecure is defined and clarified"]).
work_product_check(arch_poc_architected, checks, ["A mini SAD is produced"]).

work_product_check(arch_poc_defined, work_product, arch_poc).  
work_product_check(arch_poc_defined, name, "Test Cases Defined").
work_product_check(arch_poc_defined, required, mandatory). 
work_product_check(arch_poc_defined, description, ["Test Cases are defined around the hypothesis"]).
work_product_check(arch_poc_defined, checks, ["The test Cases are completed"]).

work_product_check(arch_poc_documented, work_product, arch_poc).  
work_product_check(arch_poc_documented, name, "Results Documented").
work_product_check(arch_poc_documented, required, mandatory). 
work_product_check(arch_poc_documented, description, ["The results of the POC are documented"]).
work_product_check(arch_poc_documented, checks, ["The Results are Documented, and communicated"]).


%
% patterns
%
pattern(technical_complexity, type,  advisory).
pattern(technical_complexity, name, "Technical Complexity"). 
pattern(technical_complexity, description, ["The Technical Complexity of a Solution determines how much architectural suppoprt is required. This support includes how much architectural design, governance, and enterprise conformance may be required",
	"A set of rules are provided as guidelines to determine complexity and the degree of support."]).
pattern(technical_complexity, resources, [technical_complexity_guidance]).

pattern(arch_principal, type,  advisory).
pattern(arch_principal, name, "Architectural Principal"). 
pattern(arch_principal, description, ["Architecture Principles are intended to guide the organisation in delivering business imperatives in the most efficient and effective manner through IT.",
	"These principles align with ITs Principles."]).
pattern(arch_principal, points, "A principle is a statement of intent for use of IT:" items ["It describes preferred practices to be followed when implementing new or upgraded systems", "It is a soft policy or a fat standard","It is a foundation to build the enterprise architecture"]).
pattern(arch_principal, resources, [arch_princ_detail]).

%
% Roles GET THEM from my Arch Roles document
%

role(solution_architect, name, "Solution Architect").
role(solution_architect, description, ["The Solution Architect has the responsibility for architectural design and documentation for a product solution, project, a system or subsystem building block.",
	"The focus of the Solution Architect is on system technology solutions. For large projects, an E2E Solution Architect may lead a team of Solution Architects."]).
role(solution_architect, competencies, [stakeholder_representation at_level 3, analysis at_level 3]).
role(solution_architect, points, "The roles and responsibilities are" items ["Work with Analysts and stakeholders to understand and document the Non Functional Requirements (NFRs).",
	"Identifying and documenting the architecturally significant aspects of the system as views that describe requirements, design, implementation, and deployment.",
	"Providing the rationale for these decisions, balancing the concerns of the various stakeholders, and reducing technical risks.",
	"Ensuring that decisions are effectively documented, communicated, validated, and followed.",
	"Create and maintain, under program architect guidance, a Solution on a Page (SOAP), capturing a high-level outline of the solution.",
	"Deliver E2E Solution Architecture, as a Solution Blueprint or SAD, for a project coordinating the activities of other architects and specialists.",
	"Communicate the defined solution to project stakeholders (business, project & platform) and address any items required to gain their approvals."]).

role(program_architect, name, "Program Architect").
role(program_architect, description, ["The Program Architect works mainly with the business stakeholders and the program team, often within a LOB, to create and/or plan a program roadmap usually within a financial year.",
	"These architects extend the Enterprise Architecture concern into a narrow segment."]).
role(program_architect, competencies, [stakeholder_representation at_level 3, analysis at_level 3]).
role(program_architect, points, "The roles and responsibilities are" items [
	"Work with Program team to create a Program Conceptual Target Architecture, capturing the conceptual target state of the program.",
	"Work with the Business Analyst to capture the proposed project scope as a Conceptual Solution Context Diagram on a Page.",
	"Understand how to deliver the target state, as projects, a stream of work, or a set of solutions, working with Solution Architects).",
	"Create and manage the Program Roadmap that contains a pipeline of projects or solutions delivering the target state.",
	"Review and assess ‘as is’ systems or architectures for gaps and produce Architecture Review Documents.",
	"Determine the Program‘s impact on platforms, applications and other LOBs."]).

competency(architecture_competency, name, "Architecture").
competency(architecture_competency, description, ["This competency encapsulates the knowledge and practice of enterprise, domain and system architecture, the ability to understand systems and develop enterprise, system and software architecture models"]).
competency(architecture_competency, type, generic).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          RESOURCES                           %
% Types: Detail, Templates, Guidelines         %
%    Principles, Standards, Best Practises     %
%    Patterns, Policies, Regulations, Links    %
%                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

resource(architecture_detail, type, detail).
resource(architecture_detail, name, "Architecture Practice Detail").
resource(architecture_detail, file, "architecture_practice.html").

resource(cur_arch_detail, type, detail).
resource(cur_arch_detail, name, "Current Architecture Detail").
resource(cur_arch_detail, file, "current_arch.html").

resource(target_arch_detail, type, detail).
resource(target_arch_detail, name, "Target Architecture Detail").
resource(target_arch_detail, file, "target_arch.html").

resource(sol_arch_detail, type, detail).
resource(sol_arch_detail, name, "Solution Architecture Detail").
resource(sol_arch_detail, file, "sol_arch.html").

resource(sol_arch_guide, type, guideline).
resource(sol_arch_guide, name, "Solution Architecture Guideline").
resource(sol_arch_guide, file, "sol_arch_guide.html").

resource(ref_arch_detail, type, detail).
resource(ref_arch_detail, name, "Reference Architecture Detail").
resource(ref_arch_detail, file, "ref_arch.html").

resource(soap_detail, type, detail).
resource(soap_detail, name, "SOAP Detail").
resource(soap_detail, file, "soap_detail.html").

resource(soap_template, type, template).
resource(soap_template, name, "SOAP Template").
resource(soap_template, file, "soap_template.html").
	
resource(sys_context_detail, type, detail).
resource(sys_context_detail, name, "Context Description Detail").
resource(sys_context_detail, file, "scd.html").

resource(model_detail, type, detail).
resource(model_detail, name, "Model Detail").
resource(model_detail, file, "model.html").

resource(sad_detail, type, template).
resource(sad_detail, name, "SAD Template").
resource(sad_detail, file, "sad.html").

resource(arch_decision_detail, type, detail).
resource(arch_decision_detail, name, "Architectural Decision Detail").
resource(arch_decision_detail, file, "architectural_decision.html").

resource(arch_poc_detail, type, detail).
resource(arch_poc_detail, name, "Architecture Proof Of Concept Detail").
resource(arch_poc_detail, file, "architectural_poc.html").

resource(arch_princ_detail, type, detail).
resource(arch_princ_detail, name, "Architectural Principal Detail").
resource(arch_princ_detail, file, "architectural_principal.html").

resource(ref_impl_detail, type, detail).
resource(ref_impl_detail, name, "Reference Implementation Blueprint Detail").
resource(ref_impl_detail, file, "ref_impl_blueprint.html").

resource(technical_complexity_guidance, type, guidance).
resource(technical_complexity_guidance, name, "Technical Complexity Guidance").
resource(technical_complexity_guidance, file, "technical_complexity.html").

%%%%%%%%%%%%%%%%%%%%%%%%%%%&%%%%%%%%%%%%%%%%
%          ASSOCIATIONS                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%&%%%%%%%%%%%%%%%%

% CA Associations
association("Becomes", target_architecture, current_architecture). 
association("Changes", solution_architecture, current_architecture). 
association("Derived From", current_architecture, solution_architecture). 
association("Determined By", current_architecture, requirements). 
association("Evolves Into", current_architecture,  target_architecture). 
association("Guides", reference_architecture, current_architecture). 
association("Influenced By", current_architecture, reference_architecture). 
association("Mined From", reference_architecture, current_architecture). 
association("Documented by SAD", current_architecture, current_sad_doc). 

% Reference Associations
association("Guides", reference_architecture, solution_architecture). 
association("Guides", reference_architecture, target_architecture). 

% Target Arch
association("Influenced By", target_architecture, reference_architecture). 
association("Determined By", target_architecture, requirements). 
association("Documented by SAD", target_architecture, target_sad_doc). 

% Solution Arch
association("Influenced By", solution_architecture, reference_architecture). 
association("Determined By", solution_architecture, requirements).
association("Determined By", solution_architecture, soap). 

% association("Determined By", solution_architecture, nfrs). 
association("Documented by SAD", solution_architecture, system_arch_doc). 

association("SAD includes Models", system_arch_doc, model). 
association("Constrains", architectural_decision, solution_architecture). 
association("Implements", solution_architecture, architectural_decision). 
 