PROMPT *******************************************************************************
PROMPT ***   test.sp_pulse_locations.sql 
PROMPT *******************************************************************************
PROMPT

set serveroutput on

var rc refcursor

--(re)-compile:
@sp_pulse_locations
show error

--string of 3 LOCs passed in:
exec sp_pulse_locations(3005, '2002,2004,2005', '01-jan-2014', '28-feb-2014', :rc);
print rc

--string of *1* LOC passed in:
exec sp_pulse_locations(3005, '2002', '01-jan-2000', '28-feb-2014', :rc);
print rc

--string of *1* LOC passed in:
exec sp_pulse_locations(3005, '2005', '01-jan-2000', '28-feb-2014', :rc);
print rc

--empty string passed in:
exec sp_pulse_locations(3005, '', '01-jan-2014', '28-feb-2014', :rc);
print rc


PROMPT Did values in GTT_ID_LIST get deleted at end of sp_pulse_locations() ?
select * from gtt_id_list;

PROMPT
PROMPT
PROMPT
