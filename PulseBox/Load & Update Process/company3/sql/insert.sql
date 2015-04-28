define my_company='Boulder Outdoor' 

SPOOL INSERT.LST
PROMPT 
PROMPT DDL Start:  insert into industry tables..................................................................
@insert-industry.sql
PROMPT 
PROMPT 

PROMPT
PROMPT DISABLE Constratins:.................................................
@constraint_disable.sql
PROMPT
PROMPT

PROMPT
PROMPT
PROMPT DDL: Insert into location table......................................
@insert-location.sql
PROMPT
PROMPT

PROMPT
PROMPT DDL: Insert into company table........................................
@insert-company.sql
PROMPT
PROMPT

PROMPT
PROMPT Update the locations table with company_id............................
@update-location.sql
PROMPT
PROMPT

PROMPT
PROMPT Update the company table with location_id.............................
@update-company.sql
PROMPT
PROMPT

PROMPT
PROMPT Enable the constraints................................................
@constraint_enable.sql
PROMPT
PROMPT

PROMPT
PROMPT Update Department_temp table with the compnay info...................
@update-dept_temp.sql
PROMPT
PROMPT

PROMPT
PROMPT Update Industry_temp table with industry_id and company_id info......
@update-industry_temp.sql
PROMPT
PROMPT

PROMPT
PROMPT Insert into MM_INDUSTRY_COMPANY table...............................
@insert-mm_industry_company.sql
PROMPT
PROMPT


PROMPT
PROMPT Insert into department table........................................
@insert-department.sql
PROMPT
PROMPT

PROMPT
PROMPT Update the emp_temp table with company_id, location_id, dept_id.......
@update-emp_temp.sql
PROMPT
PROMPT

PROMPT
PROMPT Insert into the employee table...................................
@insert-employee.sql
PROMPT
PROMPT

PROMPT
PROMPT Update the employee table with managerid and manger yn ............
@update-employee.sql
PROMPT
PROMPT


spool off;
exit;

