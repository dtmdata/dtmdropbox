/********************************************************************************************************************************* 
Displays historical Company pulse for a given Company's company_id.
This includes all ANSWER_RATINGs for the company_id passed in, IF they are within 
the date range chosen in the web app, inclusive.

D.Durland 20150122 
--created:
This is based on SP_COMPANY_PULSE, but first determines all subordinate DEPTs of the EMP_ID passed in.
Then determines list of all EMP_IDs in the unique DEPT_ID list. 
Then calculates pulse in same manner that SP_COMPANY_PULSE does.

D.Durland 20150129
--revised st.proc def'n: 
Now shows pulse of all of the EMP_IDs passed in via comma-separated string.  
sp_GetDeptsSubordinateToEmpID() is called by GUI to return the DEPT_ID list for User to choose from via GUI.
These DEPT_IDs are passed in to determine which EMP_IDs' ANSWERS should be included in resulting Pulse, which 
is returned in p_recordset.

**********************************************************************************************************************************/

create or replace procedure SP_PULSE_DEPTS   (IN_company_id        IN  number,
                                              IN_dept_id           IN  varchar2, --comma-sep DEPT_ID list sent from the web app
                                              IN_start_date_range  IN  varchar2,
                                              IN_end_date_range    IN  varchar2,
                                              p_recordset          OUT SYS_REFCURSOR)
AS

v_IN_company_id     integer := IN_company_id;
v_IN_dept_id        varchar2(255) := IN_dept_id;  --use this string to concat with IN() in WHERE clause
v_IN_start_date_range  date := to_date(IN_start_date_range,'DD-MON-YYYY'); 
v_IN_end_date_range    date := to_date(IN_end_date_range  ,'DD-MON-YYYY'); 

v_DEFAULT_TIMEFRAME integer := 45;

BEGIN
--assign default time window if either START or END dates are not passed in.
if (v_IN_start_date_range IS NULL or v_IN_start_date_range='') 
then 
   v_IN_start_date_range := sysdate - v_DEFAULT_TIMEFRAME;
end if; 

if (v_IN_end_date_range IS NULL or v_IN_end_date_range='')
then 
   v_IN_end_date_range := sysdate;
end if;

  OPEN p_recordset FOR
     SELECT
	      A.company_id                       as COMPANY_ID,
	      A.answer_date                      as ANS_DT,
	      count(*)                           as COUNT,
	      round(avg(A.answer_rating),2)      as AVG,
	      min(A.answer_rating)               as MIN,
	      max(A.answer_rating)               as MAX,
	      round(stddev(A.answer_rating),2) 	 as STDDEV,
	      round(variance(A.answer_rating),2) as VARIANCE
     FROM
        Answer   A
     WHERE
        1=1
        AND A.answer_date BETWEEN to_date(v_IN_start_date_range, 'DD-MON-YYYY') 
			      AND to_date(v_IN_end_date_range,   'DD-MON-YYYY')
---        AND A.answer_date BETWEEN to_date('01-JAN-1900', 'DD-MON-YYYY') 
---			      AND to_date('31-DEC-9999', 'DD-MON-YYYY')
--        AND A.answer_date BETWEEN to_date('01-FEB-2013', 'DD-MON-YYYY') 
--			      AND to_date('28-FEB-2013', 'DD-MON-YYYY')
        AND emp_id IN(
                      select emp_id from employee where dept_id IN     --(?????  -- ' v_IN_dept_id ||')'
                          (
                          select DISTINCT dept_id
                          from (
                                SELECT
                                dept_id, emp_id, IN_emp_id as "top_lvl_mgr_id", SYS_CONNECT_BY_PATH(E.emp_id, ' <= ') P
                                FROM
                                   employee E
                                WHERE
                                   1=1
                                   and company_id = IN_company_id  --3005
                                CONNECT BY
                                PRIOR emp_id=manager_id     --testing: 6034(mid),6043(mid), or 6029(top) or 6059(leaf)
                                START WITH
                                   manager_id = IN_emp_id  --emp_id of the person running this report.
                                )
                          group by dept_id
                          )
                     )
     GROUP BY
        A.company_id, A.answer_date
     ORDER BY ANS_DT
;

END SP_PULSE_DEPTS;
/




