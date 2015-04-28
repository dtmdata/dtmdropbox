create or replace procedure SP_PULSE_ATTRITION (IN_company_id        IN  number,
                                                IN_dept_id           IN  varchar2, --comma-sep DEPT_ID list sent from the web app
                                                IN_start_date_range  IN  varchar2 DEFAULT NULL,
                                                IN_end_date_range    IN  varchar2 DEFAULT NULL,
                                                p_recordset          OUT SYS_REFCURSOR)
AS
v_IN_company_id     integer := IN_company_id;
v_IN_dept_id        varchar2(255) := IN_dept_id;

v_IN_start_date_range  date := to_date(IN_start_date_range,'DD-MON-YYYY');
v_IN_end_date_range    date := to_date(IN_end_date_range  ,'DD-MON-YYYY');
v_DEFAULT_TIMEFRAME integer := 45;

v_sql_cleanup varchar2(255) := '';

--v_rc refcursor;  --how to make this an OUT var, for debug from within sp_pulse_depts() ???

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
     QC.category_name                       as CATEGORY,
  	 A.company_id                           as COMPANY_ID,
  	 to_char(A.answer_date, 'DD-MON-YYYY')  as ANS_DT,
  	 count(*)                               as COUNT,
	 round(avg(A.answer_rating),2)          as AVG,
	 min(A.answer_rating)                   as MIN,
	 max(A.answer_rating)                   as MAX,
	 round(stddev(A.answer_rating),2) 	    as STDDEV,
	 round(variance(A.answer_rating),2)     as VARIANCE
  from
    GTT_ID_LIST D, --dept_id list based on User choice from app
    answer A,
    question Q,
    (select category_id, company_id, category_name
     from question_category
     where upper(category_name) = upper('attrition')
    ) QC
  where
     1=1
     and A.dept_id = D.id_list   --dept_id=4001
     and A.company_id=v_IN_company_id
     and A.question_id=Q.question_id
     and Q.category_id = QC.category_id
     and A.answer_date BETWEEN v_IN_start_date_range
                           and v_IN_end_date_range
  group by QC.category_name, A.company_id, a.answer_date
  order by QC.category_name, A.company_id, A.answer_date
  ;


--OnProcExit, cleanup rows for this session so they do not begin to accumulate in this GTT.
v_sql_cleanup := 'delete from GTT_ID_LIST';   --remove any remaining rows from this GTT user's session
execute immediate v_sql_cleanup;
commit;


END SP_PULSE_ATTRITION;
/
