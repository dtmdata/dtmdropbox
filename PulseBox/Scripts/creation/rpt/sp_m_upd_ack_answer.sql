create or replace procedure sp_m_upd_ack_answer (IN_emp_id integer,
						IN_answer_id integer,
						p_recordset   OUT SYS_REFCURSOR
                                                )
as

v_sql  varchar2(4000) := '';
v_tbl  varchar2(30)   := 'ANSWER';

v_emp_id    integer := IN_emp_id;
v_answer_id integer := IN_answer_id;


--for EXCEPTION clause:
CRLF varchar2(2)                 := chr(10)||chr(13);
v_sql_error_code  integer        :=  0;
v_sql_error_msg   varchar2(4000) := '';



BEGIN
   null;

-- Assign values using ANSWER table cols from SQL results
-- Build SQL for each row, loop/insert/endloop/commit.
-- chr(39) is apostrophe.
     v_sql := 'update ' || v_tbl || ' SET ack_by='||v_emp_id||', ack_date=sysdate where answer_id='||v_answer_id ;


     dbms_output.put_line('update stmt: '||CRLF||'   '|| v_sql);
     execute immediate v_sql;
     commit;


OPEN p_recordset FOR
	select * from ANSWER where answer_id = v_answer_id;  --show same row as just updated



EXCEPTION
when OTHERS then
   dbms_output.put_line('EXCEPTION OTHERS:  SQLCODE: '||SQLCODE  || ':  SQLERRM: '||SQLERRM||'.');
   --rollback;  --is this relevant in this proc?
   v_sql_error_code := SQLCODE;
   v_sql_error_msg  := SQLERRM;
   raise_application_error (-20002,'Exception OTHERS:  ' || v_sql_error_code || ': '||v_sql_error_msg);

END  sp_m_upd_ack_answer;

/