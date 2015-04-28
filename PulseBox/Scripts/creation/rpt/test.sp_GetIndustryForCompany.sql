PROMPT *******************************************************************************
PROMPT ***   test.sp_GetIndustryForCompany.sql 
PROMPT *******************************************************************************
PROMPT


set serveroutput on

var rc refcursor

--(re)-compile:
@sp_GetIndustryForCompany
show error

--3000
exec sp_GetIndustryForCompany(3000, :rc)   
print rc

PROMPT Nothing expected to be in GTT_ID_LIST, for this st.proc:
select * from gtt_id_list;

--3001
exec sp_GetIndustryForCompany(3001, :rc)   
print rc

PROMPT Nothing expected to be in GTT_ID_LIST, for this st.proc:
select * from gtt_id_list;

--3005
exec sp_GetIndustryForCompany(3005, :rc)    
print rc

--bogus company1:
exec sp_GetIndustryForCompany(3999, :rc)    
print rc

--bogus company2:
exec sp_GetIndustryForCompany(9999, :rc)    
print rc

PROMPT Nothing expected to be in GTT_ID_LIST, for this st.proc:
select * from gtt_id_list;



PROMPT
PROMPT
PROMPT

