load data
infile 'C:\Users\sirikonda.naveen\load files\company3\company.txt'
badfile 'C:\Users\sirikonda.naveen\load files\company3\bad_company_records.txt'
truncate into table company_temp
fields terminated by "#$" trailing nullcols
(company_name, company_desc, total_employees, product_flavor)