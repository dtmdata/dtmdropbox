-- must run following to make sure mail package is there
-- @$ORACLE_HOME/rdbms/admin/utlmail.sql
-- @$ORACLE_HOME/rdbms/admin/prvtmail.plb

ALTER session SET smtp_out_server = 'email-smtp.us-west-2.amazonaws.com';
DECLARE
vSender VARCHAR2(30) := 'axe.ebadi@level3.com';
vRecip VARCHAR2(30) := 'abdul.x.ebadi@gmail.com';
vSubj VARCHAR2(50) := 'Test email subject line';
vMesg VARCHAR2(4000) := 'Test email message body';
vMType VARCHAR2(30) := 'text/plain; charset=us-ascii';
BEGIN
utl_mail.send
(vSender, vRecip, NULL, NULL, vSubj, vMesg, vMType, NULL);
END;
/



303.901.1988

mwf
7am-3:30
be there little after 7
3001 W. 124th ave
Broomfield
Norman Smith Municipal svc cnter
left of flag pole
East of Lowell
ask for him or brittany

waver...bring it or they have it
jeans, shoes, gloves, sunglasses, hat, refilable water bottle, lunch, snack money