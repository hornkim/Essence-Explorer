
:- discontiguous alpha/3.
:- multifile alpha/3.

project(kims_project, name, "Kims project").

%
% List the practice, concern and Element relatinships
%
concern_element(alpha, kims_project, endeavour, team_1).
concern_element(alpha, kims_project, endeavour, squad).
concern_element(alpha, kims_project, endeavour, squad_1).
concern_element(work_product, kims_project, solution, product_backlog_1).
concern_element(work_product, kims_project, solution, product_debt_backlog).
concern_element(work_product, kims_project, solution, product_debt_backlog_1).


% so can have a sub alpha that is an Instance or Sub Type 
% do we have this as field of alpha, e.g. parent, instance.

% an alpha instance stores just checkpoints on the alpha
alpha(team_1, name, "The XYZ Project Team").
alpha(team_1, instance_of, team).

% An Extension element
% a sqaud is a team alpha. It will use points and states from team, and store checkpoints seperatley.
% minimally have to replace the alpha  clause, then others as required
alpha(squad, name, "Squad").
alpha(squad, is_a, team).
alpha(squad, description, ["The team actively engaged in the development, maintenance, delivery and support of a specific software system."]).

% an instance of a Extension Element - just stores checkpoints
alpha(squad_1, name, "Squad No 1").
alpha(squad_1, instance_of, squad).


work_product(product_backlog_1, instance_of, product_backlog).
work_product(product_backlog_1, name, "The XYZ Project product backlog.").

work_product(product_debt_backlog, is_a, product_backlog).
work_product(product_debt_backlog, name, "The Technical Debt product backlog.").
work_product(product_debt_backlog, description, ["Technical Debt Backlog for Product XYZ."]).

work_product(product_debt_backlog_1, instance_of, product_debt_backlog).
work_product(product_debt_backlog_1, name, "The Technical Debt 1").
