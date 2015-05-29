create or replace procedure SP_PULSE_Q_CATEGORY (IN_company_id            IN  number,
                                                IN_dept_id                IN  varchar2, --comma-sep QUESTION_CATEGORY_ID list sent from the web app
                                                IN_question_id            IN  number,   --ONLY pass single Q_id here, not string of them, at this time
                                                IN_question_category_id   IN  varchar2, --comma-sep QUESTION_CATEGORY_ID list sent from the web app
                                                IN_start_date_range       IN  varchar2 DEFAULT NULL,
                                                IN_end_date_range         IN  varchar2 DEFAULT NULL,
                                                p_recordset               OUT SYS_REFCURSOR)
AS
v_IN_company_id            number       := IN_company_id;
v_IN_dept_id               varchar2(255) := IN_dept_id;
v_IN_question_id           number       := IN_question_id;
v_IN_question_category_id  varchar2(255) := IN_question_category_id;

v_IN_start_date_range  date := to_date(IN_start_date_range,'DD-MON-YYYY');
v_IN_end_date_range    date := to_date(IN_end_date_range  ,'DD-MON-YYYY');
v_DEFAULT_TIMEFRAME  number := 45;

v_sql_cleanup varchar2(255) := '';

CRLF varchar2(2)                 := chr(10)||chr(13);
v_sql_error_code  number         :=  0;
v_sql_error_msg   varchar2(4000) := '';

--v_rc refcursor;  --how to make this an OUT var, for debug from within sp_pulse_depts() ???

BEGIN
--assign default time window if either START or END dates are not passed in.
if (v_IN_start_date_range IS NULL or v_IN_start_date_range='')
then
   v_IN_start_date_range := sysdate - v_DEFAULT_TIMEFRAME;
end if;

if (v_IN_end_date_range IS NULL or v_IN_end_date_range='')
then
   v_IN_end_date_range := sysdate;
end if;

dbms_output.put_line('start <=> end used is: ' || v_IN_start_date_range || ' <=> ' || v_IN_end_date_range);

/*
|| populate table GTT_ID_LIST with DEPT_IDs *AND* QUESTION_CATEGORY_IDs from the app, i.e. v_IN_dept_id,  v_IN_question_category_id
*/
sp_parse_id_list(v_IN_dept_id, 'DEPT');                            --inserts individual <dept_id >              values into GTT_ID_LIST table.
sp_parse_id_list(v_IN_question_category_id, 'QUESTION_CATEGORY');  --inserts individual <question_category_id>  values into GTT_ID_LIST table.


IF v_IN_question_id <> 0 THEN
OPEN p_recordset FOR
  select
     QC.category_name                       as CATEGORY,
  	 A.company_id                           as COMPANY_ID,
  	 to_char(A.answer_date, 'DD-MON-YYYY')  as ANS_DT,
  	 count(*)                               as COUNT,
	 round(avg(A.answer_rating),2)          as AVG,
	 min(A.answer_rating)                   as MIN,
	 max(A.answer_rating)                   as MAX,
	 round(stddev(A.answer_rating),2) 	    as STDDEV,
	 round(variance(A.answer_rating),2)     as VARIANCE
  from
     answer A,
     question Q,
     (select category_id, company_id, category_name
      from question_category
      where  category_id IN(select distinct(id_list) from gtt_id_list where upper(id_type) = upper('QUESTION_CATEGORY'))
	     and company_id = v_IN_company_id
     ) QC
  where
     1=1
     and A.dept_id IN(SELECT distinct(id_list)
	                  FROM gtt_id_list
					  WHERE upper(id_type) = upper('DEPT')
					  )
     and A.company_id  = v_IN_company_id
     and A.question_id = Q.question_id
     and Q.question_id = v_IN_question_id
	 and Q.category_id = QC.category_id
     and A.answer_date BETWEEN v_IN_start_date_range
                           and v_IN_end_date_range
  group by QC.category_name, A.company_id, A.answer_date
  order by QC.category_name, A.company_id, A.answer_date
  ;
ELSE    -- v_IN_question_id = 0 (only "WHERE Q.question_id = v_IN_question_id" is removed here)
OPEN p_recordset FOR
  select
     QC.category_name                       as CATEGORY,
  	 A.company_id                           as COMPANY_ID,
  	 to_char(A.answer_date, 'DD-MON-YYYY')  as ANS_DT,
  	 count(*)                               as COUNT,
	 round(avg(A.answer_rating),2)          as AVG,
	 min(A.answer_rating)                   as MIN,
	 max(A.answer_rating)                   as MAX,
	 round(stddev(A.answer_rating),2) 	    as STDDEV,
	 round(variance(A.answer_rating),2)     as VARIANCE
  from
     answer A,
     question Q,
     (select category_id, company_id, category_name
      from question_category
      where  category_id IN(select distinct(id_list) from gtt_id_list where upper(id_type) = upper('QUESTION_CATEGORY'))
	     and company_id = v_IN_company_id
     ) QC
  where
     1=1
     and A.dept_id IN(SELECT distinct(id_list)
	                  FROM gtt_id_list
					  WHERE upper(id_type) = upper('DEPT')
					  )
     and A.company_id  = v_IN_company_id
     and A.question_id = Q.question_id
     and Q.category_id = QC.category_id
     and A.answer_date BETWEEN v_IN_start_date_range
                           and v_IN_end_date_range
  group by QC.category_name, A.company_id, A.answer_date
  order by QC.category_name, A.company_id, A.answer_date
  ;
END IF;


--OnProcExit, cleanup rows for this session so they do not begin to accumulate in this GTT.
v_sql_cleanup := 'delete from GTT_ID_LIST';   --remove any remaining rows from this GTT user's session
execute immediate v_sql_cleanup;
commit;

EXCEPTION
when OTHERS then
   dbms_output.put_line('EXCEPTION OTHERS:  SQLCODE: '||SQLCODE  || ':  SQLERRM: '||SQLERRM||'.');
   --rollback;  --is this relevant in this proc?
   v_sql_error_code := SQLCODE;
   v_sql_error_msg  := SQLERRM;
   raise_application_error (-20002,'Exception OTHERS:  ' || CRLF || v_sql_error_code || ': '||v_sql_error_msg);

END SP_PULSE_Q_CATEGORY;
/

