/**************************************************************************************************
==> show all data to paid PBox customers in graphical format.
or, pay-up to get raw data output....?  or just don't offer raw data reports at all?


1) what is current/Past pulse of the Company?   
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

--entire Company, by Date:
select 
   to_char(A.answer_date,'YYYYMMDD') ANS_DT, 
   count(*), avg(A.answer_rating), min(A.answer_rating), max(A.answer_rating), stddev(A.answer_rating), variance(A.answer_rating)
from 
   Answer A,
   Employee E
where
                 A.emp_id = E.emp_id 
   and         company_id = &Enter_CompanyID  --e.g. 300=Facebook
-- similarly, can add in DeptID filter
--   and Q.category_id in(<list of relevant Q_IDs>)
group by 
   to_char(A.answer_date,'YYYYMMDD')
order by 
   ANS_DT asc
;






