create or replace procedure     sp_insert_answer(IN_company_id        IN integer,
                                                  IN_emp_id            IN integer,
                                                  IN_question_id       IN integer,
                                                  IN_answer_text       IN integer,
                                                  IN_question_type_id  IN integer,
                                                  IN_answer_rating     IN integer,
                                                  IN_dept_id           IN integer,
                                                  IN_location_id       IN integer,
                                                  IN_answer_yn         varchar2,                                                   
                                                  p_recordset       OUT SYS_REFCURSOR
                                                  )
as

v_sql  varchar2(4000) := '';
v_tbl  varchar2(30)   := 'ANSWER';

-- assign values for ANSWER table cols
v_ANSWER_ID     integer  := answer_id_seq.nextval;
v_QUESTION_ID   integer  := IN_question_id;   
v_ANSWER_TEXT   varchar2(2000) := IN_answer_text;
v_ANSWER_DATE   date     := sysdate;
v_EMP_ID        integer  := IN_emp_id;
v_COMPANY_ID    integer  := IN_company_id;
v_ANSWER_RATING integer  := IN_answer_rating;
v_IMPACT        integer  := 5;  --IN_impact;
v_URGENCY       integer  := 5;  --IN_urgency;
v_START_DATE    date     := sysdate;
v_END_DATE      date     := to_date('12/31/9999','MM/DD/YYYY');
v_DEPT_ID       integer  := IN_dept_id;
v_LOCATION_ID   integer  := IN_location_id;
v_ANSWER_YN varchar2(1)  := IN_answer_yn;
V_Trans_Error Varchar2(100)         := Null;
V_Trans_Error_Msg Varchar2(200)         := Null;


BEGIN
NULL;

v_sql := 'insert into ' || v_tbl || ' values('
|| v_ANSWER_ID     ||', '
|| v_QUESTION_ID   ||', '
|| chr(39) || v_ANSWER_TEXT || chr(39) || ', '    --chr(39) is apostrophe
|| 'to_date('''    || v_ANSWER_DATE || ''',''DD-MON-YY'')'  || ', '    --insert into ddtest values(to_date('31-dec-99','DD-MON-YY'));
|| v_EMP_ID        || ', '
|| v_COMPANY_ID    || ', '
|| v_ANSWER_RATING || ', '
|| v_URGENCY       || ', '
|| v_IMPACT        || ', '
|| 'to_date('''    || v_START_DATE || ''',''DD-MON-YY'')'   || ', '
|| 'to_date('''    || v_END_DATE   || ''',''DD-MON-YY'')'   || ', '
|| v_DEPT_ID       || ', '
|| v_LOCATION_ID   || ', '
|| chr(39) || v_ANSWER_YN || chr(39)
|| ')'
;


dbms_output.put_line(v_sql);
execute immediate v_sql;
--commit; --not needed

--what *should* be returned here?  anything at all?  the row just entered?  everything for this companyID/empID, on this date(sysdate) ?
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
     answer_id=V_ANSWER_ID;
   


exception
When Others Then
   Rollback;
   v_trans_error := SQLCODE;
   V_Trans_Error_Msg := Substr (Sqlerrm, 1, 512);
   raise_application_error (-20002,'An error has occurred inserting an answer.' || v_trans_error || ','||V_Trans_Error_Msg);--try to raise an error to test this
END  sp_insert_answer;