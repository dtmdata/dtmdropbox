PROMPT *******************************************************************************
PROMPT ***   test.sp_GetLocsSubordToEmpID.sql 
PROMPT *******************************************************************************
PROMPT

set serveroutput on

var rc refcursor

--(re)-compile:
@sp_GetLocsSubordToEmpID
show error

--3005
exec sp_GetLocsSubordToEmpID(3005, 6029, :rc)   
print rc

--3005
exec sp_GetLocsSubordToEmpID(3005, 6041, :rc)    
print rc

--3005/6059=no subordinates
exec sp_GetLocsSubordToEmpID(3005, 6016, :rc)    
print rc

PROMPT
PROMPT
PROMPT
