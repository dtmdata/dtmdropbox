load data
infile 'C:\Users\sirikonda.naveen\load files\locations.txt'
into table location_temp
fields terminated by "#$"
(address1, address2, address3, city, county, state, postal_code, country, continent)