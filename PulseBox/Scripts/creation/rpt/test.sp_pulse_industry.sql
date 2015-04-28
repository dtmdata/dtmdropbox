PROMPT *******************************************************************************
PROMPT ***   test.sp_pulse_industry.sql 
PROMPT *******************************************************************************
PROMPT

set serveroutput on

var rc refcursor

--(re)-compile:
@sp_pulse_industry
show error

--User checks5 Industries: 1007(has test data for 3005) + other Industries company not a part of.
exec sp_pulse_industry(3005, '1000,1002,1004,1005,1007', '01-jan-2000', '31-dec-2015', :rc);
print rc

--just 1007
exec sp_pulse_industry(3005, '1007', '01-jan-2000', '31-dec-2015', :rc);
print rc

--just industry id 3005/1007 and 3007/1016, both having test data
exec sp_pulse_industry(3007, '1016', '01-jan-2000', '31-dec-2015', :rc);
print rc

--single industry passed-in:
exec sp_pulse_industry(3005, '1000', '01-jan-2000', '31-dec-2015', :rc);
print rc

--single industry passed-in, smaller date range:
exec sp_pulse_industry(3005, '1000', '01-jul-2012', '31-jul-2012', :rc);
print rc

--just industry id 3000/1000 and 3000/1002, both having test data
exec sp_pulse_industry(3000, '1000,1002', '01-jan-2000', '31-dec-2015', :rc);
print rc

--just industry id 3005/1007 and 3007/1016, both having test data
exec sp_pulse_industry(3005, '1007,1016', '01-jan-2000', '31-dec-2015', :rc);
print rc

--ERRORS:  NO industry passed-in... ERROR returned, not handled well enough:
exec sp_pulse_industry(3005, '', '01-jan-2000', '31-dec-2015', :rc);
print rc
PROMPT Error above is expected since '' was passed into sp_parse_id_list() for IndustryID.

PROMPT Did values in GTT_ID_LIST get deleted at end of sp_pulse_industry() ?
select * from gtt_id_list;

PROMPT
PROMPT
PROMPT
