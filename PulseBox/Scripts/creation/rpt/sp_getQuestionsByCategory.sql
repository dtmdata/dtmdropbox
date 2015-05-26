create or replace procedure sp_GetQuestionsByCategory (IN_company_id  IN varchar2, IN_category_id number,
                                                     p_recordset    OUT SYS_REFCURSOR
                                                    )
as
v_company_id    varchar2(8)    := IN_company_id;
v_category_id   number	       := IN_category_id;

begin
NULL;

OPEN p_recordset FOR
	select distinct QUESTION_ID, QUESTION_TEXT
	from
		question
	where
		1=1
		and COMPANY_ID=v_company_id
		and CATEGORY_ID=v_category_id
;


exception
when others then
   null;
   rollback;  --try to raise an error to test this


end sp_GetQuestionsByCategory;
/