create or replace procedure sp_insert_notifications (p_recordset   OUT SYS_REFCURSOR
                                                    )
as

v_cur_timestamp  date := systimestamp;  --use this var so consistent comparisons can be made when testing etc.
v_num_days_ago  integer := 2;   -- 2 day avg used here for calculation/triggering; dbms_jobs will be running this every hour.

-- if avg Dept pulse < min, or >max, then insert those into NOTIFICATION table.
v_MIN_avg_thresh integer := 2;
v_MAX_avg_thresh integer := 8;

v_sql  varchar2(4000) := '';
v_tbl  varchar2(30)   := 'NOTIFICATION';

--for EXCEPTION clause:
CRLF varchar2(2)                 := chr(10)||chr(13);
v_sql_error_code  integer        :=  0;
v_sql_error_msg   varchar2(4000) := '';

--"good enough" for Demo.
--DD/20150529: This will return rows for each person who is a Manager in a given Dept, even if they are not top-level in that Dept.
cursor c_notif is
SELECT *
FROM (
select
   A.company_id,
   C.company_name,
   A.dept_id,
   D.dept_name,
   E.emp_id,
   E.manager_yn,
   E.email_addr,
   round(avg(A.ANSWER_RATING), 2)  "AVG_ANSWER_RATING"
from
   ANSWER  A,
   COMPANY C,
   DEPARTMENT D,
   EMPLOYEE E
where
  1=1
  and A.company_id = C.company_id
  and A.dept_id    = D.dept_id
  and D.company_id = E.company_id
  and D.dept_id    = E.dept_id
  and E.manager_yn = 'Y'
  and A.answer_date BETWEEN (sysdate - 2) AND sysdate
group by
   A.company_id,
   C.company_name,
   A.dept_id,
   D.dept_name,
   E.emp_id,
   E.manager_yn,
   E.email_addr
)
WHERE
   1=1
   and ((AVG_ANSWER_RATING < v_MIN_avg_thresh)  OR  (AVG_ANSWER_RATING > v_MAX_avg_thresh ))
ORDER BY
   company_id,
   dept_id,
   email_addr
;

c_notif_rec   c_notif%ROWTYPE;   --get the entire row into rec variable

BEGIN
   NULL;

OPEN c_notif;
LOOP
  fetch c_notif into c_notif_rec;
  exit WHEN c_notif%NOTFOUND;


-- Assign values using ANSWER table cols from SQL results
-- Build SQL for each row, loop/insert/endloop/commit.
-- chr(39) is apostrophe.
v_sql := 'INSERT INTO ' || v_tbl || ' VALUES('
|| NOTIFICATION_ID_seq.nextval   ||', '
|| c_notif_rec.COMPANY_ID    ||', '
|| c_notif_rec.DEPT_ID    ||', '
|| chr(39) || 'Average pulse for Company/Dept is outside defined Min/Max range' || chr(39) ||', '    --NOTIFICATION_NAME
           || chr(39) || 'You have received this notification due to the latest '                    --NOTIFICATION_TEXT
		   || v_num_days_ago || '-day average pulse for company '
           || chr(39) || chr(39) || c_notif_rec.COMPANY_NAME || chr(39) || chr(39) || ' department '
           || chr(39) || chr(39) || c_notif_rec.DEPT_NAME    || chr(39) || chr(39) || ' being out-of-bounds (> 8 or < 2).' || chr(39) ||', '
|| chr(39) || c_notif_rec.EMAIL_ADDR || chr(39) ||', '            --EMAIL_ADDR
|| chr(39) || 'Y' || chr(39) ||', '                               --ENABLED
|| chr(39) ||v_cur_timestamp  || chr(39)  ||', '                                        --creation_date (v_cur_timestamp)
|| chr(39) || v_cur_timestamp || chr(39)  ||', '                                        --last_sent_date (v_cur_timestamp)
|| 0    ||', '                                                    --counter
|| 60   ||', '                                                    --delay
|| 60   ||', '                                                    --frequency
|| v_MIN_avg_thresh ||', '                                        --MIN_THRESHOLD
|| v_MAX_avg_thresh ||', '                                        --MAX_THRESHOLD
|| chr(39) || v_cur_timestamp || chr(39) ||', '                                      --START_DATE
|| chr(39) || to_date('31-dec-9999','DD-MON-YYYY') || chr(39)                       --END_DATE
|| ')'
;


dbms_output.put_line(v_sql);
execute immediate v_sql;


END LOOP;
commit;
CLOSE c_notif;



--Q: what *should* be returned here? A: the rows just entered.
-- only need this for :rc if app needs to see data which was INSERTED
-- If can re-use c_notif here, do so.  THEN, do the CLOSE c_notif after end of SQL/p_recordset.
/*
OPEN p_recordset FOR
    select ANSWER_ID,
           QUESTION_ID,
           ANSWER_TEXT,
           ANSWER_DATE,
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
    from ANSWER
	where
	   1=1
	   and company_id = v_company_id
       and emp_id = v_emp_id
	   and answer_date = to_date(v_answer_date)
	   and answer_id = v_ANSWER_ID
	;

*/

EXCEPTION
when OTHERS then
   dbms_output.put_line('EXCEPTION OTHERS:  SQLCODE: '||SQLCODE  || ':  SQLERRM: '||SQLERRM||'.');
   --rollback;  --is this relevant in this proc?
   v_sql_error_code := SQLCODE;
   v_sql_error_msg  := SQLERRM;
   raise_application_error (-20002,'Exception OTHERS:  ' || v_sql_error_code || ': '||v_sql_error_msg);

END  sp_insert_notifications;


/*
DD: 20150528.  Initial proc creation, sp_insert_notification().

Description:
Find ANSWERS for any/all COMPANYs whose average pulse over the previous 2day(i.e the immediate 48hours prior to dbms_jobs proc call)
has crossed below/above a predetermined threshold.
i.e.
v_MIN_avg_thresh integer := 2;
v_MAX_avg_thresh integer := 8;

*/
/