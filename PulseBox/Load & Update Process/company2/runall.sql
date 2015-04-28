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
PROMPT STORED PROCS start: Create Stored Procedures etc........................
@.\rpt\sp_pulse_company.sql
@.\rpt\sp_pulse_pct_participation.sql

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




PROMPT *****************************************
PROMPT *****************| DONE |****************
PROMPT *****************************************

SPOOL OFF;
quit
