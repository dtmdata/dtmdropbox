PROMPT *******************************************************************************
PROMPT ***   test.sp_GetDeptsSubordToEmpID.sql 
PROMPT *******************************************************************************
PROMPT


set serveroutput on

var rc refcursor

--(re)-compile:
@sp_GetDeptsSubordToEmpID
show error

--3005
exec sp_GetDeptsSubordToEmpID(3005, 6029, :rc)   
print rc

PROMPT Nothing expected to be in GTT_ID_LIST, for this st.proc:
select * from gtt_id_list;


--3005
exec sp_GetDeptsSubordToEmpID(3005, 6034, :rc)    
print rc

PROMPT Nothing expected to be in GTT_ID_LIST, for this st.proc:
select * from gtt_id_list;


--3005/6059=no subordinates
exec sp_GetDeptsSubordToEmpID(3005, 6059, :rc)    
print rc

PROMPT Nothing expected to be in GTT_ID_LIST, for this st.proc:
select * from gtt_id_list;

PROMPT
PROMPT
PROMPT

