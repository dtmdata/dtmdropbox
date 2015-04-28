create or replace Procedure SP_PULSE_COMPANY (IN_company_id        IN  number,
                                              IN_start_date_range  IN  varchar2 DEFAULT NULL,
                                              IN_end_date_range    IN  varchar2 DEFAULT NULL,
                                              p_recordset          OUT SYS_REFCURSOR)
AS

v_IN_company_id     integer := IN_company_id;
v_IN_start_date_range  date := to_date(IN_start_date_range,'DD-MON-YYYY');
v_IN_end_date_range    date := to_date(IN_end_date_range  ,'DD-MON-YYYY');
v_DEFAULT_TIMEFRAME integer := 45;

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

  OPEN p_recordset For
     SELECT
	      A.company_id                           as COMPANY_ID,
	      to_char(A.answer_date, 'DD-MON-YYYY')  as ANS_DT,
	      count(*)                               as COUNT,
	      round(avg(A.answer_rating),2)          as AVG,
	      min(A.answer_rating)                   as MIN,
	      max(A.answer_rating)                   as MAX,
	      round(stddev(A.answer_rating),2) 	     as STDDEV,
	      round(variance(A.answer_rating),2)     as VARIANCE
     FROM
        Answer   A
     WHERE
        A.Company_Id = v_IN_company_id
        AND A.answer_date BETWEEN v_IN_start_date_range
			      AND v_IN_end_date_range
     GROUP BY
        A.company_id, A.answer_date
     ORDER BY A.answer_date   --ANS_DT
  ;

END SP_PULSE_COMPANY;
/
