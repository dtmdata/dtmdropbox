/*

sql#1 report(company pulse)
div by
< sql#1 filtered down to list of Depts  >

e.g. if 3 depts(x, y, and z), then show 3 data series overlayed with #1 company historical pulse
*/


/* basic DEPARTMENT pulse rpt:  show overall DEPARTMENT pulse, for a single COMPANY, historic */
--filter by (CompanyID)+(DeptID list), by Date:


/* 
THIS STILL NEEDS TEST/VALIDATION for DEPT_IDs; something not quite right. 
e.g. dept 404 should show 1 rec. 
     deptid = 400,401 seems to show too many rows
*/


--e.g. 300=Facebook
--e.g. 400,401 : need comma-separated ID list for this (app needs to create this from user-selecteed values from GUI)

set lines 200
set pages 200

select 
   E.company_id,
   D.dept_id, 
   to_char(A.answer_date,'YYYYMMDD') ANS_DT, 
   count(*) COUNT, 
   avg(A.answer_rating) AVG, 
   min(A.answer_rating) MIN, 
   max(A.answer_rating) MAX, 
   stddev(A.answer_rating) STDDEV, 
   variance(A.answer_rating) VARIANCE 
from 
   Answer     A, 
   Employee   E, 
   DEPARTMENT D 
where 
                 A.emp_id = E.emp_id  
   and       E.company_id = D.company_id 
   and       E.company_id = &Enter_CompanyID  
   and       D.dept_id in(&Enter_DeptID_list) 
group by 
   E.company_id, D.dept_id, to_char(A.answer_date,'YYYYMMDD') 
order by 
   D.dept_id, ANS_DT  
;

