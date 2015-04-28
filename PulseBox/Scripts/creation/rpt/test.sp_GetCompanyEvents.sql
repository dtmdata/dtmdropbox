PROMPT *******************************************************************************
PROMPT ***   test.sp_GetCompanyEvents.sql 
PROMPT *******************************************************************************
PROMPT

set serveroutput on

var rc refcursor

--(re)-compile:
@@sp_GetCompanyEvents
show error

--case1:  4001 has data, 4000 does not:
exec sp_GetCompanyEvents(3000, '4000,4001', '01-jan-2000', '31-dec-2015', :rc);
print rc

--case2:  4001 has data, 4000 does not:
exec sp_GetCompanyEvents(3000, '4000,4001,4002,4003', '01-jan-2000', '31-dec-2015', :rc);
print rc

PROMPT Did values in GTT_ID_LIST get deleted at end of sp_GetCompanyEvents() ?
select * from gtt_id_list;

PROMPT
PROMPT
PROMPT
