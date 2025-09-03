-- otázka 2

with data as ( 
	select
		year,
		category_code as food_code,
		category_name as food_item,
		amount,
		round(avg(avg_price::numeric), 2) as avg_price,
        round(avg(avg_wage::numeric), 2) as avg_wage
    from t_ester_bubikova_project_sql_primary_final tebpspf
	where category_name in ('Chléb konzumní kmínový', 'Mléko polotučné pasterované')
	group by year, food_code, food_item, amount
),
first_last as ( 
	select 
		food_code,
		food_item,
		amount,
		min(year) as first_year,
		max(year) as last_year
	from data
	group by food_code, food_item, amount
)
select
	fl.food_code,
	fl.food_item,
	fl.amount,
	first_d.avg_price as first_price,
	last_d.avg_price as last_price,
	first_d.avg_wage as first_wage,
	last_d.avg_wage as last_wage,
	round(first_d.avg_wage / first_d.avg_price, 2) as first_amount_per_salary,
	round(last_d.avg_wage / last_d.avg_price, 2) as last_amount_per_salary, 
	round((last_d.avg_wage / last_d.avg_price) - (first_d.avg_wage / first_d.avg_price), 2) as diff_amount_per_salary,
	round(100.0 * ((last_d.avg_wage / last_d.avg_price) - (first_d.avg_wage / first_d.avg_price)) / (first_d.avg_wage / first_d.avg_price), 2) as pct_change_amount
from first_last as fl
join data as first_d
	on fl.first_year = first_d.year
	and fl.food_code = first_d.food_code
join data as last_d
	on fl.last_year = last_d.year
	and fl.food_code = last_d.food_code
order by fl.food_code;