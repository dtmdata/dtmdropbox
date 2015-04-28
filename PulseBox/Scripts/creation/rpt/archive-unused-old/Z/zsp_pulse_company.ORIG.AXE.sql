CREATE or REPLACE procedure SP_PULSE_COMPANY (IN_COMPANY_ID  number)
is

/********************************************************************************************************************************* 
Displays historical Company pulse for a given Company's company_id                                            
Based on A.Ebadi original test script; if any problems here, pls direct your complaints towards him, not me.  ;)  
D.Durland 20141205 
Some refs to check: 
  http://www.akadia.com/services/ora_return_result_set.html 
  http://stackoverflow.com/questions/1305214/c-sharp-return-resultset-from-oracle-store-procedure-and-fill-a-datatable

**********************************************************************************************************************************/

v_temp   number := 0;
rtn_msg  varchar2(4000);

cursor c1 is
select 
   E.company_id COMPANY_ID,
   to_char(A.answer_date,'YYYYMMDD') ANS_DT, 
   count(*) COUNT, 
   round(avg(A.answer_rating),2) AVG, 
   min(A.answer_rating) MIN, 
   max(A.answer_rating) MAX, 
   round(stddev(A.answer_rating),2) STDDEV, 
   round(variance(A.answer_rating),2) VARIANCE
from 
   Answer   A,
   Employee E
where
                 A.emp_id = E.emp_id 
   and         company_id = in_company_id  --e.g. 300=Facebook
-- similarly, can add in DeptID filter
--   and Q.category_id in(<comma-sep-list of relevant Q_IDs ??>)
--and ANSWER_DATE >= sysdate -30    --show DEFAULT of 30 days; GUI selected??
group by 
   E.company_id, to_char(A.answer_date,'YYYYMMDD')
order by 
   ANS_DT asc
;

BEGIN
/* DD: ??we should have captured valid company_id when User logged in to the pbox app?? */


/*
select 
count(*) into v_temp from COMPANY where company_id = IN_COMPANY_ID;

if v_temp=0
then
  rtn_msg := 'Company ID ' || in_company_id || ' does not exist!' ;
  dbms_output.put_line(rtn_msg);
 return ;
end if;

--rtn_msg := 'Company name for Company ID: '||in_company_id||': '  ;
--dbms_output.put_line(rtn_msg);
--return ; 
*/

/*
-- ANS_DT        COUNT        AVG        MIN        MAX     STDDEV   VARIANCE
-- 20120722          4        8.5          5         10 2.38047614 5.66666667
*/
--dd: will this reallly be needed if Webapp is calling the SP ?
for c1_rec in c1 loop
  dbms_output.put_line(c1_rec.company_id || ', ' || c1_rec.ANS_DT || ', ' || 
                      c1_rec.COUNT || ', ' || c1_rec.AVG || ', ' || c1_rec.MIN || ', ' || 
                      c1_rec.MAX || ', ' || c1_rec.STDDEV || ', ' || c1_rec.VARIANCE);
end loop;
/**/

END sp_pulse_company;

/
