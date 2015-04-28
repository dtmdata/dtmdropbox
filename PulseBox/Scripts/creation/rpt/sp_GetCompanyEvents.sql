/**************************************************************************************************
Displays the historical Events for an individual Company, at some Departmental level.
User chooses which Dept_IDs to included.

D.Durland  20150219

INFO:
4) Display Company Events.  For entire company or a department. 
Events to include are:
	All Public events for the Company
	  +
	All Private events for Dept "X"(chosen by User, via GUI) in that user's Company
	
 BUGS:
 --seems to be a bug where passing in an empty dept_id string, i.e. '', causes proc to hang.
 runs fine if dept_id arg is 1 or more comma sep. IDs.
 

**************************************************************************************************/

CREATE or REPLACE procedure sp_GetCompanyEvents (IN_company_id        IN  number,
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
  select E.EVENT_ID, E.EVENT_NAME, E.EVENT_DESC, E.EVENT_TYPE, E.event_date as EVT_DT, to_char(E.EVENT_DATE,'DD-MON-YYYY') as EVT_DT_TEXT, E.COMPANY_ID, E.DEPT_ID, D.DEPT_NAME, E.EVENT_PRIVACY, E.START_DATE, E.END_DATE, null
  from  
    event E,
    department D
  where
    1=1
    and E.dept_id = D.dept_id
    and E.company_id = v_IN_company_id   --3000/4001,4002,4003  --null comp_id works(no hang; null dept_id string=hang!
    and         E.event_date BETWEEN v_IN_start_date_range
                                 AND v_IN_end_date_range
    and upper(E.event_privacy) = upper('PUBLIC')
  UNION ALL
  select E.EVENT_ID, E.EVENT_NAME, E.EVENT_DESC, E.EVENT_TYPE, E.event_date as EVT_DT, to_char(E.EVENT_DATE,'DD-MON-YYYY') as EVT_DT_TEXT, E.COMPANY_ID, E.DEPT_ID, D.DEPT_NAME, E.EVENT_PRIVACY, E.START_DATE, E.END_DATE, G.id_list
  from
    event E,
    department D,
    gtt_id_list G
  where
    1=1
    and E.dept_id = D.dept_id
    and E.company_id = v_IN_company_id   --3000
    and         E.event_date BETWEEN v_IN_start_date_range
                                 AND v_IN_end_date_range
    and (E.dept_id = G.id_list and upper(E.event_privacy) = upper('PRIVATE'))
  order by EVT_DT
  ;

  
--OnProcExit, cleanup rows for this session so they do not begin to accumulate in this GTT.
v_sql_cleanup := 'delete from GTT_ID_LIST';   --remove any remaining rows from this GTT user's session
execute immediate v_sql_cleanup;
commit;

END sp_GetCompanyEvents;

/
