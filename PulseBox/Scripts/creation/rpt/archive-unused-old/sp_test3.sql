/* 
Parse comma-sep string of values, and insert them to a specified GTT.
Should only be called from within another of our pbox st.procs.
IDs(number) or other strings(varchar2)
*/

create or replace procedure sp_test3  (IN_dept_id_list  IN varchar2)

AS
v_id_list varchar2(255) := '6029,6034,6035,6058' ;
--v_id_list varchar2(255) := '6029' ; --test neither leading/trailing comma

--v_id_list varchar2(255) := '6029,,6034' ;  --test double comma
--v_id_list varchar2(255) := '6029,' ;  --trailing comma test
--v_id_list varchar2(255) := ',6029' ;  --leading comma test
--v_id_list varchar2(255) := ',6029,' ; --test both lead/trailing

v_tmp_id varchar2(255) := '';
v_length_id_list integer := 0;
v_start integer := 1;       --position in string to start at
v_next_comma integer := 0;  --position of next comma in the list
v_sql_cleanup varchar2(255) := '';

BEGIN
v_length_id_list := length(v_id_list);
dbms_output.put_line('input ID list: '||v_id_list);

v_sql_cleanup := 'delete from gtt_id_list';  --first remove any pre-existing rows from this GTT session
execute immediate v_sql_cleanup;

LOOP
  v_next_comma := instr(v_id_list, ',');
  if v_next_comma <= 1 then
    if length(v_id_list) < 1 then
      exit;  --nothing left
    else 
      select substr(v_id_list, 1) into v_tmp_id from dual;  --use entire remaining string, position 1 to the end
      insert into gtt_id_list values(v_tmp_id);
      commit;
      DBMS_OUTPUT.PUT_line(v_tmp_id);
      DBMS_OUTPUT.PUT_line('>>All IDs processed<<');
      exit; -- this should have been last ID, with no trailing comma
    end if;
  end if;
  select substr(v_id_list, 1, v_next_comma - 1 ) into v_tmp_id from dual;
  DBMS_OUTPUT.PUT_line(v_tmp_id);
  insert into gtt_id_list values(v_tmp_id);
  
  v_id_list := substr(v_id_list, v_next_comma + 1);  --ID list should be 1 ID shorter with each iteration
  DBMS_OUTPUT.PUT_line('  '||v_id_list);

END LOOP;
commit;

EXCEPTION
when OTHERS then 
    DBMS_OUTPUT.PUT_line('OTHERS error: ' || SQLERRM);

END sp_test3
;
/
