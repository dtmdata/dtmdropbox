PROMPT *******************************************************************************
PROMPT ***   test.sp_pulse_pct_participation.sql 
PROMPT *******************************************************************************
PROMPT


set serveroutput on

var rc refcursor

--(re)-compile:
@@sp_pulse_pct_participation
show error

exec sp_pulse_pct_participation(3000, '4000,4001', '01-jan-2000', '31-dec-2015', :rc);
print rc

PROMPT Did values in GTT_ID_LIST get deleted at end of sp_pulse_pct_participation() ?
select * from gtt_id_list;

PROMPT
PROMPT
PROMPT
