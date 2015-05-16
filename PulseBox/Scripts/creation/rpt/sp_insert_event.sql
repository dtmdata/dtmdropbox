create or replace procedure     sp_insert_event (IN_company_id     IN integer,
                          IN_dept_id    IN integer,
                          IN_event_name     IN varchar2,
                          IN_event_desc        IN varchar2,
                          IN_category_id    IN integer,
                          IN_event_date     IN varchar2,
                          IN_event_privacy  IN varchar2,
                                                  p_recordset       OUT SYS_REFCURSOR
                                                  )
as

v_sql  varchar2(4000) := '';
v_tbl  varchar2(30)   := 'EVENT';

-- assign values for ANSWER table cols
v_EVENT_ID         integer          := event_id_seq.nextval;
v_COMPANY_ID    integer          := IN_company_id;
V_DEPT_ID    integer             := IN_dept_id;
V_EVENT_NAME    varchar2(30)         := IN_event_name;
V_EVENT_DESC    varchar2(200)         := IN_event_desc;
V_CATEGORY_ID    integer             := IN_category_id;
V_EVENT_DATE    date             := IN_event_date;
V_EVENT_PRIVACY varchar2(10)         := IN_event_privacy;

v_START_DATE    date     := sysdate;
V_End_Date      Date     := To_Date('12/31/9999','MM/DD/YYYY');
V_Trans_Error Varchar2(100)         := Null;
V_Trans_Error_Msg Varchar2(200)         := Null;



BEGIN
NULL;


v_sql := 'insert into ' || v_tbl || ' values('
|| v_EVENT_ID     ||', '
|| chr(39) || V_EVENT_NAME      || chr(39) || ', '
|| chr(39) || V_EVENT_DESC         || chr(39) || ', '
|| V_Category_Id  ||', '
--|| 'to_date('''    || v_EVENT_DATE || ''',''DD-MON-YY'')'  || ', '
|| chr(39) || v_EVENT_DATE         || chr(39) || ', '
|| V_COMPANY_ID    || ', '
|| V_DEPT_ID       || ', '
|| chr(39) || V_EVENT_PRIVACY || chr(39) || ', '
|| 'to_date('''    || v_START_DATE || ''',''DD-MON-YY'')'   || ', '
|| 'to_date('''    || v_END_DATE   || ''',''DD-MON-YY'')'
|| ')'
;


dbms_output.put_line(v_sql);
execute immediate v_sql;

--what *should* be returned here?  anything at all?  the row just entered?  everything for this companyID/empID, on this date(sysdate) ?
Open P_Recordset For
    Select EVENT_ID,
    EVENT_NAME,
       EVENT_DESC,
           CATEGORY_ID,
        EVENT_DATE,
       COMPANY_ID,
       DEPT_ID,
           EVENT_PRIVACY
    FROM EVENT
    where
    event_id=V_EVENT_ID;
   

exception
When Others Then
   Rollback;
   v_trans_error := SQLCODE;
    V_Trans_Error_Msg := Substr (Sqlerrm, 1, 512);
   raise_application_error (-20002,'An error has occurred inserting an event.' || v_trans_error || ','||V_Trans_Error_Msg);
     --try to raise an error to test this
END  sp_insert_event;