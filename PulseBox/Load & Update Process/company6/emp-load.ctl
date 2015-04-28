load data
infile 'C:\Users\sirikonda.naveen\load files\company6\employees.txt'
badfile 'C:\Users\sirikonda.naveen\load files\company6\bad_employees_records.txt'
truncate into table emp_temp
fields terminated by "#$" trailing nullcols
(first_name, middle_name, last_name, gender, email_addr, dept_name, address1, address2, address3, city, county, state, postal_code, country, continent, manager, mgr_email_addr)