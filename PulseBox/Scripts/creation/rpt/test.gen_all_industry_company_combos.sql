set lines 1000
set pages 0


host del test.all_industry_company_combos.sql
spool    test.all_industry_company_combos.sql
select 'exec sp_pulse_industry('||company_id||', '''||industry_id||''', ''01-jan-2000'', ''31-dec-2015'', :rc);'||chr(13)||chr(10)||' print rc' ||chr(13)||chr(10)
from industry, company;   
spool off

@test.all_industry_company_combos.sql


