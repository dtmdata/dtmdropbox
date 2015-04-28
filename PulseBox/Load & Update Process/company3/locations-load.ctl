load data
infile 'C:\Users\sirikonda.naveen\load files\company3\locations.txt'
badfile 'C:\Users\sirikonda.naveen\load files\company3\bad_locations_records.txt'
truncate into table location_temp
fields terminated by "#$" trailing nullcols
(address1, address2, address3, city, county, state, postal_code, country, continent)