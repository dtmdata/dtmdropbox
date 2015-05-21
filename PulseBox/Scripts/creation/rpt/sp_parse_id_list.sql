/*
D.Durland  20150203.
PURPOSE: Parse out IDs from a comma-separated list.
Assume input string provided is perfect:
--no extra leading/embedded/trailing commas 
--extra whitespace should be OK, <spaces> at least have been tested.
--IDs are purely numerical, to match with our tables' PK values
--IDs are Inserted into GTT_ID_LIST table, in app schema. e.g. "DTM"
*/
create or replace procedure sp_parse_id_list (IN_id_list      IN  varchar2,
                                              IN_id_type    IN varchar2
                                              -- ,p_recordset         OUT SYS_REFCURSOR
                                              ) 

AS 
v_id_list varchar2(255) := '';   --test string:  '4020, 4030, 4040, 4051'
v_id_type varchar2(255) := '';

v_tmp_id integer := 0;  
v_length_id_list integer := 0;
v_start_pos integer := 1;
v_delim_pos integer := 0;
v_delim varchar2(1) := ',';  --comma is delimiter
v_foo integer := 0;

CRLF varchar2(2)                 := chr(10)||chr(13);
v_sql_error_code  integer        :=  0;
v_sql_error_msg   varchar2(4000) := '';

BEGIN
v_id_list  := IN_id_list;
v_id_type  := IN_id_type;

--If no IDs passed in then EXIT with error to calling proc 
if length(v_id_list) >= 1 then
  dbms_output.put_line('---> start LOOP <---');
  LOOP
    v_length_id_list := length(v_id_list);
    dbms_output.put_line('NEW v_id_list: >>' || v_id_list || '<<' );
    dbms_output.put_line('  Length: ' || v_length_id_list);

    v_delim_pos := instr(v_id_list, v_delim);  --when no more commas, this should be *0*, not >=1.
    dbms_output.put_line('  delim is at position: ' || v_delim_pos);
    if v_delim_pos < 1 then  
       v_tmp_id := to_number(trim(v_id_list));  --then no commas left and final remaining value should be Inserted.
       dbms_output.put_line('  last ID is: >>' || v_tmp_id || '<<');
       insert into GTT_ID_LIST values(v_tmp_id, v_id_type); 
       commit;
       exit;
    end if;

    v_tmp_id := to_number(trim(substr(v_id_list, v_start_pos, v_delim_pos-1)));  
    insert into GTT_ID_LIST values(v_tmp_id, v_id_type);
    dbms_output.put_line('  next ID is: >>' || v_tmp_id || '<<');

    --chop off ID just inserted, and create new list, then LOOP
    v_id_list := trim(substr(v_id_list, v_delim_pos+1));
    dbms_output.put_line('- - - - - -');

  END LOOP;
  commit;
  dbms_output.put_line('==> outside LOOP now <==');
else
  --TO-DO: raise error and exit gracefully since no IDs passed in
  v_foo:=0;
  insert into GTT_ID_LIST values(0,  v_id_type);   -- 0 means "no IDs" were passed in; will this code path ever execute??????
  commit;
end if;

/*
--for debug, show recs inserted, from SQL> :
open p_recordset for 
   select id_list from gtt_id_list
;
*/

EXCEPTION
when OTHERS then
   dbms_output.put_line('EXCEPTION OTHERS:  SQLCODE: '||SQLCODE  || ':  SQLERRM: '||SQLERRM||'.');
   --rollback;  --is this relevant in this proc?
   v_sql_error_code := SQLCODE;
   v_sql_error_msg  := SQLERRM;
   raise_application_error (-20002,'Exception OTHERS:  ' || CRLF || v_sql_error_code || ': '||v_sql_error_msg); 
   
END sp_parse_id_list;
/