load data
infile 'C:\Users\sirikonda.naveen\load files\company3\updates_emp.txt'
badfile 'C:\Users\sirikonda.naveen\load files\company3\bad_updates_emp.txt'
truncate into table emp_update_temp
fields terminated by "#$" trailing nullcols
(surname_name, first_name, middle_name, last_name, pedigree, degree, gender, old_email_addr, new_email_addr,phone_number, dept_name, address1, address2, address3, city, county, state, postal_code, country, continent, manager, mgr_email_addr, comments, task_type, loaded)