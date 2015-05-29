create or replace procedure     sp_insert_answer(IN_company_id        IN integer,
                                                  IN_emp_id            IN integer,
                                                  IN_question_id       IN integer,
                                                  IN_type_id             IN integer,
                                                  IN_answer            IN varchar2,
                                                  p_recordset       OUT SYS_REFCURSOR
                                                  )
as

v_sql  varchar2(4000) := '';
v_tbl  varchar2(30)   := 'ANSWER';

-- assign values for ANSWER table cols
v_ANSWER_ID     integer  := answer_id_seq.nextval;
v_EMP_ID        integer  := IN_emp_id;
v_COMPANY_ID    integer  := IN_company_id;
v_TYPE_ID    integer     := IN_type_id;
v_QUESTION_ID   integer  := IN_question_id;
v_ANSWER        varchar2(2000) := IN_answer;
v_ANSWER_DATE   date     := sysdate;
v_IMPACT        integer  := 5;  --IN_impact;
v_URGENCY       integer  := 5;  --IN_urgency;
v_START_DATE    date     := sysdate;
v_END_DATE      date     := to_date('12/31/9999','MM/DD/YYYY');v_ANSWER_RATING integer  := 0;

v_DEPT_ID       integer     := 0;
v_LOCATION_ID   integer  := 0;
v_ANSWER_YN varchar2(1)  := '';

V_Trans_Error Varchar2(100)         := Null;
V_Trans_Error_Msg Varchar2(200)         := Null;


BEGIN
NULL;

select dept_id, location_id
into  v_DEPT_ID, v_LOCATION_ID
from employee
where
    company_id  = v_company_id
and emp_id      = v_emp_id
;


-- 12000=YN, 12001=Free Text, 12002=Rating
if v_TYPE_ID = 12000 then
  v_ANSWER_YN := v_ANSWER;
  v_ANSWER := '';
end if;
if v_TYPE_ID = 12001 then
 v_ANSWER := v_ANSWER;
end if;
if v_TYPE_ID = 12002 then
  v_ANSWER_RATING := to_number(v_ANSWER, '99');
  v_ANSWER := '';
end if;



v_sql := 'insert into ' || v_tbl || ' values('
|| v_ANSWER_ID     ||', '
|| v_QUESTION_ID   ||', '
|| chr(39) || v_ANSWER || chr(39) || ', '    --chr(39) is apostrophe
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
/