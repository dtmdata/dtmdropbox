create or replace procedure SP_PULSE_PCT_PARTICIPATION (IN_company_id        IN  number,
                                                        IN_dept_id           IN  varchar2, --comma-sep DEPT_ID list sent from the web app
                                                        IN_start_date_range  IN  varchar2 DEFAULT NULL,
                                                        IN_end_date_range    IN  varchar2 DEFAULT NULL,
                                                        p_recordset          OUT SYS_REFCURSOR)
AS


v_IN_company_id  integer       := IN_company_id;
v_IN_dept_id     varchar2(255) := IN_dept_id;

v_IN_start_date_range  date := to_date(IN_start_date_range,'DD-MON-YYYY');
v_IN_end_date_range    date := to_date(IN_end_date_range  ,'DD-MON-YYYY');
v_DEFAULT_TIMEFRAME integer := 45;

v_sql_cleanup varchar2(255) := '';


BEGIN
--assign default time window if either START or END dates are not passed in.
if (v_IN_start_date_range IS NULL or v_IN_start_date_range='')
then
   v_IN_start_date_range := sysdate - v_DEFAULT_TIMEFRAME;
end if;

if (v_IN_end_date_range IS NULL or v_IN_end_date_range='')
then
   v_IN_end_date_range := sysdate;
end if;

dbms_output.put_line('start <=> end used is: ' || v_IN_start_date_range || ' <=> ' || v_IN_end_date_range);

/*
|| populate table GTT_ID_LIST with DEPT_IDs from the app, i.e. v_IN_dept_id
*/
--sp_parse_id_list(v_IN_dept_id, :v_rc);
sp_parse_id_list(v_IN_dept_id);  --inserts individual dept_id values into GTT_ID_LIST table.

OPEN p_recordset FOR
select
  NUM.num_uniq_emps,
  DENOM.tot_emp_count,
  round((NUM.num_uniq_emps/DENOM.tot_emp_count)*100, 1) as PCT_PARTICIPATE,
  to_char(NUM.answer_date, 'DD-MON-YYYY') ANSWER_DATE
from
   (select count(num_emp_answers) as num_uniq_emps, answer_date
    from (
	      select count(*) AS num_emp_answers, answer_date, company_id, dept_id, emp_id
          from
            answer A,
            gtt_id_list G
          where
          1=1
          and A.company_id = v_IN_company_id   --3005/4010,4020,4030 ;  3000/4000,4001 ;
          and A.dept_id = G.id_list
          and A.answer_date between v_IN_start_date_range
                                and v_IN_end_date_range
--and A.answer_date between to_date('01-jan-2010', 'DD-MON-YYYY')
--                      and to_date('31-dec-9999', 'DD-MON-YYYY')
          group by answer_date, company_id, dept_id, emp_id
          )
    group by answer_date
   ) NUM,
   (select count(*) AS tot_emp_count
    from employee E, gtt_id_list G
    where E.dept_id = G.id_list
   ) DENOM
order by NUM.answer_date
;


--OnProcExit, cleanup rows for this session so they do not begin to accumulate in this GTT.
v_sql_cleanup := 'delete from GTT_ID_LIST';   --remove any remaining rows from this GTT user's session
execute immediate v_sql_cleanup;
commit;

END SP_PULSE_PCT_PARTICIPATION;
/
