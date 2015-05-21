create or replace procedure SP_PULSE_LOCATIONS (IN_company_id        IN  number,
                                                IN_location_id       IN  varchar2, --comma-sep LOCATION_ID list sent from the web app
                                                IN_start_date_range  IN  varchar2 DEFAULT NULL,
                                                IN_end_date_range    IN  varchar2 DEFAULT NULL,
                                                p_recordset          OUT SYS_REFCURSOR)
AS

v_IN_company_id    integer       := IN_company_id;
v_IN_location_id   varchar2(255) := IN_location_id;

v_IN_start_date_range  date := to_date(IN_start_date_range,'DD-MON-YYYY');
v_IN_end_date_range    date := to_date(IN_end_date_range  ,'DD-MON-YYYY');
v_DEFAULT_TIMEFRAME integer := 45;

v_sql_cleanup varchar2(255) := '';

--v_rc refcursor;  --how to make this an OUT var, for debug from within sp_pulse_locations() ???

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
|| populate table GTT_ID_LIST with LOCATION_IDs from the app, i.e. v_IN_location_id
*/

--sp_parse_id_list(v_IN_location_id, :v_rc);
sp_parse_id_list(v_IN_location_id, 'LOCATION');  --inserts individual location_id values into GTT_ID_LIST table.

  OPEN p_recordset FOR
     SELECT
          A.company_id                           as COMPANY_ID,
          to_char(A.answer_date, 'DD-MON-YYYY')  as ANS_DT,
          count(*)                               as COUNT,
          round(avg(A.answer_rating),2)          as AVG,
          min(A.answer_rating)                   as MIN,
          max(A.answer_rating)                   as MAX,
          round(stddev(A.answer_rating),2)       as STDDEV,
          round(variance(A.answer_rating),2)     as VARIANCE
     FROM
        ANSWER  A,
        GTT_ID_LIST  D    --location_id list should be populated in this table at this moment in time, i.e. during lifetime of this sp_pulse_locations().
     WHERE
        1=1
		and A.company_id = v_IN_company_id   --e.g. 3005
        AND A.answer_date BETWEEN v_IN_start_date_range
                              AND v_IN_end_date_range
        AND A.location_id IN(select id_list 
	                        from gtt_id_list 
							where upper(id_type) = upper('LOCATION')
							)
     GROUP BY
        A.company_id, A.answer_date
     ORDER BY A.answer_date   --ANS_DT
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
   
END SP_PULSE_LOCATIONS;
/