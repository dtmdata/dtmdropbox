insert into employee(emp_id,first_name, middle_name, last_name, gender, company_id, dept_id, email_addr,manager_id,manager_yn,location_id,priv_id, start_date, end_date, mgr_email_addr) 
select emp_id_seq.nextval, a.first_name, a.middle_name, a.last_name, a.gender, a.company_id, a.dept_id, a.email_addr,1,'N',a.location_id,1, sysdate,to_date('12-31-9999','mm-dd-yyyy'),a.mgr_email_addr
from emp_temp a;
commit;