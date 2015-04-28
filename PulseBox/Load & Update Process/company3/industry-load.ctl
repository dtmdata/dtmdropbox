load data
infile 'C:\Users\sirikonda.naveen\load files\company3\industries.txt'
badfile 'C:\Users\sirikonda.naveen\load files\company3\bad_industry_records.txt'
truncate into table industry_temp
fields terminated by "#$"
(industry_name, industry_desc)