SPOOL RUNALL.LST
PROMPT 
PROMPT DDL Start:  Drop/Create tables..................................................................
@cr_tables.sql
PROMPT 
PROMPT 


PROMPT 
PROMPT SEQUENCE start: Add Sequences for single-column PKs..........
@cr_seq.sql
PROMPT 
PROMPT 


PROMPT 
PROMPT < TRIGGER creation is disabled >
PROMPT *disabled* TRIGGERS start: Add BeforeInsert Triggers for single-column PKs..........
--Don't need these since using <ID>.nextval in all of the INSERTS. Else, will end up skipping every other seq.
--@cr_trg.sql
PROMPT 
PROMPT 





PROMPT 
PROMPT DML start: Populate tables with default key values, and test data...............................
@inserts.sql
PROMPT 
PROMPT 


PROMPT 
PROMPT DDL/ALTERs start: Add FKs to further define relationships between tables........................
@alters.sql
PROMPT 
PROMPT 


PROMPT
PROMPT Special run by AXE for 2.0 upgrade; add 2 FK ID cols to ANSWER
@alters_special_1.sql
PROMPT


PROMPT 
PROMPT STORED PROCS start: Create Stored Procedures etc........................
PROMPT sp_GetCompanyEvents: 
@.\rpt\sp_GetCompanyEvents.sql
PROMPT sp_GetDeptsSubordToEmpID: 
@.\rpt\sp_GetDeptsSubordToEmpID.sql
PROMPT sp_GetIndustryForCompany: 
@.\rpt\sp_GetIndustryForCompany.sql
PROMPT sp_GetLocsSubordToEmpID: 
@.\rpt\sp_GetLocsSubordToEmpID.sql

PROMPT sp_parse_id_list: 
@.\rpt\sp_parse_id_list.sql

PROMPT sp_pulse_attrition: 
@.\rpt\sp_pulse_attrition.sql
PROMPT sp_pulse_company: 
@.\rpt\sp_pulse_company.sql
PROMPT sp_pulse_depts: 
@.\rpt\sp_pulse_depts.sql
PROMPT sp_pulse_industry: 
@.\rpt\sp_pulse_industry.sql
PROMPT @.\rpt\sp_pulse_locations: 
@.\rpt\sp_pulse_locations.sql
PROMPT sp_pulse_pct_participation: 
@.\rpt\sp_pulse_pct_participation.sql


PROMPT
PROMPT (disabled) Run test.RUNALL.sql to compile and run test cases for each proc().
--@.\rpt\test.RUNALL.sql


PROMPT 
PROMPT 

PROMPT *****************************************
PROMPT *****************| DONE |****************
PROMPT *****************************************

SPOOL OFF;
quit
