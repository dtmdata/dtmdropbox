create or replace procedure     sp_GetQuestions (IN_company_id number,
                                                         IN_source_id number ,
                                                         p_recordset    OUT SYS_REFCURSOR
                                                    )
as
v_company_id    number := IN_company_id;
v_source_id     number := IN_source_id;

begin
NULL;


OPEN p_recordset FOR
    select distinct QUESTION_TEXT, TYPE_ID
    from
        Question
    where
        1=1 and
        company_id=v_company_id 
        and source_id=v_source_id
        and type_id!=12001
;


exception
when others then
   null;
   rollback;  --try to raise an error to test this


end sp_GetQuestions;