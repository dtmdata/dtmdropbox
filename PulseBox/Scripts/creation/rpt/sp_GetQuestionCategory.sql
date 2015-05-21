create or replace procedure sp_GetQuestionCategory (IN_company_id  IN varchar2,
                                                     p_recordset    OUT SYS_REFCURSOR
                                                    )
as
v_company_id    varchar2(8)    := IN_company_id;  --dd='34JRT54X'/company_id=3002

begin
NULL;

OPEN p_recordset FOR
	select distinct CATEGORY_ID, CATEGORY_NAME, CATEGORY_DESCRIPTION
	from
		question_category
	where
		1=1
		and COMPANY_ID=v_company_id
;


exception
when others then
   null;
   rollback;  --try to raise an error to test this


end sp_GetQuestionCategory ;
/