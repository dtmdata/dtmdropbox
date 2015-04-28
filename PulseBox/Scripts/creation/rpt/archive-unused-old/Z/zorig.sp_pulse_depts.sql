/********************************************************************************************************************************* 
Displays historical Company pulse for a given Company's company_id.
This includes all ANSWER_RATINGs for the company_id passed in, IF they are within 
the date range chosen in the web app, inclusive.

D.Durland 20150122 
--created:
This is based on SP_COMPANY_PULSE, but first determines all subordinate DEPTs of the EMP_ID passed in.
Then determines list of all EMP_IDs in the unique DEPT_ID list. 
Then calculates pulse in same manner that SP_COMPANY_PULSE does.


**********************************************************************************************************************************/
create or replace procedure SP_PULSE_DEPTS   (IN_company_id        IN  number,
                                              IN_emp_id            IN  number,
                                              IN_start_date_range  IN  varchar2,
                                              IN_end_date_range    IN  varchar2,
                                              p_recordset          OUT SYS_REFCURSOR)
AS

BEGIN
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
        A.Company_Id = IN_company_id
--        A.Company_Id = 3005
        AND A.answer_date BETWEEN to_date(IN_start_date_range, 'DD-MON-YYYY')
			      AND to_date(IN_end_date_range,   'DD-MON-YYYY')
---        AND A.answer_date BETWEEN to_date('01-JAN-1900', 'DD-MON-YYYY')
---			      AND to_date('31-DEC-9999', 'DD-MON-YYYY')
--        AND A.answer_date BETWEEN to_date('01-FEB-2013', 'DD-MON-YYYY')
--			      AND to_date('28-FEB-2013', 'DD-MON-YYYY')
        AND emp_id IN(
                      select emp_id from employee where dept_id IN
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
                                PRIOR emp_id=manager_id     --testing emp_id: 6034(mid),6043(mid), or 6029(top) or 6059(leaf)
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












select DISTINCT dept_id
                          from (
                                SELECT
                                --dept_id, emp_id, IN_emp_id as "top_lvl_mgr_id", SYS_CONNECT_BY_PATH(E.emp_id, ' <= ') PATH
                                dept_id, emp_id, &Enter_emp_id as "top_lvl_mgr_id", SYS_CONNECT_BY_PATH(E.emp_id, ' <= ') PATH
                                FROM
                                   employee E
                                WHERE
                                   1=1
                                   --and company_id = IN_company_id  --3005
                                   and company_id = &Enter_company_id  --3005
                                CONNECT BY
                                PRIOR emp_id=manager_id     --testing emp_id: 6034(mid),6043(mid), or 6029(top) or 6059(leaf)
                                START WITH
                                   --manager_id = IN_emp_id  --emp_id of the person running this report.
                                   manager_id = &Enter_emp_id  --emp_id of the person running this report.
                                )
;








