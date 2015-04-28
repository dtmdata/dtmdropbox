/********************************************************************************************************************************* 
use this st.proc to test syntax, etc
**********************************************************************************************************************************/


create or replace procedure sp_footest  (IN_company_id        IN  number,
                                              IN_start_date_range  IN  varchar2,
                                              IN_end_date_range    IN  varchar2,
                                              p_recordset          OUT SYS_REFCURSOR
											  )
AS
v_IN_start_date_range date := to_date(IN_start_date_range,'DD-MON-YYYY'); 
v_IN_end_date_range   date := to_date(IN_end_date_range,'DD-MON-YYYY'); 

BEGIN
if (v_IN_end_date_range IS NULL or v_IN_start_date_range='') 
then 
   v_IN_start_date_range := sysdate - 45;
end if; 


if (v_IN_end_date_range IS NULL or v_IN_end_date_range='')
then 
   v_IN_start_date_range := sysdate;
end if;

END sp_footest;

/
