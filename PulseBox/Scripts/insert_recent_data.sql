-- simple .sql script to insert recent data.  all you do is change variable below to your liking then run this from sqlplus
-- A. Ebadi 4/2015
--
declare 

-- set these for emp, dept, company, question, location u want answer for
v_company_id number	 	:= 3005;
v_dept_id number 		:= 4010;
v_loc_id number 		:= 2005;
v_employee_id number 		:= 6029;
v_question_id number 		:= 9128;
v_answer_text varchar2(200)	:= 'What can I say?';
v_relative_date number		:= 3;

-- set this to total # rows you want inserted
v_rows_to_insert number 	:= 25;

-- don't touch these counters
v_counter number 		:= 0;
v_temp_counter number 		:= 1;

begin

while v_counter < v_rows_to_insert 
loop
  if v_temp_counter = 11 then
    v_temp_counter := 1;
  end if;

  if v_temp_counter = 1 then
    insert into answer values (answer_id_seq.nextval, v_question_id, v_answer_text, sysdate-v_relative_date*1, v_employee_id, v_company_id, 7, 4, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), v_dept_id, v_loc_id, 'N');
  elsif v_temp_counter = 2 then
    insert into answer values (answer_id_seq.nextval, v_question_id, v_answer_text, sysdate-v_relative_date*2, v_employee_id, v_company_id, 8, 2, 1, sysdate, to_date('12-31-9999','MM-DD-YYYY'), v_dept_id, v_loc_id, 'N');
  elsif v_temp_counter = 3 then
    insert into answer values (answer_id_seq.nextval, v_question_id, v_answer_text, sysdate-v_relative_date*3, v_employee_id, v_company_id, 2, 2, 2, sysdate, to_date('12-31-9999','MM-DD-YYYY'), v_dept_id, v_loc_id, 'N');
  elsif v_temp_counter = 4 then
    insert into answer values (answer_id_seq.nextval, v_question_id, v_answer_text, sysdate-v_relative_date*4, v_employee_id, v_company_id, 7, 4, 6, sysdate, to_date('12-31-9999','MM-DD-YYYY'), v_dept_id, v_loc_id, 'N');
  elsif v_temp_counter = 5 then
    insert into answer values (answer_id_seq.nextval, v_question_id, v_answer_text, sysdate-v_relative_date*1, v_employee_id, v_company_id, 9, 2, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), v_dept_id, v_loc_id, 'N');
  elsif v_temp_counter = 6 then
    insert into answer values (answer_id_seq.nextval, v_question_id, v_answer_text, sysdate-v_relative_date*2, v_employee_id, v_company_id, 1, 2, 3, sysdate, to_date('12-31-9999','MM-DD-YYYY'), v_dept_id, v_loc_id, 'N');
  elsif v_temp_counter = 7 then
    insert into answer values (answer_id_seq.nextval, v_question_id, v_answer_text, sysdate-v_relative_date*3, v_employee_id, v_company_id, 5, 5, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), v_dept_id, v_loc_id, 'N');
  elsif v_temp_counter = 8 then
    insert into answer values (answer_id_seq.nextval, v_question_id, v_answer_text, sysdate-v_relative_date*4, v_employee_id, v_company_id, 9, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'), v_dept_id, v_loc_id, 'N');
  elsif v_temp_counter = 9 then
    insert into answer values (answer_id_seq.nextval, v_question_id, v_answer_text, sysdate-v_relative_date*1, v_employee_id, v_company_id, 3, 3, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'), v_dept_id, v_loc_id, 'N');
  elsif v_temp_counter = 10 then
    insert into answer values (answer_id_seq.nextval, v_question_id, v_answer_text, sysdate-v_relative_date*2, v_employee_id, v_company_id, 2, 2, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'), v_dept_id, v_loc_id, 'N');
  end if;
  v_temp_counter := v_temp_counter + 1;
  v_counter := v_counter + 1;	

end loop;

end;
/