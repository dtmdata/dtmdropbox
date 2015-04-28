create or replace procedure sp_GetIndustryForCompany (
  IN_company_id  IN  number,  --this is the company_id of the logged-in app user
  p_recordset   OUT SYS_REFCURSOR
)
AS

v_IN_company_id     integer := IN_company_id;
v_DEFAULT_TIMEFRAME integer := 45;

BEGIN
open p_recordset for
select
  B.industry_id, B.industry_name, A.company_id, A.company_name
from
( select
    MM.industry_id as industry_id, I1.INDUSTRY_NAME as industry_name, MM.company_id as company_id, C.company_name as company_name
  from
    MM_INDUSTRY_COMPANY  MM,
    industry I1,
    company C
  where
    1=1
    and MM.industry_id = I1.INDUSTRY_ID
    and MM.COMPANY_ID  = C.COMPANY_ID
    and MM.company_id  = v_IN_company_id  --3000
) A,
(select
  I2.industry_id as industry_id, I2.INDUSTRY_NAME as industry_name, null, null
from
  industry I2
) B
where
  A.industry_id(+) = B.industry_id
order by  B.industry_name, A.company_name
;


END sp_GetIndustryForCompany;
/