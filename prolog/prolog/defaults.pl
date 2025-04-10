
% dummy clauses so code works when elements not defined.

:- multifile association_twoway/4.
:- multifile role/3.
:- multifile activity/3.
:- multifile work_product/3.
:- multifile pattern/3.
:- multifile competency/3.

:- discontiguous role/3.
:- discontiguous activity/3.
:- discontiguous work_product/3.
:- discontiguous competency/3.
:- discontiguous pattern/3.

role("","","").
activity("","","").
work_product("","","").
competency("","",""). 
pattern("","","").
