
update employee a set a.surname=(select b.surname_name from emp_update_temp b where a.emp_id=b.emp_id  
and b.surname_name is not null) where a.emp_id in (select emp_id from emp_update_temp  where loaded='N' and surname is not null);

update employee a set a.first_name=(select b.first_name from emp_update_temp b where a.emp_id=b.emp_id  
and b.first_name is not null) where a.emp_id in (select emp_id from emp_update_temp  where loaded='N' and first_name is not null);


update employee a set a.middle_name=(select b.middle_name from emp_update_temp b where a.emp_id=b.emp_id  
and b.middle_name is not null) where a.emp_id in (select emp_id from emp_update_temp  where loaded='N'and middle_name is not null);

update employee a set a.last_name=(select b.last_name from emp_update_temp b where a.emp_id=b.emp_id  
and b.last_name is not null) where a.emp_id in (select emp_id from emp_update_temp  where loaded='N' and last_name is not null);

update employee a set a.pedigree=(select b.pedigree from emp_update_temp b where a.emp_id=b.emp_id  
and b.pedigree is not null) where a.emp_id in (select emp_id from emp_update_temp  where loaded='N' and pedigree is not null);

update employee a set a.degree=(select b.degree from emp_update_temp b where a.emp_id=b.emp_id  
and b.degree is not null) where a.emp_id in (select emp_id from emp_update_temp  where loaded='N' and degree is not null);

update employee a set a.dept_id=(select b.dept_id from emp_update_temp b where a.emp_id=b.emp_id 
and b.dept_id is not null) where a.emp_id in (select emp_id from emp_update_temp  where loaded='N' and dept_id is not null);


update employee a set a.email_addr=(select b.new_email_addr from emp_update_temp b where a.emp_id=b.emp_id  
and b.new_email_addr is not null) where a.emp_id in (select emp_id from emp_update_temp  where loaded='N' and new_email_addr is not null); 

update employee a set a.phone_number=(select b.phone_number from emp_update_temp b where a.emp_id=b.emp_id  
and b.phone_number is not null) where a.emp_id in (select emp_id from emp_update_temp  where loaded='N' and phone_number is not null);


update employee a set a.mgr_email_addr=(select b.mgr_email_addr from emp_update_temp b where a.emp_id=b.emp_id and a.company_id=b.company_id  
and b.mgr_email_addr is not null) where a.emp_id in (select emp_id from emp_update_temp  where loaded='N' and mgr_email_addr is not null); 



update employee a set a.manager_id=(select b.emp_id  from employee b where b.email_addr=(select c.mgr_email_addr from emp_update_temp c where b.company_id=c.company_id 
and a.emp_id=c.emp_id and b.mgr_email_addr is not null)) where a.emp_id in (select emp_id from emp_update_temp  where loaded='N' and mgr_email_addr is not null);

update employee a set a.location_id=(select b.location_id from emp_update_temp b where a.emp_id=b.emp_id  
and b.location_id is not null ) where a.emp_id in (select emp_id from emp_update_temp  where loaded='N' and location_id is not null);

update employee a set a.comments=(select b.comments from emp_update_temp b where a.emp_id=b.emp_id  
and b.comments is not null) where a.emp_id in (select emp_id from emp_update_temp  where loaded='N' and comments is not null);


update employee a set a.manager_yn='Y' 
where (select count(1) from employee b where b.manager_id=a.emp_id) >0;

commit;



update emp_update_temp set loaded='Y' where task_type='U';

commit;


