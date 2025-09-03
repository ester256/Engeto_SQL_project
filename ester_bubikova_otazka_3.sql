-- otázka 3

with data as ( 
	select
		year,
		category_code as food_code,
		category_name as food_item,
		round(avg(avg_price::numeric), 2) as avg_price
    from t_ester_bubikova_project_sql_primary_final tebpspf
	group by year, food_code, food_item
),
first_last as ( 
	select 
		food_code,
		food_item,
		min(year) as first_year,
		max(year) as last_year
	from data
	group by food_code, food_item
)
select
	fl.food_code,
	fl.food_item,
	first_d.avg_price as first_price,
	last_d.avg_price as last_price,
	last_d.avg_price - first_d.avg_price as difference,
	round(100.0 * (last_d.avg_price - first_d.avg_price) / first_d.avg_price, 2) as pct_change
from first_last as fl
join data as first_d
	on fl.first_year = first_d.year
	and fl.food_code = first_d.food_code
join data as last_d
	on fl.last_year = last_d.year
	and fl.food_code = last_d.food_code
order by pct_change;