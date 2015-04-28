PROMPT *******************************************************************************
PROMPT ***   test.sp_pulse_company.sql 
PROMPT *******************************************************************************
PROMPT

set serveroutput on

var rc refcursor

--(re)-compile:
@sp_pulse_company
show error

--3005
exec sp_pulse_company(3005, '01-jan-2014', '28-feb-2014', :rc);
print rc

PROMPT Nothing expected to be in GTT_ID_LIST, for this st.proc:
select * from gtt_id_list;

--3004
exec sp_pulse_company(3004, '01-jan-2014', '28-feb-2014', :rc);
print rc

PROMPT Nothing expected to be in GTT_ID_LIST, for this st.proc:
select * from gtt_id_list;

--using Default date range, e.g. 45days
exec sp_pulse_company(3004, '', '', :rc);
print rc

PROMPT Nothing expected to be in GTT_ID_LIST, for this st.proc:
select * from gtt_id_list;

PROMPT
PROMPT
PROMPT
