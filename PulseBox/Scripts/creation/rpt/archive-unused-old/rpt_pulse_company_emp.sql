/**************************************************************************************************

==> Show each of the Emp_id pulse series as an overlay to the overall series from rpt_pulse_company.sql

1) what is current/historical pulse of the Company *compared to* the Employees?   
	--show Time series pulse to include all Ratings/weightings, regardless of whether of not all Q's are positive/neg biased (which wuold tend to negate each other)

2) what is 1), compared to:

	Emps?
	Depts?
	other Companies in same Sector/Industry?
	other Companies in other Sector/Industries? (combine with above?)
	other Companies in other geo/regions?
		
	--same as all of above, but include a week-over-week comparison, and other Time dimension variations.
	--same as all of above, but include comparisons to Events at various dimension levels(Company, Industry, Geo/Region)


**************************************************************************************************/



/* BASIC rpt:  show overall company pulse, historic */
--First, validate that a manager is running report, and store his Company_ID.
--Then, run below sql, passing in stored Company_ID:
--==>this shows Employees which answered, per day, per Company


--sorted by EmpID + Date:
set lines 200
set pages 200

select 
   E.emp_id EMP_ID,  --broken out by emp_id within the Company
   to_char(A.answer_date,'YYYYMMDD') ANS_DT, 
   count(*) COUNT, 
   avg(A.answer_rating) AVG, 
   min(A.answer_rating) MIN, 
   max(A.answer_rating) MAX, 
   stddev(A.answer_rating) STDDEV, 
   variance(A.answer_rating) VARIANCE
from 
   Answer A,
   Employee E
where
                 A.emp_id = E.emp_id 
   and         company_id = &Enter_CompanyID  --e.g. 300=Facebook
--   and Q.category_id in(<list of relevant Q_IDs>)
group by 
   E.emp_id, --include this line to see individual EmpID historic pulse, overall, i.e. all Answers
   to_char(A.answer_date,'YYYYMMDD')
order by 
   E.emp_id asc,
   ANS_DT asc
;



