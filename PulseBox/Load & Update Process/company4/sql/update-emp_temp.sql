update emp_temp a set a.company_id = (select b.company_id from company b where b.company_name='&my_company');

update emp_temp a set a.location_id= ( select b.location_id from company b where b.company_name='&my_company');

update emp_temp a set a.dept_id=(select b.dept_id from department b where a.dept_name=b.dept_name and b.company_id=(select company_id from company where company_name='&my_company'));

update emp_temp set middle_name=' ' where middle_name is null;

commit;