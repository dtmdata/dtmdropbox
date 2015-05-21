create or replace procedure     sp_insert_question (IN_company_id     IN integer,
                          IN_dept_id        IN integer,
                          IN_question_text  IN varchar2,
                          IN_category_id    IN integer,
                          IN_min_rating     IN integer,
                          IN_max_rating     IN integer,
                          IN_weight_factor  IN integer,
                          IN_type_id        IN integer,
                          IN_source_id      IN integer,
                          IN_start_date     IN varchar2 default null,
                          IN_end_date       IN varchar2 default null,
                          p_recordset       OUT SYS_REFCURSOR
                                                  )
as

v_sql  varchar2(4000) := '';
v_tbl  varchar2(30)   := 'QUESTION';

-- assign values for ANSWER table cols
v_QUESTION_ID   integer          := question_id_seq.nextval;
v_COMPANY_ID    integer          := IN_company_id;
V_DEPT_ID    integer             := IN_dept_id;
V_QUESTION_TEXT varchar2(200)        := IN_question_text;
V_CATEGORY_ID    integer            := IN_category_id;
V_MIN_RATING    integer            := IN_min_rating;
V_MAX_RATING    integer            := IN_max_rating;
V_WEIGHT_FACTOR    integer            := IN_weight_factor;
V_TYPE_ID    integer            := IN_type_id;
V_SOURCE_ID    integer            := IN_source_id;

v_START_DATE    date     := to_date(IN_start_date,'DD-MON-YYYY');
v_END_DATE      date     := to_date(IN_end_date,'DD-MON-YYYY');
V_Trans_Error Varchar2(100)         := Null;
V_Trans_Error_Msg Varchar2(200)     := Null;



BEGIN



v_sql := 'insert into ' || v_tbl || ' values('
|| v_QUESTION_ID     ||', '
|| V_COMPANY_ID    || ', '
|| V_DEPT_ID       || ', '
|| chr(39) || V_QUESTION_TEXT      || chr(39) || ', '
|| V_CATEGORY_ID  ||', '
|| V_TYPE_ID  ||', '
|| V_SOURCE_ID  ||', '
|| V_MIN_RATING  ||', '
|| V_MAX_RATING  ||', '
|| V_WEIGHT_FACTOR  ||', '
|| 'to_date('''    || v_START_DATE || ''',''DD-MON-YY'')'   || ', '
|| 'to_date('''    || v_END_DATE   || ''',''DD-MON-YY'')'
|| ')'
;


dbms_output.put_line(v_sql);
execute immediate v_sql;

--what *should* be returned here?  anything at all?  the row just entered?  everything for this companyID/empID, on this date(sysdate) ?
OPEN p_recordset FOR
    select QUESTION_ID, 
       QUESTION_TEXT,
       COMPANY_ID,
       DEPT_ID
    FROM QUESTION
    where
     question_id = V_QUESTION_ID
    ;


exception
When Others Then
   Rollback;
   v_trans_error := SQLCODE;
   V_Trans_Error_Msg := Substr (Sqlerrm, 1, 512);
   raise_application_error (-20002,'An error has occurred inserting an question.' || v_trans_error || ','||V_Trans_Error_Msg);--try to raise an error to test this
END  sp_insert_question;