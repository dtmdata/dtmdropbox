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

NOTIFICATION_ID,
COMPANY_ID,
N.DEPT_ID,
D.DEPT_NAME,
NOTIFICATION_NAME,
NOTIFICATION_TEXT,
EMAIL_ADDR,
ENABLED,
CREATION_DATE,
LAST_SENT,
COUNTER,
DELAY,
FREQUENCY,
MIN_THRESHOLD,
MAX_THRESHOLD,
START_DATE,
END_DATE,
EMP_ID
	     
     FROM
        Notification n,
        Department d
     WHERE
	N.DEPT_ID = D.DEPT_ID 
        AND N.Company_Id = v_IN_company_id
        AND Enabled = 'Y'
   
     GROUP BY
        A.company_id, A.answer_date
     ORDER BY A.answer_date   --ANS_DT
  ;

END SP_M_Get_Notifications;
/