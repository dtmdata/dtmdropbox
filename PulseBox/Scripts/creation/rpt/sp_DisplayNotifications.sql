create or replace procedure     sp_DisplayNotifications (IN_company_id        IN number,
                                                         IN_dept_id           IN varchar2,
                                                         IN_start_date_range  IN  varchar2,
                                                         IN_end_date_range    IN  varchar2,
                                                         p_recordset          OUT SYS_REFCURSOR)
AS
v_IN_company_id    integer            := IN_company_id;
v_IN_dept_id     varchar2(255)  := IN_dept_id;

v_IN_start_date_range  date := to_date(IN_start_date_range,'DD-MON-YYYY');
v_IN_end_date_range    date := to_date(IN_end_date_range  ,'DD-MON-YYYY');

v_sql_cleanup varchar2(255) := '';

v_sql_error_code  integer        :=  0;
v_sql_error_msg   varchar2(4000) := '';

v_DEFAULT_TIMEFRAME integer := 7;


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
  
sp_parse_id_list(v_IN_dept_id,      'DEPT');  --inserts individual DEPT_ID values into GTT_ID_LIST table.

OPEN p_recordset FOR
  select notification_text,creation_date,last_sent,counter
  from
    notification
    where
    1=1
    and dept_id IN (select distinct(id_list) from gtt_id_list where upper(id_type) = upper('DEPT'))
    and company_id= v_IN_company_id
    AND last_sent BETWEEN v_IN_start_date_range
                            AND v_IN_end_date_range
			    ORDER by creation_date DESC;



v_sql_cleanup := 'delete from GTT_ID_LIST';   --remove ALL remaining rows from this GTT user's session
execute immediate v_sql_cleanup;
commit;

EXCEPTION
when OTHERS then
   dbms_output.put_line('EXCEPTION OTHERS:  SQLCODE: '||SQLCODE  || ':  SQLERRM: '||SQLERRM||'.');
   --rollback;  --is this relevant in this proc?
   v_sql_error_code := SQLCODE;
   v_sql_error_msg  := SQLERRM;
   raise_application_error (-20002,'Exception OTHERS:  ' || v_sql_error_code || ': '||v_sql_error_msg);

END  sp_Displaynotifications;
/