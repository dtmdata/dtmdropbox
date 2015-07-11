create or replace PROCEDURE     sp_M_Get_MY_SUB_Pulse_Comments (IN_company_id  IN number,
 						 IN_emp_id	IN number,
--                                                 IN_dept_id     IN varchar2,    --list of DeptIDs
--                                                IN_rating_csv  IN varchar2,  --list of numbers, 1-10 inclusive, that User wishes to see corresponding response text for.
--						IN_word_list IN varchar2,  --csv list of keywords to filter by!!
--						IN_location IN varchar2,  --list of location_IDs
--						IN_level IN varchar2,  --list of org levels, relative to emp_id viewing the data
--                                                 IN_start_date_range  IN  varchar2 DEFAULT NULL,
--                                                IN_end_date_range    IN  varchar2 DEFAULT NULL,
                                                 p_recordset    OUT SYS_REFCURSOR
                                                    )
AS

v_IN_company_id  integer       := IN_company_id;
v_IN_emp_id  integer       := IN_emp_id;
/*
v_IN_dept_id     varchar2(255) := IN_dept_id;
v_IN_rating_csv  varchar2(255) := IN_rating_csv;
*/

/*
v_IN_start_date_range  date := to_date(IN_start_date_range,'DD-MON-YYYY');
v_IN_end_date_range    date := to_date(IN_end_date_range  ,'DD-MON-YYYY');
*/

v_DEFAULT_TIMEFRAME integer := 45;

v_sql_cleanup varchar2(255) := '';

CRLF varchar2(2)                 := chr(10)||chr(13);
v_sql_error_code  integer        :=  0;
v_sql_error_msg   varchar2(4000) := '';

BEGIN
/*
--assign default time window if either START or END dates are not passed in.
if (v_IN_start_date_range IS NULL or v_IN_start_date_range='')
then
   v_IN_start_date_range := sysdate - v_DEFAULT_TIMEFRAME;
end if;

if (v_IN_end_date_range IS NULL or v_IN_end_date_range='')
then
   v_IN_end_date_range := sysdate;
end if;

dbms_output.put_line('Start <=> End date range is: ' || v_IN_start_date_range || ' <=> ' || v_IN_end_date_range);
*/


/*
|| populate table GTT_ID_LIST with RATINGs from the app, i.e. v_IN_rating_csv
*/

/*
sp_parse_id_list(v_IN_dept_id,      'DEPT');  --inserts individual DEPT_ID values into GTT_ID_LIST table.
sp_parse_id_list(v_IN_rating_csv, 'RATING');  --inserts individual RATING  values into GTT_ID_LIST table.
*/

--this is just the pulse texts from the OTHER emps, i.e. <> passed-in emp_id:
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
        A.ANSWER_YN,
        A.ACK_BY,
        A.ACK_DATE
     FROM
        ANSWER  A,
        QUESTION Q,
        QUESTION_TYPE QT,
        DEPARTMENT D
    WHERE
        1=1
        and A.company_id = v_IN_company_id   --e.g. 3002
        and A.emp_id in (select emp_id from(
											SELECT
											   E.emp_id
											FROM
											   employee E,
											   department D
											WHERE
											   1=1
											   and E.dept_id = D.dept_id
											   and E.company_id = v_IN_company_id  --3005 --exec sp_GetEmpsSubordToEmpID(3005, 6029, :rc)
											CONNECT BY PRIOR E.emp_id = E.manager_id     --testing emp_id: 6034(mid),6043(mid), or 6029(top) or 6059(leaf)
											START WITH
											   E.manager_id = v_IN_emp_id  --emp_id of the person running this report.
											)
						)
        and A.dept_id = D.dept_id
        and A.question_id = Q.question_id
        and Q.type_id = QT.type_id
        and upper(QT.type_name) in (upper('Free Text'), upper('Rating'))
/*
AND A.answer_date BETWEEN v_IN_start_date_range
                              AND v_IN_end_date_range
AND A.dept_id = D.dept_id
        AND A.dept_id       IN(select distinct(id_list) from gtt_id_list where upper(id_type) = upper('DEPT'))   --v_IN_dept_id : use this instead if only want single DEPT_ID passed in for p.box DEMO
        AND A.answer_rating IN(select distinct(ID_LIST) from GTT_ID_LIST WHERE upper(ID_TYPE) = upper('RATING'))
*/
ORDER BY A.answer_date desc
;


--OnProcExit, cleanup rows for this session so they do not begin to accumulate in this GTT.
v_sql_cleanup := 'delete from GTT_ID_LIST';   --remove ALL remaining rows from this GTT user's session
execute immediate v_sql_cleanup;
commit;

EXCEPTION
when OTHERS then
   dbms_output.put_line('EXCEPTION OTHERS:  SQLCODE: '||SQLCODE  || ':  SQLERRM: '||SQLERRM||'.');
   --rollback;  --is this relevant in this proc?
   v_sql_error_code := SQLCODE;
   v_sql_error_msg  := SQLERRM;
   raise_application_error (-20002,'Exception OTHERS:  ' || v_sql_error_code || ': '||v_sql_error_msg);

END sp_M_Get_MY_SUB_Pulse_Comments;
/