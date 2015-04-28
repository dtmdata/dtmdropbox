/***********************************************************************************************************************************
sp_GetDeptsSubordinateToEmpID()
D.Durland 20150129
Purpose: 
Obtain a unique list of ALL of the DEPT_IDs under a given EMP_ID, inclusive.
Includes all levels from EMP_ID on down to lowest leaf level in EMP_ID's organization.
Special cases:
1) When emp_id is the CEO's emp_id then ALL Depts should get returned.  It might be more 
efficient to just call SP_PULSE_COMPANY(company_id) to get all of this data.

/************************************************************************************************************************************/

create or replace procedure sp_GetDeptsSubordinateToEmpID (IN_company_id  IN  number,  --this is the company_id of the logged-in app user
                                                           IN_emp_id      IN  number,  --this is the emp_id     of the logged-in app user
                                                           p_recordset    OUT SYS_REFCURSOR)
AS

v_IN_company_id     integer := IN_company_id;
v_IN_emp_id         integer := IN_emp_id;  
--v_IN_start_date_range  date := to_date(IN_start_date_range,'DD-MON-YYYY'); 
--v_IN_end_date_range    date := to_date(IN_end_date_range  ,'DD-MON-YYYY'); 

v_DEFAULT_TIMEFRAME integer := 45;

/* 
--do we want to eventually restrict the emp list (and hence, Dept list) to just the Active emps, as of run-time?
if so, then historical Answers may disappear from pulse chart if Emps left the company prior to run-time.
--bug: problem, or no?
if dept of mgr same as dept of a direct-report emp, then mgr is part of dept list returned. 
else, mgr's dept is not returned and mgr's answers won't be included in pulse.
*/
BEGIN 
open p_recordset for 
   select DISTINCT E.dept_id, D.dept_name
   from employee E, department D
   where
          1=1
          and E.dept_id = D.dept_id
          and E.company_id = 3005
   order by E.dept_id ASC	 
;

END sp_GetDeptsSubordinateToEmpID;
/

