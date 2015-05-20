create or replace procedure sp_GetPulseComments (IN_company_id  IN number,  
                                                 IN_dept_id     IN number,    --single DeptID for DEMO; can extend this out to a CSV list later; pretty easy.
												 IN_rating_csv  IN varchar2,  --list of numbers, 1-10 inclusive, that User wishes to see corresponding response text for.
												 IN_start_date_range  IN  varchar2 DEFAULT NULL,
                                                 IN_end_date_range    IN  varchar2 DEFAULT NULL,
                                                 p_recordset    OUT SYS_REFCURSOR
                                                    )
AS

v_IN_company_id  integer       := IN_company_id;
v_IN_dept_id     varchar2(255) := IN_dept_id;
v_IN_rating_csv  varchar2(255) := IN_rating_csv;

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

dbms_output.put_line('Start <=> End date range is: ' || v_IN_start_date_range || ' <=> ' || v_IN_end_date_range);

/*
|| populate table GTT_ID_LIST with DEPT_IDs from the app, i.e. v_IN_dept_id
*/

sp_parse_id_list(v_IN_rating_csv);  --inserts individual rating values into GTT_ID_LIST table.

  OPEN p_recordset FOR
     SELECT
		ANSWER_ID,
		QUESTION_ID,
		ANSWER_TEXT,
		to_char(A.answer_date, 'DD-MON-YYYY')  as ANS_DT,    --ANSWER_DATE
		EMP_ID,
		COMPANY_ID,
		ANSWER_RATING,
		URGENCY,
		IMPACT,
		START_DATE,
		END_DATE,
		DEPT_ID,
		LOCATION_ID,
		ANSWER_YN
     FROM
        ANSWER  A
     WHERE
        1=1
		and A.company_id = v_IN_company_id   --e.g. 3005
        AND A.answer_date BETWEEN v_IN_start_date_range
                              AND v_IN_end_date_range
        AND A.dept_id = v_IN_dept_id
		AND A.answer_rating IN(select ID_LIST from GTT_ID_LIST  /*extend proic using this:  WHERE upper(ID_TYPE)=upper('rating') */ )
     ORDER BY A.answer_rating ASC  --show "worst" text entries first
;


--OnProcExit, cleanup rows for this session so they do not begin to accumulate in this GTT.
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
   
END sp_GetPulseComments;
/

/*
DD:  20150519.
Description:
Return to the application all Free Text/Pulse Comments having the rating values chosen by User.
Use CSV for rating list. e.g. "1,2,3", or "1,2,5,7,9", or "1,2,3,4,5,6,7,8,9,10" for all.

*/