alter table answer add (dept_id      number default 1 NOT NULL);
alter table answer add (location_id  number default 1 NOT NULL);

/* orig 2 UPDATEs:
--update answer a set dept_id=(select dept_id from department d where a.company_id=d.company_id and rownum=1);
--update answer a set location_id=(select location_id from location l where a.company_id=l.company_id and rownum=1);
*/

/* revised 2 UPDATES */
update answer a set a.dept_id=(select e.dept_id from employee e where a.emp_id=e.emp_id);
update answer a set a.location_id=(select e.location_id from employee e where a.emp_id=e.emp_id);

alter table answer add (foreign key (dept_id) references department (dept_id) enable validate);
alter table answer add (foreign key (location_id) references location (location_id) enable validate);


--AXE: suppression(?) level for COMPANY reporting:
--  reporting_level       number,   --"suppression level"  do this in ALTER script.
alter table cOMPANY add (reporting_level number default 1 NOT NULL);

--add col for EMPLOYEE (Alex):
alter table EMPLOYEE add (is_used Char Default 'N' NOT NULL);

--add col for ANSWER table (Axe 5/6/15)
alter table answer add (answer_yn char(1));

--add acknowledge to answer table (Axe 6/28/15)
alter table answer add (ack_date date);
alter table answer add (ack_by number);


