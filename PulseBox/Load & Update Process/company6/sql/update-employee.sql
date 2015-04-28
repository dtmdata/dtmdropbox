update employee a  set a.manager_id= (select  b.emp_id  from employee b where a.mgr_email_addr=b.email_addr)
where company_id= (select company_id from company where company_name='&my_company');

update employee a set a.manager_yn='Y' where(select count(1) from employee b where b.manager_id=a.emp_id) >0;

commit;