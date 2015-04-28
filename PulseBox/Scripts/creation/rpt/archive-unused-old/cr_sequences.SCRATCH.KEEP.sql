/*
bunch of crap all in 1 file.
obviously still chaos.
*/

--CREATE SEQUENCE emp_id_seq MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 10;
drop sequence  emp_id_seq;
create sequence emp_id_seq MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 100; 

drop trigger trg_emp_id;
create trigger trg_emp_id
    before insert on foo
    for each row
  begin
    select emp_id_seq.nextval
      into :new.emp_id
      from dual;
  end;
  

select table_name from user_tables;

location 
question_category 
answer 	
employee 
mm_industry_company 
company 
event 	
priv 	
question 
department 
industry 
temp_user_id 


  select table_name from user_tables;

DECLARE
sqlcmd varchar2(4000) := '';

cursor tlist is   
  select table_name from user_tables;

BEGIN
select dummy into sqlcmd from dual;

FOR tlist_rec in tlist
   LOOP
      sqlcmd := 'drop table '||tlist_rec.table_name||' cascade constraints';
      execute immediate sqlcmd;
   END LOOP;
END;


/* KEEP SQL */
--show PK cols, in order of colID:
select  C.table_name,  TC.column_id, TC.column_name, CC.position, CC.constraint_name, C.constraint_name, C.constraint_type, C.index_name 
from user_constraints C, user_cons_columns CC, user_tab_columns TC 
where
    C.table_name='ANSWER'
and CC.table_name = C.table_name
and C.table_name = TC.table_name
and C.constraint_name = CC.CONSTRAINT_NAME
and CC.column_name = TC.column_name
and C.constraint_type='P' 



select * from user_tab_columns TC where table_name ='ANSWER' ;

select * from user_constraints C where table_name='ANSWER'  and constraint_type='P'; 

select * from user_cons_columns CC where table_name='ANSWER';

select * from user_tables where table_name='ANSWER'

select * from user_constraint_cols



select * from all_objects where object_name like '%CONS%';

select * from dba_tablespaces;


