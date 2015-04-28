load data
infile 'C:\Users\sirikonda.naveen\load files\company5\departments.txt'
badfile 'C:\Users\sirikonda.naveen\load files\company5\bad_departments_records.txt'
truncate into table department_temp
fields terminated by "#$" trailing nullcols
(dept_name, dept_desc, dept_type)