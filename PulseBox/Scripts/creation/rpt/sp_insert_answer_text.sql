create or replace procedure     sp_insert_answer_text(IN_company_id     IN integer,
                                                  IN_emp_id         IN integer,
                                                  IN_answer_rating  IN integer,   --1-10 rating from user web page
                                                  IN_answer_text    IN varchar2,  --e.g. answer_text
                                                  p_recordset       OUT SYS_REFCURSOR
                                                  )
as

v_sql  varchar2(4000) := '';
v_tbl  varchar2(30)   := 'ANSWER';

-- assign values for ANSWER table cols
v_ANSWER_ID     integer  := answer_id_seq.nextval;
v_QUESTION_ID   integer  := 13;   --hardcoded for now; fix QUESTION sequence start# ??; want this to be the ID always represented by the "question" entry for FREE TEXT; re-use same ID for all Companies
v_ANSWER_TEXT   varchar2(2000) := IN_answer_text;   --'sfvklhsgv'fffds''dff'''rwgrgrsgag5'
v_ANSWER_DATE   date     := sysdate;
v_EMP_ID        integer  := IN_emp_id;
v_COMPANY_ID    integer  := IN_company_id;
v_ANSWER_RATING integer  := IN_answer_rating;
v_IMPACT        integer  := 5;  --IN_impact;
v_URGENCY       integer  := 5;  --IN_urgency;
v_START_DATE    date     := sysdate;
v_END_DATE      date     := to_date('12/31/9999','MM/DD/YYYY');
v_DEPT_ID       integer  := 0;
v_LOCATION_ID   integer  := 0;
v_ANSWER_YN varchar2(1)  := 'N';
v_ACK_BY        integer;
v_ACK_DATE      date;
V_Trans_Error Varchar2(100)         := Null;
V_Trans_Error_Msg Varchar2(200)     := Null;


BEGIN
NULL;

select dept_id, location_id
into  v_dept_id, v_location_id
from employee
where
    company_id  = v_company_id
and emp_id      = v_emp_id
;


--temp-hardcoded to question_id=13.
--Need to lookup the "FREE TEXT" question table entry to determine the actual question_id.
select question_id into v_question_id
from question
where
lower(question_text) like lower('FREE TEXT QUESTION')
and company_id=v_company_id  --each company can have their own Question list, so need this to filter to the correct one for each company.
;



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
|| chr(39) || v_ANSWER_YN || chr(39) ||', '
|| v_ACK_BY     ||', '
|| v_ACK_DATE
|| ')'
;


dbms_output.put_line(v_sql);
execute immediate v_sql;
commit;

--Q: what *should* be returned here? A: the row just entered.
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
           ANSWER_YN,
           ACK_BY,
           ACK_DATE
    from ANSWER
    where
       1=1
       and company_id = v_company_id
       and emp_id = v_emp_id
       and answer_date = to_date(v_answer_date)
       and answer_id = v_ANSWER_ID
    ;


exception
When Others Then
   Rollback;
   v_trans_error := SQLCODE;
   V_Trans_Error_Msg := Substr (Sqlerrm, 1, 512);
   raise_application_error (-20002,'An error has occurred inserting an answer.' || v_trans_error || ','||V_Trans_Error_Msg);  --try to raise an error to test this
END  sp_insert_answer_text;
/