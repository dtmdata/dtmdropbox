PROMPT *******************************************************************************
PROMPT ***   test.sp_parse_id_list.sql 
PROMPT *******************************************************************************
PROMPT

set serveroutput on

var rc refcursor

--(re)-compile:
@sp_parse_id_list
show error

exec sp_parse_id_list('4010,4020,4030,4048');
select * from gtt_id_list;

exec sp_parse_id_list('2002,2004,2005');
select * from gtt_id_list;
PROMPT When sp_parse_id_list called by itself, GTT_ID_LIST should contain accumulated values from the SQL session.

PROMPT
PROMPT
PROMPT
