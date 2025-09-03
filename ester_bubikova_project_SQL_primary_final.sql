create table t_ester_bubikova_project_SQL_primary_final as (
	with price_data as (
		select
			date_part('year', date_from) as year,
			category_code,
			round(avg(value::numeric), 2) as avg_price
		from czechia_price
		group by year, category_code
	),
	wage_data as ( 
		select
			payroll_year,
			industry_branch_code as industry_code,
			round(avg(value::numeric), 2) as avg_wage			
		from czechia_payroll
		group by payroll_year, industry_code
	),
	economy_data as ( 
		select 
			year,
			round((avg(gini))::numeric, 1) as gini,
			round((avg(gdp))::numeric, 2) as gdp,
			round((avg(taxes))::numeric, 2) as taxes
		from economies
		where country = 'Czech Republic'
		group by year
	)
	select
		p.year,
		p.category_code,
		cpc.name as category_name,
		concat(cpc.price_value, cpc.price_unit) as amount,
		p.avg_price,
		w.industry_code,
		cpib.name as industry_name,
		w.avg_wage,
		e.gdp,
		e.gini,
		e.taxes
	from price_data as p
	join czechia_price_category as cpc 
		on p.category_code::int = cpc.code::int
	join wage_data as w
		on p.year = w.payroll_year
	join czechia_payroll_industry_branch as cpib
		on w.industry_code = cpib.code 
	left join economy_data as e
		on p.year = e.year
);
