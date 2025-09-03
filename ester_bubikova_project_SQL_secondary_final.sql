create table t_ester_bubikova_project_SQL_secondary_final as ( 
	with economy_data as (  
		select distinct *
		from economies
),
	countries_data as ( 
		select distinct *
		from countries
),
	religion_data as (  
		select distinct *
		from religions
),
	life_exp_data as (  
		select distinct *
		from life_expectancy
)
	select
		ed.year,	
		ed.country,
		cd.iso2,
		cd.region_in_world,
		ed.gdp,
		ed.gini,
		ed.taxes,
		cd.currency_code,
		cd.currency_name,
		ed.population,
		ed.fertility,
		cd.median_age_2018,
		ed.mortaliy_under5,
		led.life_expectancy,
		cd.government_type,
		rd.religion,
		rd.population as religion_population
	from economy_data as ed
	left join countries_data as cd
		on ed.country = cd.country
	left join life_exp_data as led
		on ed.year = led.year
		and ed.country = led.country
	left join religion_data as rd
		on ed.country = rd.country
		and ed.year = rd.year
	where ed.country in (
		select country
		from countries c 
		where continent = 'Europe'
	)
);
