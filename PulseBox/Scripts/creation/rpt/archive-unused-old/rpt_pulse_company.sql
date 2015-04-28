/**************************************************************************************************
==> show all data to paid PBox customers in graphical format.
(other options?  ...pay-up to get raw data output....?  or just don't offer raw data reports at all?


1) what is current/Past pulse of the Company?   
	--show Time series pulse to include all Ratings/weightings, regardless of whether of not all Q's are positive/neg biased (which wuold tend to negate each other)

2) what is 1), compared to:

	1+ Emps?
	1+ Depts?
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
set lines 200
set pages 200

select 
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
-- similarly, can add in DeptID filter
--   and Q.category_id in(<list of relevant Q_IDs>)
--   and "date" >= sysdate -30    --show DEFAULT of 30 days; GUI selected??
group by 
   to_char(A.answer_date,'YYYYMMDD')
order by 
   ANS_DT asc
;


create or replace procedure  sp_pulse_company (in_company_id  number)
                                --RETURN varchar2
is
/* Displays historical Company pulse for a given Company's company_id                                            */
/* Based on A.Ebadi original test script; if any probloems here, pls direct your anger towards him, not me.  ;)  */
/* D.Durland 20141205 */

v_temp    number         := 0 ;
rtn_msg   varchar2(4000)      ;

cursor c1 is
select 
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
   and         company_id = in_company_id  --e.g. 300=Facebook
-- similarly, can add in DeptID filter
--   and Q.category_id in(<list of relevant Q_IDs>)
--   and "date" >= sysdate -30    --show DEFAULT of 30 days; GUI selected??
group by 
   to_char(A.answer_date,'YYYYMMDD')
order by 
   ANS_DT asc
;


BEGIN

/* make sure valid db user */
select 
count(*) into v_temp
from COMPANY
where 
company_id = in_company_id;

if v_temp=0
then
  rtn_msg := 'Company ID ' || in_company_id || ' does not exist!' ;
  dbms_output.put_line(rtn_msg);
 return ;
end if;

dbms_output.put_line('*');
dbms_output.put_line('*');
dbms_output.put_line('*******************************************************');
dbms_output.put_line('Company name for Company ID: '||in_company_id||':');
rtn_msg := 'Company name for Company ID: '||in_company_id||':'  ;
dbms_output.put_line('*******************************************************');

return ; 

/*
for c1_rec in c1 loop
  dbms_output.put_line(c1_rec.company_name);
end loop;
*/

END sp_pulse_company;





