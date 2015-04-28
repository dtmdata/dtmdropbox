update employee a set a.end_date=sysdate where a.email_addr=(select b.old_email_addr from emp_update_temp b where a.emp_id=b.emp_id  
and b.old_email_addr is not null) and a.emp_id in (select emp_id from emp_update_temp  where loaded='N' and task_type='D' and old_email_addr is not null);

update emp_update_temp set loaded='Y' where task_type='D';

commit;