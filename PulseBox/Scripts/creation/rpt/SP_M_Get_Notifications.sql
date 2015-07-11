create or replace Procedure SP_M_Get_Notifications (IN_company_id        IN  number,
                     				    IN_emp_id		 IN  number,
                                              	    p_recordset          OUT SYS_REFCURSOR)
AS

v_IN_company_id     integer := IN_company_id;
v_IN_emp_id     integer := IN_emp_id;

v_DEFAULT_TIMEFRAME integer := 45;

BEGIN

  OPEN p_recordset For
     SELECT

N.NOTIFICATION_ID,
N.COMPANY_ID,
N.DEPT_ID,
D.DEPT_NAME,
N.NOTIFICATION_NAME,
N.NOTIFICATION_TEXT,
N.EMAIL_ADDR,
N.ENABLED,
N.CREATION_DATE,
N.LAST_SENT,
N.COUNTER,
N.DELAY,
N.FREQUENCY,
N.MIN_THRESHOLD,
N.MAX_THRESHOLD,
N.START_DATE,
N.END_DATE,
N.EMP_ID

     FROM
        Notification n,
        Department d
     WHERE
	N.DEPT_ID = D.DEPT_ID
  AND N.EMP_ID =v_IN_emp_id
        AND N.Company_Id = v_IN_company_id
        And Enabled = 'Y'
     ORDER BY N.creation_date  desc 
  ;

END SP_M_Get_Notifications;
/