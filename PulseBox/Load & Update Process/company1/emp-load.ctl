load data
infile 'C:\Users\sirikonda.naveen\load files\employees.txt'
into table emp_temp
fields terminated by "#$"
(emp_first_name, emp_middle_name, emp_last_name, emp_gender, emp_email, emp_dept, emp_address1, emp_address2, emp_address3, emp_city, emp_county, emp_state, emp_zip, emp_country, emp_continent, emp_manager, emp_manager_email)