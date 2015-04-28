@echo on

sqlldr 'dtm_dev/Level32014@axedb' control='industry-load.ctl' log='industry-log.log'

sqlldr 'dtm_dev/Level32014@axedb' control='company-load.ctl' log='company-log.log'

sqlldr 'dtm_dev/Level32014@axedb' control='locations-load.ctl' log='locations-log.log'
 
sqlldr 'dtm_dev/Level32014@axedb' control='department-load.ctl' log='department-log.log'

sqlldr 'dtm_dev/Level32014@axedb' control='emp-load.ctl' log='employee-log.log'
 


cd C:\Users\sirikonda.naveen\load files\company5\sql\
sqlplus dtm_dev/Level32014@axedb @insert.sql
