-- magic query

set linesize 200
col company_name format a30
col industry_name format a20
col address1 format a25
col city format a15
col country format a23
col region format a13
col continent format a13
col state format a10
col total_employees format 999,999


select f.first_name, f.last_name, f.email_addr, a.company_name, a.total_employees, d.dept_name, c.address1, c.city, c.state, c.country
from company a, location c, department d, employee f
where a.location_id=c.location_id
and a.company_id=d.company_id
and a.company_id=f.company_id
and d.dept_id=f.dept_id
and a.company_id='&company_id'
order by 1;
