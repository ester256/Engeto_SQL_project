-- otázka 4

with data as ( 
	select
		year,
		round(avg(avg_price::numeric), 2) as avg_food_price,
		round(avg(avg_wage::numeric), 2) as avg_overall_wage
	from t_ester_bubikova_project_sql_primary_final tebpspf
	group by year
)
select
	d.year,
	d.avg_food_price,
	lag(avg_food_price) over (order by year) as prev_year_price,
	avg_food_price - lag(avg_food_price) over (order by year) as diff_price,
	round(100.0 * (avg_food_price - lag(avg_food_price) over (order by year))
	/ lag(avg_food_price) over (order by year), 2) as percentage_change_price,
	d.avg_overall_wage,
	lag(avg_overall_wage) over (order by year) as prev_year_wage,
	avg_overall_wage - lag(avg_overall_wage) over (order by year) as diff_wage,
	round(100.0 * (avg_overall_wage - lag(avg_overall_wage) over (order by year))
	/ lag(avg_overall_wage) over (order by year), 2) as percentage_change_wage
from data as d;