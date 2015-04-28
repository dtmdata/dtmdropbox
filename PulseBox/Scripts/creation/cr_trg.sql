/* 
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
As of 1Nov14, we do not need these for ID values.
Sequences are in-place though and are all we need.
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
*/






/*
Create before insert Triggers to auto-generate values for each table's PK ID column
e.g. sample format:
CREATE OR REPLACE TRIGGER order_info_insert
   INSTEAD OF INSERT ON order_info
   DECLARE
     duplicate_info EXCEPTION;
     PRAGMA EXCEPTION_INIT (duplicate_info, -00001);
   BEGIN
     INSERT INTO customers
       (customer_id, cust_last_name, cust_first_name) 
     VALUES (
     :new.customer_id, 
     :new.cust_last_name,
     :new.cust_first_name);
   INSERT INTO orders (order_id, order_date, customer_id)
   VALUES (
     :new.order_id,
     :new.order_date,
     :new.customer_id);
   EXCEPTION
     WHEN duplicate_info THEN
       RAISE_APPLICATION_ERROR (
         num=> -20107,
         msg=> 'Duplicate customer or order ID');
   END order_info_insert;
/


*/

PROMPT
PROMPT ** Adding Table triggers **
PROMPT 
PROMPT
PROMPT Table => LOCATION .........................................................................

CREATE OR REPLACE TRIGGER trg_location_id
    before insert on LOCATION
    for each row
  begin
    select location_id_seq.nextval into :new.location_id from dual;
  end;
/


PROMPT 
PROMPT Table => QUESTION_CATEGORY .........................................................................

CREATE OR REPLACE TRIGGER trg_category_id
    before insert on QUESTION_CATEGORY
    for each row
  begin
    select category_id_seq.nextval into :new.category_id from dual;
  end;
/


PROMPT 
PROMPT Table => ANSWER .........................................................................

CREATE OR REPLACE TRIGGER trg_answer_id
    before insert on ANSWER
    for each row
  begin
    select answer_id_seq.nextval into :new.answer_id from dual;
  end;
/


PROMPT 
PROMPT Table => EMPLOYEE .........................................................................

CREATE OR REPLACE TRIGGER trg_emp_id
    before insert on EMPLOYEE
    for each row
  begin
    select emp_id_seq.nextval into :new.emp_id from dual;
  end;
/


/*
--skip this table since ind and co IDs already make up PK 
PROMPT Table => *skipping*  MM_INDUSTRY_COMPANY .........................................................................
*/


PROMPT 
PROMPT Table => COMPANY .........................................................................

CREATE OR REPLACE TRIGGER trg_company_id
    before insert on COMPANY
    for each row
  begin
    select company_id_seq.nextval into :new.company_id from dual;
  end;
/


PROMPT 
PROMPT Table => EVENT .........................................................................

CREATE OR REPLACE TRIGGER trg_event_id
    before insert on EVENT
    for each row
  begin
    select event_id_seq.nextval into :new.event_id from dual;
  end;
/


PROMPT 
PROMPT Table => PRIV .........................................................................

CREATE OR REPLACE TRIGGER trg_priv_id
    before insert on PRIV
    for each row
  begin
    select priv_id_seq.nextval into :new.priv_id from dual;
  end;
/


PROMPT 
PROMPT Table => QUESTION .........................................................................

CREATE OR REPLACE TRIGGER trg_question_id
    before insert on QUESTION
    for each row
  begin
    select question_id_seq.nextval into :new.question_id from dual;
  end;
/


PROMPT 
PROMPT Table => DEPARTMENT .........................................................................

CREATE OR REPLACE TRIGGER trg_dept_id
    before insert on DEPARTMENT
    for each row
  begin
    select dept_id_seq.nextval into :new.dept_id from dual;
  end;
/


PROMPT 
PROMPT Table => INDUSTRY .........................................................................

CREATE OR REPLACE TRIGGER industry_id_seq
    before insert on INDUSTRY
    for each row
  begin
    select industry_id_seq.nextval into :new.industry_id from dual;
  end;
/





