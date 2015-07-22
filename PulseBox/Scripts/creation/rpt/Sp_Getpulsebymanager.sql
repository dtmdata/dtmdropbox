create or replace Procedure     Sp_Getpulsebymanager (In_Company_Id  In Number,
                                    IN_emp_id     In Number,    
                                    p_recordset    OUT SYS_REFCURSOR
                                    )
AS

V_In_Start_Date_Range  Date := Sysdate-5;
V_In_End_Date_Range    Date := sysdate;


v_sql_error_code  integer        :=  0;
v_sql_error_msg   varchar2(4000) := null;

BEGIN

  OPEN p_recordset FOR
     SELECT
        A.ANSWER_ID,
        A.QUESTION_ID,
        A.ANSWER_TEXT,
        to_char(A.answer_date, 'DD-MON-YYYY')  as ANS_DT,    --ANSWER_DATE
        A.EMP_ID,
        A.COMPANY_ID,
        A.ANSWER_RATING,
        A.URGENCY,
        A.IMPACT,
        A.START_DATE,
        A.END_DATE,
        A.DEPT_ID,
        D.dept_name,
        A.LOCATION_ID,
        A.ANSWER_YN
     FROM
        ANSWER  A,
        QUESTION Q,
        QUESTION_TYPE QT,
        DEPARTMENT D
     WHERE
        1=1
        and A.company_id = In_Company_Id   --e.g. 3002
        and A.question_id = Q.question_id
        and Q.type_id = QT.type_id
        And Upper(Qt.Type_Name) = Upper('Free Text')
        AND A.answer_date BETWEEN v_IN_start_date_range
                              AND v_IN_end_date_range
        And A.Dept_Id = D.Dept_Id
        AND A.dept_id IN (4007)   
     ORDER BY A.answer_date DESC 
;


EXCEPTION
when OTHERS then
   dbms_output.put_line('EXCEPTION OTHERS:  SQLCODE: '||SQLCODE  || ':  SQLERRM: '||SQLERRM||'.');
   --rollback;  --is this relevant in this proc?
   v_sql_error_code := SQLCODE;
   v_sql_error_msg  := SQLERRM;
   raise_application_error (-20002,'Exception OTHERS:  ' || v_sql_error_code || ': '||v_sql_error_msg);

End Sp_Getpulsebymanager;
/