update emp_update_temp a set a.dept_id=(select b.dept_id from department b where a.dept_name=b.dept_name and b.dept_name is not null and  b.company_id=(select company_id from company where company_name='&my_company'));

update emp_update_temp a set a.location_id=(select b.location_id from location b where a.address1=b.address1 and a.city=b.city and a.state=b.state 
and a.postal_code=b.postal_code and a.country=b.country and a.address1 is not null and a.city is not null and a.state is not null and a.postal_code is not null and b.company_id=(select company_id from company where company_name='&my_company'));

update emp_update_temp a set (emp_id,company_id)=(select emp_id,company_id from employee b  where a.old_email_addr=b.email_addr);

update emp_update_temp  set middle_name=' ' where middle_name is null;

commit;