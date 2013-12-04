/* UNDERSTANDER core BIM concepts */

basic_concept(business_schema).
basic_concept(business_schema_thing).
basic_concept(business_schema_relationship).

basic_concept(influence). 
basic_concept(refines).
basic_concept(measures). 
basic_concept(evaluates).
basic_concept(business_schema_analyses).

basic_concept(indicator).
basic_concept(entity).
basic_concept(situation).
basic_concept(goal).
basic_concept(organizational_situation).
basic_concept(task).

basic_concept(actor).
basic_concept(position).
basic_concept(role).
basic_concept(agent).

basic_concept(process).
basic_concept(action).
basic_concept(resource).

basic_concept(proposition).
basic_concept(directive).
basic_concept(intention).
basic_concept(domain_assumption). 
basic_concept(qualitative_intention).
basic_concept(quantitative_intention). 

/* UNDERSTANDER CI concepts */

basic_concept(entity_category).
basic_concept(business_schema_analyses).
basic_concept(ci_financial-analyses).
basic_concept(ci_enterprise-analyses).
basic_concept(ci_evolutionary-analyses).
basic_concept(ci_environmental-analyses).
basic_concept(ci_competitive-analyses).

/* ci_competitive_analyses */
basic_concept(benchmarking).
basic_concept(bcg_growth_matrix).
basic_concept(competitive_positioning).
basic_concept(customer_segmentation_and_needs_analysis).
basic_concept(customer_value_analysis).
basic_concept(ge_business_screen).
basic_concept(industry_analysis_five_forces).
basic_concept(industry_analysis_nine_forces).
basic_concept(strategic_group_analysis).

/* ci_enterprise_analyses */
basic_concept(blindspot_analysis).
basic_concept(business_model_analysis).
basic_concept(competitor_analysis).
basic_concept(functional_capability_and_resource_analysis).
basic_concept(management_profiling).
basic_concept(mc_kinsey_7s_analysis).
basic_concept(product_line_analysis).
basic_concept(servo_analysis).
basic_concept(shadowing).
basic_concept(supply_chain_analysis).
basic_concept(swot_analysis).
basic_concept(value_chain_analysis).
basic_concept(win_loss_analysis).

/* ci_environmental_analyses */
basic_concept(country_risk_analysis).
basic_concept(sorporate_reputation_analysis).
basic_concept(critical_success_factor_analysis).
basic_concept(driving_forces_analysis).
basic_concept(issue_analysis).
basic_concept(micro_environmental_steep_analysis).
basic_concept(political_and_country_risk_analysis).
basic_concept(scenario_analysis).
basic_concept(stakeholder_analysis).
basic_concept(strategic_relationship_analysis).

/* ci_evolutionary_analyses */
basic_concept(event_and_timeline_analysis).
basic_concept(experience_curve__analysis).
basic_concept(growth_vector_analysis).
basic_concept(historiographical_analysis).
basic_concept(indications_and_warning_analysis).
basic_concept(patent_analysis).
basic_concept(product_life_cycle_analysis).
basic_concept(s_curve_analysis).
basic_concept(technology_forecasting).
basic_concept(war_gaming).

/* ci_financial_analyses */
basic_concept(analysis_of_competing_hypothesis).
basic_concept(competitor_cash_flow_analysis).
basic_concept(financial_ratio_and_statement_analysis).
basic_concept(statistical_analysis).
basic_concept(linchpin_analysis).
basic_concept(strategic_funds_programming).
basic_concept(sustainable_growth_rate_analysis).


/* UNDERSTANDER relations between BIM and CI concepts */

has_subconcept(business_schema,[business_schema_thing,business_schema_relationship]).
has_subconcept(business_schema_thing,
	[indicator,situation,task,entity,proposition]).
has_subconcept(situation,
	[goal,organizational_situation]).
has_subconcept(entity,
	[actor,process,action,resource,entity_category]).
has_subconcept(actor,
	[position,role,agent]).
has_subconcept(proposition,
	[directive,intention,domain_assumption]).
has_subconcept(intention,
	[qualitative_intention,quantitative_intention]).
has_subconcept(business_schema_relationship,
	[influence,refines,measures,evaluates,business_schema_analyses]).
has_subconcept(business_schema_analyses,
	[ci_financial_analyses,
	ci_enterprise_analyses,
	ci_evolutionary_analyses,
	ci_competitive_analyses,
	ci_environmental_analyses]).
has_subconcept(ci_financial_analyses,
	[analysis_of_competing_hypothesis, 
	competitor_cash_flow_analysis,
	financial_ratio_and_statement_analysis,
	statistical_analysis,
	linchpin_analysis,
	strategic_funds_programming,
	sustainable_growth_rate_analysis]).
has_subconcept(ci_evolutionary_analyses,
	[event_and_timeline_analysis,
	experience_curve__analysis,
	growth_vector_analysis,
	historiographical_analysis,
	indications_and_warning_analysis,
	patent_analysis,
	product_life_cycle_analysis,
	s_curve_analysis,
	technology_forecasting,
	war_gaming]).
has_subconcept(ci_environmental_analyses,
	[country_risk_analysis,
	sorporate_reputation_analysis,
	critical_success_factor_analysis,
	driving_forces_analysis,
	issue_analysis,
	micro_environmental_steep_analysis,
	political_and_country_risk_analysis,
	scenario_analysis,
	stakeholder_analysis,
	strategic_relationship_analysis]).
has_subconcept(ci_competitive_analyses, 
	[benchmarking,
	bcg_growth_matrix,
	competitive_positioning,
	customer_segmentation_and_needs_analysis,
	customer_value_analysis,
	ge_business_screen,
	industry_analysis_five_forces,
	industry_analysis_nine_forces,
	strategic_group_analysis]).
has_subconcept(ci_enterprise_analyses,
	[blindspot_analysis,
	business_model_analysis,
	competitor_analysis,
	functional_capability_and_resource_analysis,
	management_profiling,
	mc_kinsey_7s_analysis,
	product_line_analysis,
	servo_analysis,
	shadowing,
	supply_chain_analysis,
	swot_analysis,
	value_chain_analysis,
	win_loss_analysis]).

generalization(business_schema,[business_schema_thing,business_schema_relationship]).

/* UNDERSTANDER rules */

/* if X is a concept (the boundary condition) */
partsof(X,[X]) :- concept(X).   
/* if X is a subconcept) */
partsof(X,P) :- 
	has_subconcept(X,Subconcept), 
	partsoflist(Subconcept,P).	
partsoflist([],[]).
partsoflist([P|Tail],Total) :-
	partsof(P,Headparts),
	partsoflist(Tail,Tailparts),
	append(Headparts,Tailparts,Total). 



/* 
ako(chair,furniture).
ako(chair,seat).
isa(your_chair,chair).
isa(you,person).
made_of(your_chair,wood).
colour(wood,brown).
belongs_to(your_chair,you).


pop(usa, 203).
pop(india, 548).
pop(china, 800).
pop(brazil, 108).
area(usa, 3).
area(india, 1).
area(china, 4).
area(brazil, 3).

density(X,Y) :- pop(X,P), area(X,A), Y is P/A.


fuel_consumed(waster,[3.1,10.4,15.9,10.3]).
fuel_consumed(guzzler,[3.2,9.9,13.0,11.6]).
fuel_consumed(prodigal,[2.8,9.8,13.1,10.4]).

equal_or_better_consumption(Good,Bad) :- 
	Threshold is (Good+Bad)/40, 
	Worst is Bad+Threshold, 
	Good < Worst. 

always_better([],[]).
always_better([Con1|T1],[Con2|T2]) :-
	equal_or_better_consumption(Con1, Con2),
	always_better(T1,T2).
	

prefer(Car1,Car2) :- 
	fuel_consumed(Car1,Con1), 
	fuel_consumed(Car2,Con2),
	always_better(Con1,Con2).

*/







