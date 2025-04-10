:- discontiguous alpha/3.
:- discontiguous state/3.
:- discontiguous activity_space/3.
:- discontiguous concern/3.
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
% Concern Map
%

practice(ent_arch, name, "Enterprise Architecture").
practice(ent_arch, description, ["Enterprise Architecture is the organising logic for business processes and IT infrastructure reflecting the integration and standardization requirements of the firms operating model.Peter Weill"]).
practice(ent_arch, resources, [ent_arch_detail]).
practice(ent_arch, concerns, [organisation]).

concern(organisation, name, "Organisation").
concern(organisation, position, above(customer)).     % place above customer
concern(organisation, color, pink).

concern_element(activity_space, ent_arch, organisation, shape_enterprise).
concern_element(activity_space, ent_arch, organisation, govern_enterprise).
concern_element(activity_space, ent_arch, organisation, business_capability_modelling).
concern_element(alpha, ent_arch, organisation,  business_capabilities).
concern_element(alpha, ent_arch, organisation,  roadmapping_portfolio_planning).
concern_element(alpha, ent_arch, organisation,  it_asset_management).
concern_element(alpha, ent_arch, organisation, opportunity_assessment).
concern_element(alpha, ent_arch, organisation, architecture_governance).
concern_element(alpha, ent_arch, organisation, operating_model).


concern_element(activity, ent_arch, organisation, arch_dec_review).
concern_element(activity, ent_arch, enterporganisationrise, peer_review).
concern_element(role, ent_arch, organisation, ent_architect).
concern_element(role, ent_arch, organisation, bus_architect).
concern_element(role, ent_arch, organisation, arch_review_team).

concern_element(resource, ent_arch, organisation, architecture_gov_detail).
concern_element(resource, ent_arch, organisation, it_asset_management_detail).
concern_element(resource, ent_arch, organisation, opportunity_assessment_detail).
concern_element(resource, ent_arch, organisation, architecture_governance_detail).
concern_element(resource, ent_arch, organisation, operating_model_detail).

% ----------------------
%          Alphas
% -----------------------

%
% Alphas - Business Capabilities
%

alpha(business_capabilities, name, 'Business Capabilities').
alpha(business_capabilities, description, ["Business Capability  includes all the activities related to managing with business capabilitie by enterprise architects"]).
alpha(business_capabilities, states,
                   [ business_capability_scope_defined,
                     business_capabilities_identified,
                     business_capabilities_agreed,
                     business_capabilities_models_agreed,
                     business_capabilities_validated
                   ]).
alpha(business_capabilities, resources, [capability_mapping]).
		
state(business_capability_scope_defined, alpha, business_capability_modelling).
state(business_capability_scope_defined, name, 'Capability scope defined').
state(business_capability_scope_defined, description, "describe").
state(business_capability_scope_defined, checks, ["list"]).

state(business_capabilities_identified, alpha, business_capability_modelling).
state(business_capabilities_identified, name, 'Capabilities identified').
state(business_capabilities_identified, description, "describe").
state(business_capabilities_identified, checks, ["list"]).

state(business_capabilities_agreed, alpha, business_capability_modelling).
state(business_capabilities_agreed, name, 'Capabilities agreed').
state(business_capabilities_agreed, description, "describe").
state(business_capabilities_agreed, checks, ["list"]).

state(business_capabilities_models_agreed, alpha, business_capability_modelling).
state(business_capabilities_models_agreed, name, 'Models agreed').
state(business_capabilities_models_agreed, description, "describe").
state(business_capabilities_models_agreed, checks, ["list"]).

state(business_capabilities_validated, alpha, business_capability_modelling).
state(business_capabilities_validated, name, 'Capabilities validated').
state(business_capabilities_validated, description, "describe").
state(business_capabilities_validated, checks, ["list"]).

%
% Alphas - Roadmaps Portfolio Planning
%

alpha(roadmapping_portfolio_planning, name, 'Roadmaps and Portfolio').
alpha(roadmapping_portfolio_planning, description, ["Roadmapping and Portfolio Planning deals with laying out the way future IT initiatives are staged.", "A series of transitions may be planned across the portfolio to get from the current state to the future state with roadmaps providing the direction.",
  "These XX activities XX often include proposing new IT initiatives aligned to strategic business priorities, arranging these initiatives based on their importance, mutual dependence and deadlines, and scheduling their execution at specific time intervals. Transitions require shaping the IT investment portfolio based on the tactical priorities for the upcoming budgetary period, often for the next financial year."]).
alpha(roadmapping_portfolio_planning, states,
                   [ roadmapping_and_planning_scope_defined,
                     roadmapping_and_planning_identified,
                     roadmapping_and_planning_agreed,
                     roadmapping_and_planning_ready,
                     roadmapping_and_planning_operational
                   ]).
alpha(roadmapping_portfolio_planning,resource, [roadmap_plan]).

state(roadmapping_and_planning_scope_defined, alpha, roadmapping_portfolio_planning).
state(roadmapping_and_planning_scope_defined, name, 'Scope Defined').
state(roadmapping_and_planning_scope_defined, description, "describe").
state(roadmapping_and_planning_scope_defined, checks, ["list"]).

state(roadmapping_and_planning_identified, alpha, roadmapping_portfolio_planning).
state(roadmapping_and_planning_identified, name, 'Roadmaps and Plans Identified').
state(roadmapping_and_planning_identified, description, "describe").
state(roadmapping_and_planning_identified, checks, ["list"]).

state(roadmapping_and_planning_agreed, alpha, roadmapping_portfolio_planning).
state(roadmapping_and_planning_agreed, name, 'Roadmaps and Plans Agreed').
state(roadmapping_and_planning_agreed, description, "describe").
state(roadmapping_and_planning_agreed, checks, ["list"]).

state(roadmapping_and_planning_ready, alpha, roadmapping_portfolio_planning).
state(roadmapping_and_planning_ready, name, 'Roadmaps and Plans Ready').
state(roadmapping_and_planning_ready, description, "describe").
state(roadmapping_and_planning_ready, checks, ["list"]).

state(roadmapping_and_planning_operational, alpha, roadmapping_portfolio_planning).
state(roadmapping_and_planning_operational, name, 'Roadmaps and Plans Implemented').
state(roadmapping_and_planning_operational, description, "describe").
state(roadmapping_and_planning_operational, checks, ["list"]).


alpha(it_asset_management, name, 'IT Asset Management').
alpha(it_asset_management, description, ["The IT asset management activity area encompasses all activities of architects related to managing existing IT assets in the organisation."]).
alpha(it_asset_management, states, [new_assets_identified, assets_reviewed, assets_managed]).
alpha(it_asset_management, resources, [new_assets_identified, assets_reviewed, assets_managed]).


state(new_assets_identified, alpha, it_asset_management).
state(new_assets_identified, name, 'New Assets Identified').
state(new_assets_identified, description, "describe").
state(new_assets_identified, checks, ["list"]).

state(assets_reviewed, alpha, it_asset_management).
state(assets_reviewed, name, 'Assets Reviewed').
state(assets_reviewed, description, "describe").
state(assets_reviewed, checks, ["list"]).

state(assets_managed, alpha, it_asset_management).
state(assets_managed, name, 'Assets Managed').
state(assets_managed, description, "describe").
state(assets_managed, checks, ["list"]).


alpha(opportunity_assessment, name, "Business Opportunities").
alpha(opportunity_assessment, description, ["The opportunity assessment XX activity XX area encompasses all activities of architects related to evaluating possible options for addressing specific business needs with IT."]).
alpha(opportunity_assessment, states,
                     [ needs_identified,
                       architecture_options_reviewed,
                       estimated_costed
                     ]).
alpha(opportunity_assessment, resources, [opportunity_assessment_detail]).
                     

state(needs_identified, alpha, opportunity_assessment).
state(needs_identified, name, 'Business Needs Identified').
state(needs_identified, description, "describe").
state(needs_identified, checks, ["list"]).

state(architecture_options_reviewed, alpha, opportunity_assessment).
state(architecture_options_reviewed, name, 'Architecture Options Reviewed').
state(architecture_options_reviewed, description, "describe").
state(architecture_options_reviewed, checks, ["list"]).

state(estimated_costed, alpha, opportunity_assessment).
state(estimated_costed, name, 'Estimated and Costed').
state(estimated_costed, description, "describe").
state(estimated_costed, checks, ["list"]).

alpha(architecture_governance, name, 'Architecture Governance').
alpha(architecture_governance, description, [ "Architecture Governance covers the practice and orientation by which architectures and decisions are managed and controlled at an enterprise-wide level.\nIt includes the reviewing and approving the implementation plans for new IT initiatives." ]).
alpha(architecture_governance, states,
                     [ governance_scope_defined,
                       governance_identified,
                       governance_agreed,
                       ready,
                       governance_operational
                     ]).
alpha(architecture_governance, resources, [architecture_governance_detail]).

state(governance_scope_defined, alpha, architecture_governance).
state(governance_scope_defined, name, 'Scope Defined').
state(governance_scope_defined, description, "describe").
state(governance_scope_defined, checks, ["list"]).
state(governance_identified, alpha, architecture_governance).
state(governance_identified, name, 'Governance Identified').
state(governance_identified, description, "describe").
state(governance_identified, checks, ["list"]).
state(governance_agreed, alpha, architecture_governance).
state(governance_agreed, name, 'Agreed').
state(governance_agreed, description, "describe").
state(governance_agreed, checks, ["list"]).
state(ready, alpha, architecture_governance).
state(ready, name, 'Ready').
state(ready, description, "describe").
state(ready, checks, ["list"]).
state(governance_operational, alpha, architecture_governance).
state(governance_operational, name, 'Operational').
state(governance_operational, description, "describe").
state(governance_operational, checks, ["list"]).


alpha(operating_model, name, 'Operating Model').
alpha(operating_model, description, ["An operating model is both an abstract and visual representation (model) of how an organization delivers value to its customers or beneficiaries as well as how an organization actually runs itself."]).
alpha(operating_model, detail, [operating_model_defined, operating_model_identified, operating_model_agreed, operating_model_ready, operating_model_operational]).
alpha(operating_model, resources, [operating_model_detail]).
alpha(operating_model, states, [operating_model_defined, operating_model_identified, operating_model_agreed, operating_model_ready, operating_model_operational]).

state(operating_model_defined, alpha, operating_model).
state(operating_model_defined, name, "Defined").
state(operating_model_defined, description, ["Describe.."]).
state(operating_model_defined, checks, ["List.."]).
state(operating_model_identified, alpha, operating_model).
state(operating_model_identified, name, "Identified").
state(operating_model_identified, description, ["Describe.."]).
state(operating_model_identified, checks, ["List.."]).
state(operating_model_agreed, alpha, operating_model).
state(operating_model_agreed, name, "Agreed").
state(operating_model_agreed, description, ["Describe.."]).
state(operating_model_agreed, checks, ["List.."]).
state(operating_model_ready, alpha, operating_model).
state(operating_model_ready, name, "Ready").
state(operating_model_ready, description, ["Describe.."]).
state(operating_model_ready, checks, ["List.."]).
state(operating_model_operational, alpha, operating_model).
state(operating_model_operational, name, "Operational").
state(operating_model_operational, description, ["Describe.."]).
state(operating_model_operational, checks, ["List.."]).



activity_space(govern_enterprise, name,"Govern the Enterprise").
activity_space(govern_enterprise, description, ["Govern the Enterprise, the business and IT, so that It initiaves align with business initiaves now and in the future."]).
activity_space(govern_enterprise, points, "Govern the Enterprise to" items ["Understand the business needs", "Align business and IT initiaves", "Understand costs and implications of IT initiaves"]).
activity_space(govern_enterprise, input, [stakeholders, opportunity, requirements, software_system, work, wow]).
activity_space(govern_enterprise, entry, [requirements:coherent]).
activity_space(govern_enterprise, completion, [requirements:acceptable, software_system:arch_selected]).

activity_space(shape_enterprise, name,"Shape the Enterprise").
activity_space(shape_enterprise, description, ["Shape the Enterprise, the business and IT, so that It initiaves align with business initiaves now and in the future."]).
activity_space(shape_enterprise, points, "Shape the Enterprise to" items ["Understand the business needs", "Align business and IT initiaves", "Understand costs and implications of IT initiaves"]).
activity_space(shape_enterprise, input, [stakeholders, opportunity, requirements, software_system, work, wow]).
activity_space(shape_enterprise, entry, [requirements:coherent]).
activity_space(shape_enterprise, completion, [requirements:acceptable, software_system:arch_selected]).

activity_space(business_capability_modelling, name, 'Business Capability Modelling').
activity_space(business_capability_modelling, description, ["Business Capability Modelling includes all the activities related to managing with business capabilitie by enterprise architects",
    "These activities often include identifying organizational business capabilities, assessing their relative maturity, often against external industry benchmarks, articulating necessary capability improvements and heatmapping respective capabilities to indicate future priorities for IT investments."]).
activity_space(business_capability_modelling, input, [stakeholders, opportunity, requirements, software_system, work, wow]).
activity_space(business_capability_modelling, entry, [requirements:coherent]).
activity_space(business_capability_modelling, completion, [requirements:acceptable, software_system:arch_selected]).

alpha(roadmapping_portfolio_planning, name, 'Roadmapping and Portfolio Planning').
alpha(roadmapping_portfolio_planning, description, ["Roadmapping and Portfolio Planning deals with the activities of laying out the future IT initiatives and how they are staged.", "A series of transitions may be planned across the portfolio to get from the current state to the future state with roadmaps providing the direction.",
  "These activities often include proposing new IT initiatives aligned to strategic business priorities, arranging these initiatives based on their importance, mutual dependence and deadlines, and scheduling their execution at specific time intervals. Transitions require shaping the IT investment portfolio based on the tactical priorities for the upcoming budgetary period, often for the next financial year."]).


activity_space(roadmapping_portfolio_planning, input, [stakeholders, opportunity, requirements, software_system, work, wow]).
activity_space(roadmapping_portfolio_planning, entry, [requirements:coherent]).
activity_space(roadmapping_portfolio_planning, completion, [requirements:acceptable, software_system:arch_selected]).

alpha(it_asset_management, name, 'IT Asset Management').
alpha(it_asset_management, description, ["The IT asset management activity area encompasses all activities of architects related to managing existing IT assets in the organisation."]).


alpha(opportunity_assessment, name, "Business Opportunity Assessment").
alpha(opportunity_assessment, description, ["The opportunity assessment XX activity XX area encompasses all activities of architects related to evaluating possible options for addressing specific business needs with IT."]).


% ACHIEVES
% SOAP: Detailed
% CONTRIBUTES TO
% Architectural Decision: Solutions Analysed, Options, Rationale Documented
% Current System Architecture Document (SAD): Detailed
% Solution Blueprint: Detailed
% Current Architecture: Accepted
% Reference Implementation Blueprint: Archiecture Doc Detailed

activity(peer_review, name, "Peer Review Work Products").
activity(peer_review, description, ["All Architectural Artefacts are peer reviewed for quality and integrity."]). 
activity(peer_review, points, "The Reviews include:" items ["SOAPS","SADS"]).
activity(peer_review, competencies, [stakeholder_representation at_level 3, analysis at_level 3]).
activity(peer_review, entry, []).
activity(peer_review, roles, [solution_architect]).
activity(peer_review, patterns, []).
activity(peer_review, part_of, understand_requirements).

activity(arch_dec_review, name, "Architectural Decision Review").
activity(arch_dec_review, description, ["The Architectural Decision Review is used to peer review and socialise decisions (ADRs)"]). 
activity(arch_dec_review, points, "The Review includes:" items ["Development and Logging of the Architectural Decison",
	"Decision Review has been initiated and the ADR presented to the Stakeholders and Architecture team.",
	"The Decision Review is finalsied and a result agreed, as accepted or rejected."]).
activity(arch_dec_review, competencies, [stakeholder_representation at_level 3, analysis at_level 3]).
activity(arch_dec_review, entry, []).
activity(arch_dec_review, roles, [solution_architect, arch_review_team]).
activity(arch_dec_review, patterns, []).
activity(arch_dec_review, part_of, understand_requirements).


work_product(bc_model, name, "Business Capability Model").
work_product(bc_model, description, ["A Business Capability Model, organization from the perspective of its business capabilities or activities often also describing their underlying components, e.g. people, processes, information and systems."]).
work_product(bc_model, alpha, business_capability_modelling).
work_product(bc_model, checks, [bcm_high_level, bcm_conceptual, bcm_detailed]).
work_product(bc_model, resources, [bcm_detail, bcm_template]).



%
% Roles
%

role(ent_architect, name, "Enterprise Architect").
role(ent_architect, description, ["Enterprise Architects work with the business to understand the strategy, structure, management, business operations and initiatives of the Enterprise.",
  "They develop and manages the current state IT Enterprise Architecture, and the long-term (e.g., 5 year) target state IT architecture. This role assesses the gaps between the target and current state and, with the business, develops a roadmap of initiatives to transition the current state to the target.",
  "The role governs the Enterprise Repository and Strategic Enterprise Knowledge"]).
role(ent_architect, competencies, [stakeholder_representation at_level 3, analysis at_level 3]). 
role(ent_architect, points, "The roles and responsibilities are" items [
  "Work with business to understand their strategy and produce a long term target Enterprise Architecture.",
  "Maintain the current State ‘As is‘ Enterprise Architecture and the target ‘To Be’ Enterprise Architecture.",
  "Assess the current and target architecture gaps, produce the Enterprise Roadmap and Transition Plans.",
  "Work with LOB Architects and Domain architects to communicate and align the Enterprise Architecture roadmap and associated artefacts.", 
  "Manage high level, enterprise-wide artefacts including principles and frameworks.",
  "Govern architectural exception processes.",
  "Maintains and develops overall architectural competency."]).

  role(bus_architect, name, "Business Architect").
role(bus_architect, description, ["Business Architects work with the business to understand the strategy, structure, management, business operations and initiatives of the Enterprise.",
  "They develop and manages the current state IT Enterprise Architecture, and the long-term (e.g., 5 year) target state IT architecture. This role assesses the gaps between the target and current state and, with the business, develops a roadmap of initiatives to transition the current state to the target.",
  "The role governs the Enterprise Repository and Strategic Enterprise Knowledge"]).
role(bus_architect, competencies, [stakeholder_representation at_level 3, analysis at_level 3]). 
role(bus_architect, points, "The roles and responsibilities are" items [
  "Work with business to understand their strategy and produce a long term target Business Architecture.",
  "Maintain the current State ‘As is‘ Business Architecture and the target ‘To Be’ Business Architecture.",
  "Assess the current and target architecture gaps, produce the Business Roadmap and Transition Plans.",
  "Work with LOB Architects and Domain architects to communicate and align the Business Architecture roadmap and associated artefacts.", 
  "Manage high level, enterprise-wide artefacts including principles and frameworks.",
  "Govern architectural exception processes.",
  "Maintains and develops overall architectural competency."]).


role(arch_review_team, name, "Architecture Review Team").
role(arch_review_team, description, ["The Architecture Review Team (ART) or Board (ARB) is a committee that oversees system development. It reviews proposed architectural changes and ensures they align with the organisations goals, enterprise archiecture, standards, and principals.",
	"The ART is responcible for managing decisons, making informed choices, making sure knowledge is shared, and wideneing collaboration in system development.",
	"It is made up of members with diverse expertise, with balanced representation across Teams and Levels, both in IT and the business" ]).
role(arch_review_team, competencies, [stakeholder_representation at_level 3, analysis at_level 3]). 
role(arch_review_team, points, "The ART provides" items ["An Open forum for sharing and brainstorming", "A contextual understanding of solutions and decisions", "Making Trade Offs and their analysis freely available", "Consensus building", "Management of ADRs",
	"Ensurance that IT and Business Objectives are met"] ).

%
% Resources
%

resource(ent_arch_detail, type, detail).
resource(ent_arch_detail, name, "Enterprise Architecture Detail").
resource(ent_arch_detail, file, "ent_arch_detail.html").

resource(architecture_gov_detail, type, detail).
resource(architecture_gov_detail, name, "Architecture Governance Practice Detail").
resource(architecture_gov_detail, file, "architecture_governance.html").

resource(capability_mapping, type, detail).
resource(capability_mapping, name, "Capability Mapping Detail").
resource(capability_mapping, file, "capability_mapping.html").

resource(roadmap_plan, type, detail).
resource(roadmap_plan, name, "Roadmapping and Portfolio Planning").
resource(roadmap_plan, file, "roadmap_plan.html").

resource(it_asset_management_detail, type, detail).
resource(it_asset_management_detail, name, "IT Asset Management Detail").
resource(it_asset_management_detail, file, "it_asset_management_detail.html").
     
resource(opportunity_assessment_detail, type, detail).
resource(opportunity_assessment_detail, name, "Opportunity Assessment Detail").
resource(opportunity_assessment_detail, file, "opportunity_assessment_detail.html").

resource(architecture_governance_detail, type, detail).
resource(architecture_governance_detail, name, "Architecture Governance Detail").
resource(architecture_governance_detail, file, "architecture_governance_detail.html").

resource(operating_model_detail, type, detail).
resource(operating_model_detail, name, "operating_model_detail").
resource(operating_model_detail, file, "operating_model_detail.html").
