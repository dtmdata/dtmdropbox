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

PROMPT sp_DisplayNotifications: 
@.\rpt\sp_DisplayNotifications.sql

PROMPT sp_fcst_Team_Morale: 
@.\rpt\sp_fcst_Team_Morale.sql

PROMPT sp_GetCompanyEvents: 
@.\rpt\sp_GetCompanyEvents.sql

PROMPT sp_GetDeptsSubordToEmpID: 
@.\rpt\sp_GetDeptsSubordToEmpID.sql

PROMPT sp_GetEventCategory: 
@.\rpt\sp_GetEventCategory.sql

PROMPT sp_GetIndustryForCompany: 
@.\rpt\sp_GetIndustryForCompany.sql

PROMPT sp_GetLocsSubordToEmpID: 
@.\rpt\sp_GetLocsSubordToEmpID.sql

PROMPT sp_getnewevents: 
@.\rpt\sp_getnewevents.sql

PROMPT sp_getpulsecomments: 
@.\rpt\sp_getpulsecomments.sql

PROMPT sp_getquestioncategory: 
@.\rpt\sp_getquestioncategory.sql

PROMPT sp_getquestions: 
@.\rpt\sp_getquestions.sql

PROMPT sp_getquestionsbycategory: 
@.\rpt\sp_getquestionsbycategory.sql

PROMPT sp_getquestiontype:
@.\rpt\sp_getquestiontype.sql

PROMPT sp_insert_answer:
@.\rpt\sp_insert_answer.sql

PROMPT sp_insert_answer_text:
@.\rpt\sp_insert_answer_text.sql

PROMPT sp_insert_event:
@.\rpt\sp_insert_event.sql

PROMPT sp_insert_notification:
@.\rpt\sp_insert_notification.sql

PROMPT sp_insert_question: 
@.\rpt\sp_insert_question.sql

PROMPT sp_parse_id_list: 
@.\rpt\sp_parse_id_list.sql

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

PROMPT sp_pulse_q_category:
@.\rpt\sp_pulse_q_category.sql

PROMPT sp_sendnotification:
@.\rpt\sp_sendnotification.sql

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
