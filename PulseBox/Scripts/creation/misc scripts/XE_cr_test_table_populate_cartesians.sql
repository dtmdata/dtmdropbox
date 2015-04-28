--create sequence:
create sequence seq_foo as ....

drop table foo;

create table foo tablespace USERS as select * from dual;
alter table foo modify(dummy  varchar2(10));


/*
r=1;  --#initial rows
c=2;  --#cartesians (e.g. foo f1, foo f2)
x=3;  --#executions of INSERT with the Cartesian FROM clause

WHILE r <> 0 LOOP
  insert into  foo values('x'||r);

insert into  foo values('v');
insert into  foo values('w');
insert into  foo values('5');
insert into  foo values('f');
insert into  foo values('9');
insert into  foo values('f');
insert into  foo values('9');
insert into  foo values('y');
insert into  foo values('0');

   r:= r-1;
DONE
commit;
*/

select * from foo;

declare

begin

truncate table foo;

select * from foo;

insert into  foo values('z'||r);
commit;

 --2 unjoined tables since c=2
insert into foo select f1.dummy from foo F1, foo F2; commit; select count(*) from foo; 


--commit;

end;
