create or replace procedure sp_GetNewEvents (IN_company_id  IN number,  
                                             IN_days_ago    IN number Default 2,
                                             p_recordset    OUT SYS_REFCURSOR)
AS
v_company_id    varchar2(8)    := IN_company_id;  --company_id=3002
v_days_ago      number         := IN_days_ago;

v_sql_error_code number         := 0;
v_sql_error_msg  varchar2(4000) := '';

BEGIN
NULL;

OPEN p_recordset FOR
	select 
		EVENT_ID,
		EVENT_NAME,
		EVENT_DESC,
		CATEGORY_ID,
		EVENT_DATE,
		COMPANY_ID,
		DEPT_ID,
		EVENT_PRIVACY,
		START_DATE,
		END_DATE
	from 
		EVENT
	where 
		1=1
		and COMPANY_ID=v_company_id
		and trunc(event_date) >= trunc(sysdate) - v_days_ago
	order by
		event_date DESC
;
    
    
EXCEPTION
when OTHERS then
   dbms_output.put_line('EXCEPTION OTHERS:  SQLCODE: '||SQLCODE  || ':  SQLERRM: '||SQLERRM||'.');
   --rollback;  --is this relevant in this proc?
   v_sql_error_code := SQLCODE;
   v_sql_error_msg  := SQLERRM;
   raise_application_error (-20002,'Exception OTHERS:  ' || v_sql_error_code || ': '||v_sql_error_msg); 
   
END sp_GetNewEvents;

/

/*
DD:  20150505.
Description:
Get a distinct list of Question Categories and return those to the app

*/