define my_company='SkiBreck'

SPOOL UPDATE.LST
PROMPT
PROMPT DDL: Update the emp_update_temp table....
@update-emp_update_temp.sql
PROMPT
PROMPT

PROMPT
PROMPT DDL: Mark the records deleted in the employee table.................................................
@delete.sql
PROMPT
PROMPT

PROMPT
PROMPT DDL:Update the records in the employee table
@updates-employee_table.sql
PROMPT
PROMPT

spool off;
exit;