create or replace procedure sp_SendNotification (p_recordset OUT SYS_REFCURSOR)
as

v_sql  varchar2(4000) := '';

V_Trans_Error Varchar2(100)         := Null;
V_Trans_Error_Msg Varchar2(200)         := Null;

cursor notification_id_cur
IS
  select notification_id
  from notification
  where enabled='Y'
  order by notification_id;

v_notification_id number;

begin

OPEN notification_id_cur;

LOOP

  fetch notification_id_cur into v_notification_id;
  Exit WHEN notification_id_cur%NOTFOUND;

  -- add email notificaton piece later

  -- now update notification table for sent notifications
  v_sql := 'update notification set last_sent = sysdate where notification_id='||v_notification_id;
  dbms_output.put_line(v_sql);
  execute immediate v_sql;

  v_sql := 'update notification set enabled = ''N'' where notification_id='||v_notification_id;
  dbms_output.put_line(v_sql);
  execute immediate v_sql;

END LOOP;
commit;

CLOSE notification_id_cur;





exception
When Others Then
   Rollback;
   v_trans_error := SQLCODE;
   V_Trans_Error_Msg := Substr (Sqlerrm, 1, 512);
   raise_application_error (-20002,'An error has occurred updating NOTIFICATION table.' || v_trans_error || ','||V_Trans_Error_Msg);--try to raise an error to test this


end sp_SendNotification;
/