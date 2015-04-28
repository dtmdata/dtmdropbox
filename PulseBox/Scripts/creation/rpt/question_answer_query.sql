col question_text format a35
col answer_text format a30
set linesize 200
select a.question_text, b.answer_text, b.answer_date, b.answer_rating, c.first_name, c.last_name, d.company_name
from question a, answer b, employee c, company d
where a.question_id=b.question_id
and b.emp_id=c.emp_id
and c.company_id=d.company_id
and c.company_id='&company_id'
order by 3;
