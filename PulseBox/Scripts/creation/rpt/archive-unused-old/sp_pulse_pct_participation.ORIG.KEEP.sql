/**************************************************************************************************
Displays the historical participation rate of an individual Company.

INPUT  :  COMPANY.company_id
OUTPUT :  sys_refcursor 

D.Durland  12Dec2014


INFO:
The 'participation' should be based on #distinct registered emps.
Not #emps in overall COMPANY(i.e. not the SEC-reported #).
Not #questions answered.  

==> Do we need a Calendar table to do CARTESIAN with, instead of the "C" table below?
    Or can step-function chart be graphed with sparse list of Dates?

**************************************************************************************************/

CREATE or REPLACE procedure SP_PULSE_PCT_PARTICIPATION (IN_company_id  	IN  number,
							p_recordset 	OUT SYS_REFCURSOR) 
AS 

BEGIN
   OPEN p_recordset For
	SELECT
	  count(distinct(X.EMP_ID)) / 
	  (SELECT count(distinct(e.emp_id)) FROM employee E WHERE E.company_id  = IN_company_id  
	  )  as PCT_PARTICIPATION ,
	  C.ANSWER_DATE
	FROM 
	  (SELECT A.emp_id EMP_ID, to_char(A.answer_date, 'YYYYMMDD')  ANS_DT
	   FROM Answer A, Employee E
	   WHERE  A.emp_id = E.emp_id
	      and E.company_id  = IN_company_id
	  ) X,
	  (SELECT distinct(to_char(answer_date,'YYYYMMDD')) ANSWER_DATE
	   FROM  Answer A1, 	Employee E1
	   WHERE  A1.emp_id = E1.emp_id
		and E1.company_id = IN_company_id
	  ) C   --cartesian list of dates
	WHERE  X.ANS_DT <= C.ANSWER_DATE
	GROUP BY  C.ANSWER_DATE
	ORDER BY C.ANSWER_DATE
	;

END SP_PULSE_PCT_PARTICIPATION;

/
