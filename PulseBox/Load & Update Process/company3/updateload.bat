@echo on

sqlldr 'dtm_dev/Level32014@axedb' control='updates-load.ctl' log='updates-log.log'

 


cd C:\Users\sirikonda.naveen\load files\company3\sql\
sqlplus dtm_dev/Level32014@axedb @updates-employee_table.sql
