/* 
Obtain a unique list of all of the DEPT_IDs under a given EMP_ID.
Includes all levels from EMP_ID on down to lowest leaf level in EMP_ID's organization.

*/




undefine company_id
undefine mgr_emp_id

select DISTINCT dept_id, dept_name
from (
SELECT
   level as "levels_below_top_emp_id", 
   E.dept_id ,
   D.dept_name ,
   E.emp_id, 
   &&mgr_emp_id as "top_lvl_mgr_id", 
   SYS_CONNECT_BY_PATH(E.emp_id, ' <= ') P
FROM
   employee   E,
   department D
WHERE
1=1
and E.dept_id = D.dept_id
and E.company_id = &&company_id  --3005
CONNECT BY
   PRIOR emp_id = manager_id     --6043(mid) or 6029(top) or 6059(leaf)
START WITH
   manager_id = &&mgr_emp_id  
) 
--group by dept_id, dept_name
order by dept_id ASC
;



undefine company_id
undefine mgr_emp_id

SELECT
   level as levels_below_top_emp_id, 
   E.dept_id as "dept_id", 
   D.dept_name as "dept_name", 
   E.emp_id, 
   &&mgr_emp_id as "top_lvl_mgr_id", 
   SYS_CONNECT_BY_PATH(E.emp_id, ' <= ') P
FROM
   employee   E,
   department D
WHERE
1=1
and E.dept_id = D.dept_id
and E.company_id = &&company_id  --3005
CONNECT BY
   PRIOR emp_id = manager_id     --6043(mid) or 6029(top) or 6059(leaf)
START WITH
   manager_id = &&mgr_emp_id  
order by levels_below_top_emp_id ASC, D.dept_id ASC
;



select 
          --level, --as "levels_below_top_emp_id", 
 	      E.dept_id,  
          D.dept_name,
	      E.emp_id, 
	      v_IN_emp_id,   --as "top_lvl_mgr_id", 
	      SYS_CONNECT_BY_PATH(E.emp_id, ' <= ') as "REPORTING_PATH"


(
        SELECT
          E.dept_id,  
          D.dept_name,
	      E.emp_id, 
	      v_IN_emp_id,   --as "top_lvl_mgr_id", 
	      SYS_CONNECT_BY_PATH(E.emp_id, ' <= ') as "REPORTING_PATH"
        FROM
          employee E,
		  department D
        WHERE
          1=1
          and E.dept_id = D.dept_id
          and company_id = v_IN_company_id  --3005
        CONNECT BY PRIOR E.emp_id = E.manager_id     --testing emp_id: 6034(mid),6043(mid), or 6029(top) or 6059(leaf)
        START WITH
          E.manager_id = v_IN_emp_id  --emp_id of the person running this report.
     )


----------

undefine v_IN_company_id
undefine v_IN_emp_id

   select DISTINCT dept_id, dept_name
   from (
        SELECT 
          E.dept_id,  
          D.dept_name,
	  E.emp_id, 
	  &&v_IN_emp_id as "top_lvl_mgr_id", 
	  SYS_CONNECT_BY_PATH(E.emp_id, ' <= ') as "REPORTING_PATH"
        FROM
          employee E,
	  department D
        WHERE
          1=1
          and E.dept_id = D.dept_id
          and E.company_id =  &&v_IN_company_id  
        CONNECT BY PRIOR E.emp_id = E.manager_id     
        START WITH
          E.manager_id  = &&v_IN_emp_id  
)
;

