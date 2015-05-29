create or replace procedure     sp_DisplayNotifications (IN_company_id        IN number,
                                                         IN_dept_id           IN number,
                                                         IN_start_date_range  IN  varchar2,
                                                         IN_end_date_range    IN  varchar2,
                                                         p_recordset          OUT SYS_REFCURSOR)
AS
v_IN_company_id    integer            := IN_company_id;
v_IN_dept_id       integer            := IN_dept_id;

v_IN_start_date_range  date := to_date(IN_start_date_range,'DD-MON-YYYY');
v_IN_end_date_range    date := to_date(IN_end_date_range  ,'DD-MON-YYYY');

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


OPEN p_recordset FOR
  select notification_text,creation_date,last_sent,counter
  from
    notification
    where
    1=1
    and dept_id = v_IN_dept_id
    and company_id= v_IN_company_id;
    


exception
When Others Then
  null;
  Rollback;
   
END  sp_Displaynotifications;
/