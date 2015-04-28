CREATE OR REPLACE package body ADMIN_UTILS.kill_process
as
procedure kill_proc (in_sid_id in varchar)
is
/*
   This procedure checks to make sure the db session belonging to the
   process supplied belongs to the user who invoked the kill and then
   kills the session.
*/

v_sid   number;
v_serial_no   number;
v_invoking_user varchar2(200);
v_username varchar2(200);
kill_str varchar2(200);
v_param varchar2(20);
v_temp   number;
v_status varchar2(8);
begin
-- Get user who invoked
select user into v_invoking_user from dual;
dbms_output.put_line('The requesting user is: '||v_invoking_user);

-- Check if process is valid
-- where process = to_char(in_sid_id);
Begin
   select  username, sid, serial# 
   into v_username, v_sid, v_serial_no 
   from v$session
   where sid = in_sid_id;
exception when no_data_found
then
dbms_output.put_line('No such process : '||in_sid_id);
return;
end;

-- Check if the process belongs to the invoking user
begin
   if v_invoking_user != v_username then  
    dbms_output.put_line('This process is not owned by you. Cannot Kill!');
   else
      -- Kill the session
      --dbms_output.put_line('The session id is: '||v_sid);
      --dbms_output.put_line('The serial number is: '||v_serial_no);
      v_param := ''''||v_sid||','||v_serial_no||'''';
      kill_str:= 'Alter system kill session '||v_param;
      dbms_output.put_line('Kill syntax: '||kill_str);
      begin
         execute immediate kill_str;
        -- v_cur_id := dbms_sql.open_cursor;
    -- dbms_sql.parse(v_cur_id, kill_str, 1);
    -- dbms_sql.close_cursor(v_cur_id);
         -- LOG ACTION TAKEN
         insert into log_utils(action, action_date, username, action_text)
         values ('Kill Session',sysdate,v_username,kill_str);
         commit;
      exception when others then
         dbms_output.put_line('Error in kill statement '||sqlerrm);
      end;
   end if;
   
end;

begin
select status into v_status from v$session
where sid=in_sid_id;
if upper(v_status) = 'KILLED' then
 dbms_output.put_line('Session marked for Kill.');
else
 dbms_output.put_line('Session could not be killed.');
end if;
exception when no_data_found then
 dbms_output.put_line('Session Killed.');
end;
end kill_proc;


Procedure get_user_sessions
is
/*
This procedure is invoked by the kill.sql script to display all
the DB sessions owned by the user who invokes the kill.
*/

cursor c1 is
select rpad(username,15) myuser, rpad(sid,15) oraproc, rpad(process,15) unixproc, rpad(osuser,15) osusr, rpad(substr(program,1,30),33) prog,
rpad(status,8) stat
from v$session
where username = (select user from dual);
begin
dbms_output.put_line(chr(13));
dbms_output.put_line('List of your current sessions: ');
dbms_output.put_line(chr(13));
dbms_output.new_line;
--dbms_output.put_line('Username Oracle_Process Unix_Process OS_User_Name   Program_Name                                    Status  ');
dbms_output.put_line(rpad('Username',15)||rpad('Oracle_Process',15)||rpad('Unix_Process',15)||rpad('OS_User_Name',15)||rpad('Program_Name',33)||rpad('Status',8));
dbms_output.put_line(rpad('------------',15)||rpad('----------',15)||rpad('----------',15)||rpad('----------',15)||rpad('----------',33)||rpad('------',8));
For c1_rec in c1 loop
 dbms_output.put_line(c1_rec.myuser||c1_rec.oraproc||c1_rec.unixproc||c1_rec.osusr||c1_rec.prog||c1_rec.stat);
end loop;
dbms_output.put_line(chr(13));
end get_user_sessions;
end kill_process;

/
