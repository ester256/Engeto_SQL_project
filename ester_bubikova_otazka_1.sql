-- otázka 1


-- detailní přehled

with wage_data as (
    select 
        year,
        industry_code,
        industry_name,
        avg_wage
    from t_ester_bubikova_project_sql_primary_final
    group by year, industry_code, industry_name, avg_wage
)
select
	wg.year,
	wg.industry_code,
	wg.industry_name,
	wg.avg_wage,
	lag(wg.avg_wage) over (partition by wg.industry_code order by wg.year) as prev_year_wage,
	wg.avg_wage - lag(wg.avg_wage) over (partition by wg.industry_code order by wg.year) as diff_wage,
	round(100.0 * (wg.avg_wage - lag(wg.avg_wage) over (partition by wg.industry_code order by wg.year)) 
	/ lag(wg.avg_wage) over (partition by wg.industry_code order by wg.year), 2) as percentage_change
from wage_data as wg
order by wg.industry_code, wg.year; 





-- celkový výsledek

with wage_data as (
    select 
        year,
        industry_code,
        industry_name,
        avg_wage
    from t_ester_bubikova_project_sql_primary_final
    group by year, industry_code, industry_name, avg_wage
),
first_last as (
    select
        industry_code,
        industry_name,
        min(year) as first_year,
        max(year) as last_year
    from wage_data
    group by industry_code, industry_name
)
select
    fl.industry_code,
    fl.industry_name,
    fl.first_year,
    fl.last_year,
    wd_first.avg_wage as first_wage,
    wd_last.avg_wage as last_wage,
    wd_last.avg_wage - wd_first.avg_wage as diff_wage,
    round(100.0 * (wd_last.avg_wage - wd_first.avg_wage) / wd_first.avg_wage, 2) as percentage_change
from first_last as fl
join wage_data as wd_first 
    on wd_first.industry_code = fl.industry_code
   and wd_first.year = fl.first_year
join wage_data as wd_last
    on wd_last.industry_code = fl.industry_code
   and wd_last.year = fl.last_year
order by fl.industry_code;

