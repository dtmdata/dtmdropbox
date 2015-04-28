insert into mm_industry_company(industry_id,company_id,start_date,end_date) 
select industry_id,company_id,sysdate, to_date('12-31-9999','mm-dd-yyyy')
from industry_temp;
commit;