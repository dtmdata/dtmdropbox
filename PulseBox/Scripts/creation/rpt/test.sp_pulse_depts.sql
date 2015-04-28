PROMPT *******************************************************************************
PROMPT ***   test.sp_pulse_depts.sql 
PROMPT *******************************************************************************
PROMPT

set serveroutput on

var rc refcursor

--(re)-compile:
@sp_pulse_depts
show error

exec sp_pulse_depts(3005, '4010,4020,4030,4048', '01-jan-2014', '28-feb-2014', :rc);
print rc

--test empty dept string:
exec sp_pulse_depts(3005, '', '01-jan-2000', '31-dec-2015', :rc);
print rc

PROMPT Did values in GTT_ID_LIST get deleted at end of sp_pulse_depts() ?
select * from gtt_id_list;

PROMPT
PROMPT
PROMPT
