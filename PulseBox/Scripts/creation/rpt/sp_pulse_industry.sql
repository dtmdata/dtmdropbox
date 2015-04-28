create or replace procedure SP_PULSE_INDUSTRY (IN_company_id        IN  varchar2,
                                               IN_industry_id       IN  varchar2, --comma-sep INDUSTRY_ID list sent from the web app
                                               IN_start_date_range  IN  varchar2 DEFAULT NULL,
                                               IN_end_date_range    IN  varchar2 DEFAULT NULL,
                                               p_recordset          OUT SYS_REFCURSOR)
AS

v_IN_company_id     integer := IN_company_id;         --3000
v_IN_industry_id    varchar2(255) := IN_industry_id;  --3000/1000,1001

v_IN_start_date_range  date := to_date(IN_start_date_range,'DD-MON-YYYY');
v_IN_end_date_range    date := to_date(IN_end_date_range  ,'DD-MON-YYYY');
v_DEFAULT_TIMEFRAME integer := 45;

v_sql_cleanup varchar2(255) := '';
v_id_count integer := 0;

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
|| Ensure GTT_ID_LIST is cleaned up, then populate table GTT_ID_LIST with INDUSTRY_IDs from the app,
|| i.e. v_IN_industry_id
||
*/
--OnProcEntry, cleanup any rows for this session, "just in case".
v_sql_cleanup := 'delete from GTT_ID_LIST';   --remove any remaining rows from this GTT user's session
execute immediate v_sql_cleanup;
commit;

sp_parse_id_list(v_IN_industry_id);  --inserts individual industry_id values into GTT_ID_LIST table.
select count(*) into v_id_count from gtt_id_list;

if v_id_count < 1 then  --not enough IDs passed in.  sp_parse_id_list() doesn't handle this yet...
  dbms_output.put_line('v_id_count: '||v_id_count||' Exiting...');
--error out/hangs in sp_parse_id_list() i think.
elsif v_id_count = 1  then   --single ID passed in
  OPEN p_recordset FOR
     SELECT
       I.industry_id                          as INDUSTRY_ID,
	   I.industry_name                        as INDUSTRY_NAME,
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
	   MM_INDUSTRY_COMPANY MM,
       INDUSTRY I,
	   GTT_ID_LIST  D    --industry_id list should be populated in this table at this moment in time, i.e. during lifetime of this sp_pulse_depts().
     WHERE
       1=1
	   --and A.company_id = v_IN_company_id   --e.g. 3000
       and A.company_id = MM.company_id
	   and MM.industry_id = I.industry_id
       AND I.industry_id = D.id_list
       AND A.answer_date BETWEEN v_IN_start_date_range
                             AND v_IN_end_date_range
     GROUP BY
       I.industry_id, I.industry_name, A.company_id, A.answer_date
	 ORDER BY A.answer_date;   --ANS_DT
else  --more than 1 ID passed in
  OPEN p_recordset FOR
     SELECT
       'MULTIPLE INDUSTRIES'                  as MESSAGE,
	   v_id_count                             as NUM_IDs,
	   A.company_id                           as COMPANY_ID,  --not really needed; this is just a marker to display the company_id.
       to_char(A.answer_date, 'DD-MON-YYYY')  as ANS_DT,
       count(*)                               as COUNT,
       round(avg(A.answer_rating),2)          as AVG,
       min(A.answer_rating)                   as MIN,
       max(A.answer_rating)                   as MAX,
       round(stddev(A.answer_rating),2)       as STDDEV,
       round(variance(A.answer_rating),2)     as VARIANCE
     FROM
       ANSWER  A,
	   MM_INDUSTRY_COMPANY MM,
       INDUSTRY I,
	   GTT_ID_LIST  D    --industry_id list should be populated in this table at this moment in time, i.e. during lifetime of this sp_pulse_depts().
     WHERE
       1=1
	   --and A.company_id = v_IN_company_id   --e.g. 3000
       and A.company_id = MM.company_id
	   and MM.industry_id = I.industry_id
       AND I.industry_id = D.id_list
       AND A.answer_date BETWEEN v_IN_start_date_range
                             AND v_IN_end_date_range
/*
       AND A.answer_date BETWEEN to_date('01-jan-2000', 'DD-MON-YYYY')
                             AND to_date('31-dec-2015', 'DD-MON-YYYY')
*/
     GROUP BY
       I.industry_id, I.industry_name, A.company_id, A.answer_date
	 ORDER BY A.answer_date   --ANS_DT
     ;
end if;



--OnProcExit, cleanup rows for this session so they do not begin to accumulate in this GTT.
v_sql_cleanup := 'delete from GTT_ID_LIST';   --remove any remaining rows from this GTT user's session
execute immediate v_sql_cleanup;
commit;

EXCEPTION
when OTHERS then
   dbms_output.put_line('SQLERRM: '||SQLERRM||'.  SQLCODE: '||SQLCODE);
END SP_PULSE_INDUSTRY;
/