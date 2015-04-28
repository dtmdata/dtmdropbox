load data
infile 'C:\Users\sirikonda.naveen\load files\company5\industries.txt'
badfile 'C:\Users\sirikonda.naveen\load files\company5\bad_industry_records.txt'
truncate into table industry_temp
fields terminated by "#$" trailing nullcols
(industry_name, industry_desc)