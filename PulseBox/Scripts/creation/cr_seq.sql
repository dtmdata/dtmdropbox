/*
Create numeric sequences for each table's PK ID column

*/


PROMPT 
PROMPT Table => LOCATION .........................................................................
DROP SEQUENCE  location_id_seq;
CREATE SEQUENCE location_id_seq MINVALUE 2000 START WITH 2000 INCREMENT BY 1 CACHE 10;



PROMPT 
PROMPT Table => QUESTION_CATEGORY .........................................................................
DROP SEQUENCE category_id_seq;
CREATE SEQUENCE category_id_seq MINVALUE 8000 START WITH 8000 INCREMENT BY 1 CACHE 10;



PROMPT 
PROMPT Table => ANSWER .........................................................................
DROP SEQUENCE answer_id_seq;
CREATE SEQUENCE answer_id_seq MINVALUE 10000 START WITH 10000 INCREMENT BY 1 CACHE 10;



PROMPT 
PROMPT Table => EMPLOYEE .........................................................................
DROP SEQUENCE emp_id_seq;
CREATE SEQUENCE emp_id_seq MINVALUE 6000 START WITH 6000 INCREMENT BY 1 CACHE 10;



/*
--skip this table since ind and co IDs already make up PK 
PROMPT Table => *skipping*  MM_INDUSTRY_COMPANY .........................................................................
*/


PROMPT 
PROMPT Table => COMPANY .........................................................................
DROP SEQUENCE company_id_seq;
CREATE SEQUENCE company_id_seq MINVALUE 3000 START WITH 3000 INCREMENT BY 1 CACHE 10;



PROMPT 
PROMPT Table => EVENT .........................................................................
DROP SEQUENCE event_id_seq;
CREATE SEQUENCE event_id_seq MINVALUE 7000 START WITH 7000 INCREMENT BY 1 CACHE 10;



PROMPT 
PROMPT Table => PRIV .........................................................................
DROP SEQUENCE priv_id_seq;
CREATE SEQUENCE priv_id_seq MINVALUE 5000 START WITH 5000 INCREMENT BY 1 CACHE 10;



PROMPT 
PROMPT Table => QUESTION .........................................................................
DROP SEQUENCE question_id_seq;
CREATE SEQUENCE question_id_seq MINVALUE 9000 START WITH 9000 INCREMENT BY 1 CACHE 10;



PROMPT 
PROMPT Table => DEPARTMENT .........................................................................
DROP SEQUENCE dept_id_seq;
CREATE SEQUENCE dept_id_seq MINVALUE 4000 START WITH 4000 INCREMENT BY 1 CACHE 10;



PROMPT 
PROMPT Table => INDUSTRY .........................................................................
DROP SEQUENCE industry_id_seq;
CREATE SEQUENCE industry_id_seq MINVALUE 1000 START WITH 1000 INCREMENT BY 1 CACHE 10;







