
/************< generic ID generator >*********************************************************************************** 
Specific case is to create USER_ID.

Create an alpha ID string of 'n' chars in length, e.g. 'B34R9T6N' (no repeating chars!)
Where:   
   a) chars can be re-used... n=8, unique combos, non-repeating using 36 possible chars... ==>  
   b) chars cannot be reused
Valid chars are:
{0..9, upper(a..z) } ==> 36 total to choose from, and case insensitive


***********************************************************************************************/





--------------------------
---< TEST STUFF BELOW >---
--------------------------

drop table foo;
create table foo as select * from dual;
alter table foo modify (dummy  varchar2(10));
alter table foo add    (foo_id  number);


PROMPT 
PROMPT Table => FOO .........................................................................
drop table foo;
create table foo as select * from dual;
alter table foo modify (dummy  varchar2(10));
alter table foo add    (foo_id  number);

DROP SEQUENCE  foo_id_seq;
CREATE SEQUENCE foo_id_seq MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 10;


/*
--not needed for below example. so, WHEN used ??
CREATE OR REPLACE TRIGGER trg_foo_id
    before insert on FOO
    for each row
  begin
    select foo_id_seq.nextval into :new.foo_id from dual;
  end;
/

*/


/* SCENARIO a) */
--convert PK ID/number into an 'n' char string  
declare
x integer := 0;
str varchar2(10) := '';
maxrows integer := 127;

begin
for x in 1..maxrows loop
   insert into foo values(chr(x), foo_id_seq.nextval);  
end loop;
exception
when others then
   select count(dummy) into x from dual;  --dummy stmt placeholder
end;
/
commit;

--rollback;



/*-------------------------------------*/

select * from foo;



/* SCENARIO b) */


