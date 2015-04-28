load data
infile 'C:\Users\sirikonda.naveen\load files\company.txt'
into table company_temp
fields terminated by "#$"
(company_name, company_desc, total_employees, product_flavor)