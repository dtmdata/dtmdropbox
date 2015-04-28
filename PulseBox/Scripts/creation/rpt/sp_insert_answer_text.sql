create or replace procedure sp_insert_answer_text(IN_user_id        IN varchar2,  --need to pass in employee.user_id to determine other ID values.
                                           IN_answer_text    IN varchar2,  --e.g. answer_text
                                           IN_answer_rating  IN integer,   --1-10 rating from user web page
										   IN_urgency        IN integer,   --1-10 rating from user web page
										   IN_impact         IN integer,   --1-10 rating from user web page
                                           p_recordset       OUT SYS_REFCURSOR
                                           )
as
v_user_id       varchar2(8)    := IN_user_id;  --dd='34JRT54X'/company_id=3002
v_tbl           varchar2(50)   := 'ANSWER';  --hardcode to 'ANSWER' table to start with
v_sql           varchar2(4000) := '';

/* assign values for ANSWER table cols */
v_ANSWER_ID     integer := answer_id_seq.nextval;
v_QUESTION_ID   integer  := 0;
v_ANSWER_TEXT   varchar2(200) := IN_answer_text;   --'sfvklhsgv'fffds''dff'''rwgrgrsgag5'
v_ANSWER_DATE   date := sysdate;
v_EMP_ID        integer  := 0;
v_COMPANY_ID    integer  := 0;
v_ANSWER_RATING integer       := IN_answer_rating;
v_IMPACT        integer       := IN_impact;
v_URGENCY       integer       := IN_urgency;
v_START_DATE    date := sysdate;
v_END_DATE      date := to_date('12/31/9999','MM/DD/YYYY');
v_DEPT_ID       integer  := 0;
v_LOCATION_ID   integer  := 0;


begin
NULL;

select emp_id, company_id, dept_id, location_id 
into  v_emp_id, v_company_id, v_dept_id, v_location_id 
from employee 
where user_id = v_user_id 
;

select question_id into v_question_id
from question 
where 
lower(question_text) like lower('%WHAT FREE TEXT WOULD YOU LIKE TO ENTER%')
and company_id=v_company_id  --each company can have their own Question list
;



v_sql := 'insert into ' || v_tbl || ' values(' 
|| v_ANSWER_ID     ||', '
|| v_QUESTION_ID   ||', '
|| chr(39) || v_ANSWER_TEXT || chr(39) || ', '
|| 'to_date(''' || v_ANSWER_DATE || ''',''DD-MON-YY'')'  || ', '    --insert into ddtest values(to_date('31-dec-99','DD-MON-YY'));
|| v_EMP_ID        || ', '
|| v_COMPANY_ID    || ', '
|| v_ANSWER_RATING || ', '
|| v_URGENCY       || ', '
|| v_IMPACT        || ', '
|| 'to_date(''' || v_START_DATE || ''',''DD-MON-YY'')'   || ', '
|| 'to_date(''' || v_END_DATE   || ''',''DD-MON-YY'')'   || ', '
|| v_DEPT_ID       || ', '
|| v_LOCATION_ID   
|| ')'
;


dbms_output.put_line(v_sql);
execute immediate v_sql;
--commit; --not needed

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
           LOCATION_ID
    from answer;
    
    
exception
when others then
   null;
   rollback;  --try to raise an error to test this
end  sp_insert_answer_text;

/
/*
Generic proc to insert values to a table.
*/

/*
set serveroutput on
create table answer_ddtest AS select answer_id, answer_text from answer where 1=2;
*/
