create or replace procedure sp_GetEventCategory (IN_company_id  IN number,
                                                 p_recordset    OUT SYS_REFCURSOR
                                                )
as
v_company_id    number := IN_company_id;  --dd='34JRT54X'/company_id=3002

begin
NULL;

OPEN p_recordset FOR
	select distinct CATEGORY_ID, COMPANY_ID, CATEGORY_NAME, CATEGORY_DESCRIPTION
	from
		event_category
	where
		1=1
		and COMPANY_ID=v_company_id
;


exception
when others then
   null;
   rollback;  --try to raise an error to test this


end sp_GetEventCategory;
/