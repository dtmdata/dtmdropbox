
DROP TABLE useradmin.foo;
CREATE TABLE useradmin.foo (
    foo_id number primary key,
    footext varchar2(4000)
  )   TABLESPACE "USERS" ;



------ template plsql format ----------------------------------------------------------------------------------------------------------------------
DECLARE
  ctr integer := 1;
  x integer := 5;
  str varchar2(4000) := '';
  num_rows integer := 1000000;
  num_execs_per_cache_val integer := log(10, num_rows);   -- no need to cache any more than 'num_rows', so stop at 'log(num_rows)'
BEGIN
for ctr in 1..x loop
--  insert into foo values(emp_id_seq.nextval, x);
--  str:='insert into useradmin.foo values(foo_id_seq.nextval, x);';
--  execute immediate str;
  str:='insert into useradmin.foo values(foo_id_seq.nextval, x);';  --why does this one *work* but the other one below doesn't??
  execute immediate str;                                            --why does this one *work* but the other one below doesn't??
  x:=x+1;  --dummy stmt
end loop;  
EXCEPTION
  when others then
  x:=1;
END;  

select * from foo;  



----------------------------------------------------------------------------------------------------------------------------








----------------------------------------------------------------------------------------------------------------------------

DROP TABLE useradmin.foo;
CREATE TABLE useradmin.foo (
    foo_id number primary key,
    footext varchar2(4000)
  )   TABLESPACE "USERS" ;
  
drop sequence foo_id_seq;
create sequence foo_id_seq MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 10;   
  
DROP TABLE useradmin.test_results;
CREATE TABLE useradmin.test_results 
    (
    test_result_id number      ,
    start_ts date                      ,  end_ts date,  
    start_seq_ts date               , end_seq_ts date,  
    start_inner_loop_ts date   ,  end_inner_loop_ts date,  
    start_rollback_ts date      ,  end_rollback_ts date,  
    cache_val number               ,  num_rows number, 
    sql_stmt varchar2(4000)      , exceptions_error varchar2(4000)  
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 
drop sequence test_results_id_seq;
create sequence test_results_id_seq  MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 10;
 
--SEQ/CACHE perf test
DECLARE 
  x integer := 0;
  y integer := 0;
  cache_val integer := 10;
  multiplier integer := 10;
  num_rows integer := 1000000;
  num_execs_per_cache_val integer := log(10, num_rows);   -- no need to cache any more than 'num_rows', so stop at 'log(num_rows)', i.e. 6.
  start_ts date;
  end_ts date;
  start_seq_ts  date;
  end_seq_ts  date; 
  start_inner_loop_ts date;
  end_inner_loop_ts date;
  start_rollback_ts date;
  end_rollback_ts date;
  strDropSeq varchar2(4000) := '';
  strCreateSeq varchar2(4000) := '';
  str varchar2(4000) := '';
  
BEGIN  
--grab timestamp for this OUTER loop iteration
select sysdate into start_ts from dual;
FOR y in 1..num_execs_per_cache_val LOOP   
   --how long to drop/create the sequence; CACHE value changing, each OUTER loop
   select sysdate into start_seq_ts from dual;
     strDropSeq    := 'drop sequence foo_id_seq';
     strCreateSeq := 'create sequence foo_id_seq MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE '|| cache_val; 
     execute immediate strDropSeq;
     execute immediate strCreateSeq;
   select sysdate into end_seq_ts from dual;

   --how long to insert NUM_ROWS rows of data, using current value of sequence's CACHE
   select sysdate into start_inner_loop_ts from dual;
      FOR x in 1..num_rows LOOP   
        insert into useradmin.foo values(foo_id_seq.nextval, x);
        --str:='insert into useradmin.foo values(foo_id_seq.nextval, x);';
        --execute immediate str;
      END LOOP;  --INNER
   select sysdate into end_inner_loop_ts from dual;

   --how long to rollback what was just inserted?   
   select sysdate into start_rollback_ts from dual;
     rollback;   --don't want to save the inserted data
   select sysdate into end_rollback_ts from dual;

   --grab timestamp for this OUTER loop iteration
   select sysdate into end_ts from dual;

   --save results; no timestamps grabbed for this
   insert into useradmin.test_results values(
       test_results_id_seq.nextval,
       start_ts                    , end_ts,  
       start_seq_ts             , end_seq_ts,  
       start_inner_loop_ts , end_inner_loop_ts,  
       start_rollback_ts    , end_rollback_ts,  
       cache_val                  , num_rows,
       str                             , '' );  
   commit;

   --increment the CACHE value, and repeat
   cache_val := (cache_val * multiplier);        
END LOOP;  --OUTER
--EXCEPTIONS

END;


