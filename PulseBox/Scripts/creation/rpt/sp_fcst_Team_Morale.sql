create or replace procedure sp_fcst_Team_Morale (IN_company_id    IN number,
											    IN_num_days_ago   IN number DEFAULT 45,
												IN_window_size    IN number DEFAULT 7,
												IN_target_pulse   IN number,
                                                p_recordset       OUT SYS_REFCURSOR
                                                )
AS

v_IN_company_id  integer       := IN_company_id;

v_IN_num_days_ago   number := IN_num_days_ago;
v_IN_window_size    number := IN_window_size;
v_IN_target_pulse   number := IN_target_pulse;

v_sql_cleanup varchar2(255) := '';

--for EXCEPTION clause:
CRLF varchar2(2)                 := chr(10)||chr(13);
v_sql_error_code  integer        :=  0;
v_sql_error_msg   varchar2(4000) := '';

BEGIN

OPEN p_recordset FOR
select
   v_IN_num_days_ago "NUM_DAYS_AGO",
   AVG_0_DAYS_AGO,
   AVG_N_DAYS_AGO,
   v_IN_target_pulse  TARGET_PULSE,
   round((AVG_0_DAYS_AGO - AVG_N_DAYS_AGO)/(v_IN_num_days_ago), 2)  "SLOPE_N_DAY_AVG",
   round((1 / ((AVG_0_DAYS_AGO - AVG_N_DAYS_AGO)/(v_IN_num_days_ago))), 2)  "DAYS_PER_PULSE_POINT" ,
   round((v_IN_target_pulse - AVG_0_DAYS_AGO)/((AVG_0_DAYS_AGO - AVG_N_DAYS_AGO)/(v_IN_num_days_ago)), 2)   "DAYS_TO_REACH_TARGET",
   A.*, B.*
from
   ( --v_IN_window_size=7 day avg pulse from N=v_IN_num_days_ago days ago:
    SELECT
	      A.company_id                           as COMPANY_ID,
	      count(*)                               as COUNT_N_DAYS_AGO,
	      round(avg(A.answer_rating),2)          as AVG_N_DAYS_AGO,
	      round(min(A.answer_rating), 2)         as MIN_N_DAYS_AGO,
	      round(max(A.answer_rating), 2)         as MAX_N_DAYS_AGO,
	      round(stddev(A.answer_rating),2) 	     as STDDEV_N_DAYS_AGO,
	      round(variance(A.answer_rating),2)     as VARIANCE_N_DAYS_AGO
    FROM
        Answer   A
    WHERE
        A.Company_Id = v_IN_company_id
		AND trunc(A.answer_date) BETWEEN trunc(sysdate - (v_IN_num_days_ago + v_IN_window_size)) and trunc(sysdate - v_IN_num_days_ago)
    GROUP BY
        A.company_id
	) A,
   ( --v_IN_window_size=7 day avg pulse from N=0 days ago:
    SELECT
	      A.company_id                           as COMPANY_ID,
	      count(*)                               as COUNT_0_DAYS_AGO,
	      round(avg(A.answer_rating),2)          as AVG_0_DAYS_AGO,
	      round(min(A.answer_rating), 2)         as MIN_0_DAYS_AGO,
	      round(max(A.answer_rating), 2)         as MAX_0_DAYS_AGO,
	      round(stddev(A.answer_rating),2) 	     as STDDEV_0_DAYS_AGO,
	      round(variance(A.answer_rating),2)     as VARIANCE_0_DAYS_AGO
    FROM
        Answer   A
    WHERE
        A.Company_Id = v_IN_company_id
        AND trunc(A.answer_date) BETWEEN trunc(sysdate - (0 + v_IN_window_size)) and trunc(sysdate - (0))  --hardcoded 0's on purpose
    GROUP BY
        A.company_id
	) B
where A.company_id = B.company_id
;


EXCEPTION
when OTHERS then
   dbms_output.put_line('EXCEPTION OTHERS:  SQLCODE: '||SQLCODE  || ':  SQLERRM: '||SQLERRM||'.');
   --rollback;  --is this relevant in this proc?
   v_sql_error_code := SQLCODE;
   v_sql_error_msg  := SQLERRM;
   raise_application_error (-20002,'Exception OTHERS:  ' || v_sql_error_code || ': '||v_sql_error_msg);

END sp_fcst_Team_Morale;

/*
DD:
20150528.  Initial proc creation, sp_fcst_Team_Morale().

Description:
Show forecast for when a Company's overall pulse will reach a User-specified Target value (1..10). e.g. pulse =4 now; when will my pulse reach "8" ?
This initial attempt to forecast is a straight-line extrapolation based on 'N days average' of recent Company Pulse.
'N' is chosen by User; N(default) = 45days.  Uses y = mx + b to forecast.
If no rows returned, then slope of N days is either 0(flat), or <0 (downward), (and a message will be returned...??)

*/
/