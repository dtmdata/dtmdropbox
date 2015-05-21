create or replace procedure sp_GetQuestionType (p_recordset    OUT SYS_REFCURSOR
                                                    )
as

begin
NULL;

OPEN p_recordset FOR
	select distinct TYPE_ID, TYPE_NAME, TYPE_DESCRIPTION
	from
		question_type
	where
		1=1
	and	type_name != 'Sample Question Type'
;


exception
when others then
   null;
   rollback;  --try to raise an error to test this


end sp_GetQuestionType ;
/