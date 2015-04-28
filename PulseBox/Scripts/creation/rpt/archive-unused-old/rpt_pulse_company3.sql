
/* revised. 20150120/dd
BASIC rpt:  show overall company pulse, historic 
*/


/*
return pulse of Company if Dept_id is null, 
else just pulse of the people from 1+ of the Depts chosen via GUI.
these Depts must be BELOW the org-level of the person running the report.
(maybe this person would have "standard" PRIV level...??)
*/


--sorted by EmpID and Date:
select 
   E.emp_id, to_char(A.answer_date,'YYYYMMDD') ANS_DT, count(*), 
   avg(A.answer_rating), min(A.answer_rating), max(A.answer_rating), stddev(A.answer_rating), variance(A.answer_rating)
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



--from sp_pulse_company:
    SELECT
	      A.company_id 		as COMPANY_ID,
	      A.answer_date 	as ANS_DT, 
	      count(*) 			                   	 as COUNT, 
	      round(avg(A.answer_rating),2) 	   as AVG, 
	      min(A.answer_rating) 	             as MIN, 
	      max(A.answer_rating) 	             as MAX, 
	      round(stddev(A.answer_rating),2) 	 as STDDEV, 
	      round(variance(A.answer_rating),2) as VARIANCE
     FROM 
        Answer   A
     WHERE
        A.Company_Id = IN_company_id
        AND A.answer_date BETWEEN IN_start_date_range and IN_end_date_range
     GROUP BY 
        A.company_id, A.answer_date
     ORDER BY ANS_DT;


/* 
company_id 3005 has multi-level depts to play/test with

*/

--modified to include Dept choices:
--need hierarchical query first, to determine emp list 


select emp_id, manager_id, dept_id 
from employee
where

 

-- http://stackoverflow.com/questions/11624568/oracle-hierarchical-query-find-entire-tree-from-the-root-giving-a-any-node :

with t as (
select case when mgr.emp_id = 1 then
1 else 0 end is_root, emp.emp_id, emp.manager_id
from employee mgr right outer join employee emp
on mgr.emp_id = emp.manager_id
),
tmp as (
select level, emp_id, manager_id ,
connect_by_root manager_id as root_id,
manager_id||sys_connect_by_path(emp_id,
',') cbp 
from t
connect by prior emp_id = manager_id
start with t.is_root =
1 )
select * from tmp
where tmp.root_id in (select root_id from tmp where emp_id = 101 or manager_id = 101)




select level, emp_id, manager_id ,
connect_by_root manager_id as root_id,
manager_id||sys_connect_by_path(emp_id, ',') cbp 
from (
select 
case 
when mgr.emp_id = 1 
   then 1 
else 
   0 
end is_root, 
emp.emp_id, 
emp.manager_id
from employee mgr right outer join employee emp
on mgr.emp_id = emp.manager_id
)

-----------

--http://www.dba-oracle.com/t_advanced_sql_connect_by_loop.htm :

select level, emp_id, manager_id ,
       connect_by_root emp_id as root_id
   from employee
   where company_id=3005 and emp_id=6034
connect by prior emp_id = manager_id -- down the tree
start with manager_id in ( -- list up the tree
     select manager_id 
       from employee
       where company_id=3005 and emp_id=6034
     connect by nocycle emp_id = prior manager_id -- up the tree
     start with emp_id = 6034
     )
;


------- WORKS --------------
col P for a50

SELECT 
   level, manager_id, emp_id, SYS_CONNECT_BY_PATH(E.emp_id, ' => ') P 
FROM 
   employee E 
WHERE 
   E.DEPT_id IN(select distinct dept_id from employee where company_id=3005)
and company_id=3005
CONNECT BY 
   PRIOR emp_id=manager_id
START WITH 
   manager_id = &&enter_emp_id  --emp_id of the person running this report.
order by level
;











