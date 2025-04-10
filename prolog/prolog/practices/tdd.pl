 
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


practice(tdd, name, "Test Driven Development (TDD)").
practice(tdd, description, ["Kent Beck defines TDD as a set of techniques that encourage the development of simple projects and the development of a test suite. According to Beck, although TDD is focused on creating automated unit testing, it is not exactly a testing technique. It should be considered as a software design technique. Testing 'drives' development, not the reverse.",
    "Firstly, developers identify the features and write the corresponding unit tests to express the desired functionality. The functionality will be implemented only after the unit test has been written and fails. Writing the test clarifies the design, what the function is about. The requirements are a hypotheses that need to be analysed.",
    "Thinking about a test forces developers to figure out how to design the code. Production code must be designed for testability, and it's hard to do so unless you write the tests first. Developers not QA people must create the tests as this is part of design."]).

concern_element(alpha, tdd, solution, tdd_code_under_test).
concern_element(resource, tdd, solution, tdd_code_under_test_detail).
concern_element(work_product, tdd, solution, design).
concern_element(resource, tdd, solution, design_detail).
concern_element(work_product, tdd, solution, regression_suite).
concern_element(resource, tdd, solution, regression_suite_detail).
concern_element(work_product, tdd, solution, unit_test).
concern_element(resource, tdd, solution, unit_test_detail).

    
alpha(tdd_code_under_test, name, 'Code Under Test').
alpha(tdd_code_under_test, description, ["Working code is at the center of Agile. A unit test will focus on a subset of the designed code, and attest to its quality.",
    "The code under development should be the only development focus until all the unit test pass, and the code is refactored.",
    "What has been produced is more important than new functionality."]).
alpha(tdd_code_under_test, states, [tdd_design_code_tests, tdd_write_tests_to_fail, tdd_write_code_to_pass, tdd_refactor]).
alpha(tdd_code_under_test, resources, [tdd_code_under_test_detail]).

state(tdd_design_code_tests, alpha, tdd_code_under_test).
state(tdd_design_code_tests, name, "Design Code & Tests").
state(tdd_design_code_tests, description, ["Design the code to be testable, clearly understand the hypothesis under test."]).
state(tdd_design_code_tests, checks, ["list"]).

state(tdd_write_tests_to_fail, alpha, tdd_code_under_test).
state(tdd_write_tests_to_fail, name, "Write Tests that Fail").
state(tdd_write_tests_to_fail, description, ["Write the tests, not the code, and make sure they fail"]).
state(tdd_write_tests_to_fail, checks, ["list"]).

state(tdd_write_code_to_pass, alpha, tdd_code_under_test).
state(tdd_write_code_to_pass, name, "Write Code to Pass Tests").
state(tdd_write_code_to_pass, description, ["Now write the code and make it pass the tests"]).
state(tdd_write_code_to_pass, checks, ["list"]).

state(tdd_refactor, alpha, tdd_code_under_test).
state(tdd_refactor, name, "Refactor").
state(tdd_refactor, description, ["When the test is working, it can now be reviewed and refactored"]).
state(tdd_refactor, checks, ["list"]).



work_product(design, name, 'Design').
work_product(design, alpha, software_system).
work_product(design, description, ["The design guides the technical approach and system development."]).
work_product(design, points, "A design may" items ["be comprised of views and models.","use deisgn patterns and frameworks.","be aligned to an Solution, Reference, or Enterprise Architecture"]).
work_product(design, checks, [high_level, views_and_models_defined, design_patterns_employed]).
work_product(design, resources, [design_detail]).

work_product_check(high_level, work_product, design).
work_product_check(high_level, name, "High Level").
work_product_check(high_level, required, optional).
work_product_check(high_level, description, ["Describe...."]).
work_product_check(high_level, checks, ["List...."]).

work_product_check(views_and_models_defined, work_product, design).
work_product_check(views_and_models_defined, name, "Views and Models defined").
work_product_check(views_and_models_defined, required, optional).
work_product_check(views_and_models_defined, description, ["Describe...."]).
work_product_check(views_and_models_defined, checks, ["List...."]).

work_product_check(design_patterns_employed, work_product, design).
work_product_check(design_patterns_employed, name, "Design Patterns Employed").
work_product_check(design_patterns_employed, required, optional).
work_product_check(design_patterns_employed, description, ["Describe...."]).
work_product_check(design_patterns_employed, checks, ["List...."]).



work_product(regression_suite, name, 'Regression Suite').
work_product(regression_suite, alpha, software_system).
work_product(regression_suite, description, ["Each Unit Test is a member of a complete set of tests. The set grows incrementally as more functionality is added. Each test has at seom point in the project failed.",
    "A phenomena of software development is that old bugs can reappear. At any time the complete set of tests can be run demonstating the integrity of all the code.",
    "If any test fails it should be fixed before moving on. regression tests are a defining artefacts of agile."]).
work_product(regression_suite, checks, [regression_defined, regression_automated]).
work_product(regression_suite, resources, [regression_suite_detail]).

work_product_check(regression_defined, work_product, regression_suite).
work_product_check(regression_defined, name, "Regression Suite Defined").
work_product_check(regression_defined, required, optional).
work_product_check(regression_defined, description, ["The tests are managed in a Regression Suite"]).
work_product_check(regression_defined, checks, ["List...."]).

work_product_check(regression_automated, work_product, regression_suite).
work_product_check(regression_automated, name, "Automated Regression").
work_product_check(regression_automated, required, optional).
work_product_check(regression_automated, description, ["Testing across the regression test cases is fully Automated in build"]).
work_product_check(regression_utomated, checks, ["List...."]).



work_product(unit_test, name, 'Unit Test').
work_product(unit_test, alpha, software_system).
work_product(unit_test, description, ["A unit test is a description of a particular test run and its expected results. A unit test examines the behaviour of a distinct unit of work.",
    "This level of testing should ensure that the smaller units (module, class or method) are operating in accordance with what was specified, independent of the rest of the system.",
    "QA cannot be responsible for the code structure, the objects, the modules, the design, therefore tests must be the developer's responsibility. Unit tests are collected in a regression suite.",
    "The suite starts small and incrementally grows, including any test that at some point in the project has been found to fail."]).
work_product(unit_test, points, "Unit tests include" items ["a routine that executes the test.","set up and tear down routines","an assertion defining the condition for the test to succeed.","they are automated"]).
work_product(unit_test, checks, [unit_test_defined, unit_test_implemented]).
work_product(unit_test, resources, [unit_test_detail]).

work_product_check(unit_test_defined, work_product, unit_test).
work_product_check(unit_test_defined, name, "Defined").
work_product_check(unit_test_defined, required, optional).
work_product_check(unit_test_defined, description, ["Describe...."]).
work_product_check(unit_test_defined, checks, ["List...."]).
work_product_check(unit_test_implemented, work_product, unit_test).
work_product_check(unit_test_implemented, name, "Implemented").
work_product_check(unit_test_implemented, required, optional).
work_product_check(unit_test_implemented, description, ["Describe...."]).
work_product_check(unit_test_implemented, checks, ["List...."]).


resource(unit_test_detail, type, detail).
resource(unit_test_detail, name, "unit_test_detail").
resource(unit_test_detail, file, "unit_test_detail.html").

resource(regression_suite_detail, type, detail).
resource(regression_suite_detail, name, "regression_suite_detail").
resource(regression_suite_detail, file, "regression_suite_detail.html").

resource(design_detail, type, detail).
resource(design_detail, name, "design_detail").
resource(design_detail, file, "design_detail.html").

resource(tdd_code_under_test_detail, type, detail).
resource(tdd_code_under_test_detail, name, "tdd_code_under_test_detail").
resource(tdd_code_under_test_detail, file, "tdd_code_under_test_detail.html").


 
