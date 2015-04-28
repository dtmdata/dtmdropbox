load data
infile 'C:\Users\sirikonda.naveen\load files\industries.txt'
into table industry_temp
fields terminated by ","
(industry_name, industry_desc)