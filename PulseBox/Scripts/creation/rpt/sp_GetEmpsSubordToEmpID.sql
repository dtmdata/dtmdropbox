create or replace procedure sp_GetEmpsSubordToEmpID (IN_company_id  IN  number,  --this is the company_id of the logged-in app user
                                                     IN_emp_id      IN  number,  --this is the emp_id of the logged-in app user
--													 IN_start_date_range IN date,
--													 IN_end_date_range  IN date,
                                                     p_recordset    OUT SYS_REFCURSOR)
AS

v_IN_company_id     integer := IN_company_id;
v_IN_emp_id         integer := IN_emp_id;
--v_IN_start_date_range  date := to_date(IN_start_date_range,'DD-MON-YYYY');
--v_IN_end_date_range    date := to_date(IN_end_date_range  ,'DD-MON-YYYY');

v_DEFAULT_TIMEFRAME integer := 45;

BEGIN
open p_recordset for
select LVL, count(LVL)
from (
    SELECT
       E.dept_id,
       D.dept_name,
       E.emp_id,
       v_IN_emp_id as "top_lvl_mgr_id",
       SYS_CONNECT_BY_PATH(E.emp_id, ' <= ') as "REPORTING_PATH",
       LEVEL as "LVL" --what level is subordinate relative to top_lvl_mgr_id ?
    FROM
       employee E,
	   department D
    WHERE
       1=1
       and E.dept_id = D.dept_id
       and E.company_id = v_IN_company_id  --3005 --exec sp_GetEmpsSubordToEmpID(3005, 6029, :rc)
    CONNECT BY PRIOR E.emp_id = E.manager_id     --testing emp_id: 6034(mid),6043(mid), or 6029(top) or 6059(leaf)
    START WITH
       E.manager_id = v_IN_emp_id  --emp_id of the person running this report.
    order by dept_name ASC
)
group by LVL
order by LVL
;

END sp_GetEmpsSubordToEmpID;
/