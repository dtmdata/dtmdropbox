--list companies and which industries they are in
set pagesize 200
select a.company_name, b.industry_name
from  company a, industry b, mm_industry_company c
where a.company_id=c.company_id
and b.industry_id=c.industry_id
order by 2,1
/
