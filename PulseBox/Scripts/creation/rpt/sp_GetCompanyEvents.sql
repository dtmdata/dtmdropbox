create or replace procedure sp_GetCompanyEvents (IN_company_id        IN  number,
                                              IN_dept_id           IN  varchar2, --comma-sep DEPT_ID list sent from the web app
                                              IN_start_date_range  IN  varchar2,
                                              IN_end_date_range    IN  varchar2,
                                              p_recordset          OUT SYS_REFCURSOR)
AS
v_IN_company_id  integer       := IN_company_id;
v_IN_dept_id     varchar2(255) := IN_dept_id;

v_IN_start_date_range  date := to_date(IN_start_date_range,'DD-MON-YYYY');
v_IN_end_date_range    date := to_date(IN_end_date_range  ,'DD-MON-YYYY');
v_DEFAULT_TIMEFRAME integer := 45;

v_sql_cleanup varchar2(255) := '';

CRLF varchar2(2)                 := chr(10)||chr(13);
v_sql_error_code  integer        :=  0;
v_sql_error_msg   varchar2(4000) := '';

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
sp_parse_id_list(v_IN_dept_id, 'DEPT');  --inserts individual dept_id values into GTT_ID_LIST table.

OPEN p_recordset FOR
  select E.EVENT_ID, E.EVENT_NAME, E.EVENT_DESC, E.category_id, EC.category_name, EC.category_description, E.event_date as EVT_DT, to_char(E.EVENT_DATE,'DD-MON-YYYY') as EVT_DT_TEXT, E.COMPANY_ID, E.DEPT_ID, D.DEPT_NAME, E.EVENT_PRIVACY, E.START_DATE, E.END_DATE, null
  from
    event E,
	event_category EC, 
  department D
  where
    1=1
    and E.dept_id = d.dept_id 
    and E.dept_id IN(select id_list
		                 from gtt_id_list
		                 where upper(id_type) = upper('DEPT')
						        )
	and E.category_id = EC.category_id
    and E.company_id = v_IN_company_id   --3000/4001,4002,4003  --null comp_id works(no hang; null dept_id string=hang!
    and         E.event_date BETWEEN v_IN_start_date_range
                                 AND v_IN_end_date_range
    and upper(E.event_privacy) = upper('PUBLIC')
  UNION ALL
  select E.EVENT_ID, E.EVENT_NAME, E.EVENT_DESC, E.category_id, EC.category_name, EC.category_description, E.event_date as EVT_DT, to_char(E.EVENT_DATE,'DD-MON-YYYY') as EVT_DT_TEXT, E.COMPANY_ID, E.DEPT_ID, D.DEPT_NAME, E.EVENT_PRIVACY, E.START_DATE, E.END_DATE, G.id_list
  from
    event E,
	event_category EC,
  department D, 
    gtt_id_list G
  where
    1=1
    and E.dept_id = d.dept_id 
    and E.dept_id IN(select id_list
		                 from gtt_id_list
		                 where upper(id_type) = upper('DEPT')
                    )
	and E.category_id = EC.category_id
    and E.company_id = v_IN_company_id   --3000
    and         E.event_date BETWEEN v_IN_start_date_range
                                 AND v_IN_end_date_range
    and (E.dept_id = G.id_list and upper(E.event_privacy) = upper('PRIVATE'))
  order by EVT_DT DESC
  ;


--OnProcExit, cleanup rows for this session so they do not begin to accumulate in this GTT.
v_sql_cleanup := 'delete from GTT_ID_LIST';   --remove any remaining rows from this GTT user's session
execute immediate v_sql_cleanup;
commit;

EXCEPTION
when OTHERS then
   dbms_output.put_line('EXCEPTION OTHERS:  SQLCODE: '||SQLCODE  || ':  SQLERRM: '||SQLERRM||'.');
   --rollback;  --is this relevant in this proc?
   v_sql_error_code := SQLCODE;
   v_sql_error_msg  := SQLERRM;
   raise_application_error (-20002,'Exception OTHERS:  ' || CRLF || v_sql_error_code || ': '||v_sql_error_msg);

END sp_GetCompanyEvents;
/