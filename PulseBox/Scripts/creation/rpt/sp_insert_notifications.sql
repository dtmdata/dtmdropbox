create or replace procedure sp_insert_notifications (p_recordset   OUT SYS_REFCURSOR
                                                    )
as

v_cur_timestamp  date := systimestamp;  --use this var so consistent comparisons can be made when testing etc.
v_num_days_ago  integer := 100;           -- 2 day avg used here for calculation/triggering; dbms_jobs will be running this every hour.

-- if avg Dept pulse < min, or >max, then insert those into NOTIFICATION table.
v_MIN_avg_thresh integer := 2;
v_MAX_avg_thresh integer := 8;

v_sql  varchar2(4000) := '';
v_tbl  varchar2(30)   := 'NOTIFICATION';

--for EXCEPTION clause:
CRLF varchar2(2)                 := chr(10)||chr(13);
v_sql_error_code  integer        :=  0;
v_sql_error_msg   varchar2(4000) := '';

/*
--Below is "good enough" for Demo.
--Use 1 cursor for each *type* of report to check, e.g. pulse_Company, or pulse_Participation.
--DD/20150529: This will return rows for each person who is a *Manager* in a given Dept, even if they are not top-level in that Dept.
--DD/20150603: Changed cursor names such that each report type has it's own name.  Corresponding INSERT text also changed to match.
*/

/*
|| #1 pulse = Company
*/
cursor c_pCompany is
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
  and A.answer_date BETWEEN (sysdate - v_num_days_ago) AND sysdate
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

c_pCompany_rec   c_pCompany%ROWTYPE;   --get the entire row into _rec variable


/*
|| #2 pulse = Participation
|| This one doesn't depend on Manager=Y or not.....just looks at all Participation based on Company+Dept level.
*/

/*
cursor c_pParticipation is
select
  DENOM.company_id  as COMPANY_ID,
  DENOM.company_name,
  DENOM.dept_id,
  DENOM.dept_name,
  NUM.num_uniq_emps,
  DENOM.tot_emp_count,
  round((NUM.num_uniq_emps/DENOM.tot_emp_count)*100, 1) as PCT_PARTICIPATE,
  to_char(NUM.answer_date, 'DD-MON-YY') ANSWER_DATE
from
   (select count(*) as num_uniq_emps, company_id, dept_id, ANSWER_DATE
    from (
		select
			count(*) AS num_emp_answers,
			round(avg(A.ANSWER_RATING), 2)  "AVG_ANSWER_RATING",
			trunc(answer_date) as ANSWER_DATE,
			company_id,
			dept_id,
			emp_id
		from
			answer A
		where
			1=1  --DO NOT filter out individual <20%, >80% ratings here in inner SELECT, since they need to be included for the 2-day average.
			and trunc(A.answer_date) between (sysdate-v_num_days_ago) AND (sysdate-0)   --use:  v_num_days_ago and 0
			--and trunc(A.answer_date) between sysdate-500 AND sysdate-0   --use:  v_num_days_ago and 0
		group by
			trunc(answer_date),
			company_id,
			dept_id,
			emp_id
		order by ANSWER_DATE
		)
	where
	   1=1
	   --and ("AVG_ANSWER_RATING" > 8  OR  "AVG_ANSWER_RATING" < 2 )
    group by
		company_id, dept_id, ANSWER_DATE
	order by answer_date
   ) NUM,
   (select count(*) AS tot_emp_count, C.company_id, C.company_name, D.dept_id, D.dept_name   --calculate this on a (COMPANY + DEPT) level.
	from
	    company    C
	   ,employee   E
	   ,department D
	where
		1=1
		and C.company_id = D.company_id
		and D.dept_id    = E.dept_id
		--and c.company_id=3002 and d.dept_id=4007
		and trunc(e.end_date) >= trunc(sysdate)  --only count employees' answers if they are still employed, i.e. end_date=12/31/9999, or > "now"=sysdate.??
	group by
	    C.company_id, C.company_name, D.dept_id, D.dept_name
	order by C.company_id, D.dept_id
   ) DENOM
WHERE
   1=1
   and NUM.company_id = DENOM.company_id
   and NUM.dept_id    = DENOM.dept_id
   --and ( (round((NUM.num_uniq_emps/DENOM.tot_emp_count), 1) > (8/10))  OR  (round((NUM.num_uniq_emps/DENOM.tot_emp_count), 1) < (2/10)) )
   and ((round((NUM.num_uniq_emps/DENOM.tot_emp_count), 1) > (v_MAX_avg_thresh/10)) OR (round((NUM.num_uniq_emps/DENOM.tot_emp_count), 1) < (v_MIN_avg_thresh/10)))
ORDER BY
   DENOM.company_id, DENOM.dept_id, NUM.answer_date
;

c_pParticipation_rec   c_pParticipation%ROWTYPE;   --get the entire row into _rec variable

*/


BEGIN
   null;

   /*
   || #1 pulse = Company
   */
   OPEN c_pCompany;
   LOOP
     fetch c_pCompany into c_pCompany_rec;
     exit WHEN c_pCompany%NOTFOUND;
     

-- Assign values using ANSWER table cols from SQL results
-- Build SQL for each row, loop/insert/endloop/commit.
-- chr(39) is apostrophe.
     v_sql := 'INSERT INTO ' || v_tbl || ' VALUES('
     || NOTIFICATION_ID_seq.nextval   ||', '
     || c_pCompany_rec.COMPANY_ID    ||', '
     || c_pCompany_rec.DEPT_ID    ||', '
     || chr(39) || 'Company:  Average pulse for Company/Dept is outside defined Min/Max range' || chr(39) ||', '    --NOTIFICATION_NAME
                || chr(39) || 'You have received this notification due to the latest '                              --NOTIFICATION_TEXT
                || v_num_days_ago || '-day average pulse for company '
                || chr(39) || chr(39) || c_pCompany_rec.COMPANY_NAME || chr(39) || chr(39) || ' department '
                || chr(39) || chr(39) || c_pCompany_rec.DEPT_NAME    || chr(39) || chr(39) || ' being out-of-bounds (> 8 or < 2).' || chr(39) ||', '
     || chr(39) || c_pCompany_rec.EMAIL_ADDR || chr(39) ||', '         --EMAIL_ADDR
     || chr(39) || 'Y' || chr(39) ||', '                               --ENABLED
     || chr(39) ||v_cur_timestamp  || chr(39)  ||', '                  --creation_date (v_cur_timestamp)
     || chr(39) || v_cur_timestamp || chr(39)  ||', '                  --last_sent_date (v_cur_timestamp)
     || 0    ||', '                                                    --counter
     || 60   ||', '                                                    --delay
     || 60   ||', '                                                    --frequency
     || v_MIN_avg_thresh ||', '                                        --MIN_THRESHOLD
     || v_MAX_avg_thresh ||', '                                        --MAX_THRESHOLD
     || chr(39) || v_cur_timestamp || chr(39) ||', '                   --START_DATE
     || chr(39) || to_date('31-dec-9999','DD-MON-YYYY') || chr(39) || ', '    --END_DATE
     || c_pCompany_rec.EMP_ID 
     || ')'
     ;

     dbms_output.put_line('Company: '||CRLF||'   '|| v_sql);
     execute immediate v_sql;
   END LOOP;
   commit;
   CLOSE c_pCompany;


/*
|| #2 pulse = Participation
*/
/*
   OPEN c_pParticipation;
   LOOP
     fetch c_pParticipation into c_pParticipation_rec;
     exit WHEN c_pParticipation%NOTFOUND;

-- Assign values using ANSWER table cols from SQL results
-- Build SQL for each row, loop/insert/endloop/commit.
-- chr(39) is apostrophe.

     v_sql := 'INSERT INTO ' || v_tbl || ' VALUES('
     || NOTIFICATION_ID_seq.nextval   || ', '
     || c_pParticipation.COMPANY_ID   || ', '
     || c_pParticipation.DEPT_ID      || ', '
     || chr(39) || 'Participation Percent:  Average pulse for Company/Dept is outside defined Min/Max range' || chr(39) ||', '    --NOTIFICATION_NAME
                || chr(39) || 'You have received this notification due to the latest '                                            --NOTIFICATION_TEXT
                || v_num_days_ago || '-day average participation for company '
                || chr(39) || chr(39) || c_pParticipation.COMPANY_NAME || chr(39) || chr(39) || ' department '
                || chr(39) || chr(39) || c_pParticipation.DEPT_NAME    || chr(39) || chr(39) || ' being out-of-bounds (> 80 or < 20).' || chr(39) || ', '
 --    || chr(39) || c_pParticipation.EMAIL_ADDR || chr(39) ||', '       --EMAIL_ADDR
     || chr(39) || 'Y' || chr(39) ||', '                               --ENABLED
     || chr(39) || v_cur_timestamp  || chr(39)  || ', '                 --creation_date  (v_cur_timestamp)
     || chr(39) || v_cur_timestamp  || chr(39)  || ', '                 --last_sent_date (v_cur_timestamp)
     || 0    || ', '                                                    --counter
     || 60   || ', '                                                    --delay
     || 60   || ', '                                                    --frequency
     || v_MIN_avg_thresh || ', '                                        --MIN_THRESHOLD
     || v_MAX_avg_thresh || ', '                                        --MAX_THRESHOLD
     || chr(39) || v_cur_timestamp || chr(39) || ', '                   --START_DATE
     || chr(39) || to_date('31-dec-9999','DD-MON-YYYY') || chr(39)     --END_DATE
     || ')'
     ;


     dbms_output.put_line('Participation: '||CRLF||'   '|| v_sql);
     execute immediate v_sql;

   END LOOP;
   commit;
   CLOSE c_pParticipation;

*/

--Q: what *should* be returned here?
--A: the rows just entered.
-- only need this for :rc if app needs to see data which was INSERTED
-- If can re-use c_pCompany here, do so.  THEN, do the CLOSE c_pCompany after end of SQL/p_recordset.

OPEN p_recordset FOR
	select * from NOTIFICATION;



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