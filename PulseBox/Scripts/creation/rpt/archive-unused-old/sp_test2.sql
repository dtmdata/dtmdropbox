create or replace procedure SP_test2   (IN_company_id        IN  number,
                                        IN_dept_id_list      IN  varchar2, --comma-sep DEPT_ID list
                                        p_recordset          OUT SYS_REFCURSOR)
AS
/*
to test:
SQL> variable rc refcursor;
SQL> exec sp_test2(3005, '4010,4020', :rc);
SQL> print rc; 
  
*/

v_IN_company_id     integer := IN_company_id;
v_IN_dept_id_list  varchar2(256) := IN_dept_id_list;  --proc will likely fail if app passes in string > this length. len=32k is max.
v_sql varchar2(100) := '';  
CRLF varchar2(2) := chr(13)||chr(10);

BEGIN
--build sql on-the-fly, including the input string of DEPT_IDs.
/*
v_sql :=          'OPEN p_recordset FOR ' ||CRLF;
v_sql := v_sql || 'SELECT  dept_id, dept_name from department ' ||CRLF;
v_sql := v_sql || 'WHERE dept_id IN(' || v_IN_dept_id_list || ')' ||CRLF;   -- e.g. '4010,4020'
v_sql := v_sql || ';';
*/


--v_sql := v_sql || 'SELECT  dept_id, dept_name from department WHERE dept_id IN(' || v_IN_dept_id_list || ');'
--v_sql := v_sql || 'WHERE dept_id IN(' || v_IN_dept_id_list || ');' ||CRLF;   -- e.g. '4010,4020'
--v_sql := v_sql || ';';
OPEN p_recordset FOR    'SELECT  dept_id, dept_name from department WHERE dept_id IN(' || v_IN_dept_id_list || ')' ;
   --execute immediate(v_sql);
   --dbms_output.put_line('SQL is: ' ||CRLF|| v_sql);
;

END SP_test2
;

/
