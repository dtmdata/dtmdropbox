-- First, drop all our tables: 
drop table LOCATION	        cascade constraints;
drop table QUESTION_CATEGORY 	cascade constraints;
drop table QUESTION_TYPE	cascade constraints;
drop table QUESTION_SOURCE 	cascade constraints;
drop table ANSWER               cascade constraints;
drop table EMPLOYEE             cascade constraints;
drop table MM_INDUSTRY_COMPANY 	cascade constraints;
drop table COMPANY 	        cascade constraints;
drop table EVENT_CATEGORY       cascade constraints;
drop table EVENT                cascade constraints;
drop table PRIV                 cascade constraints;
drop table QUESTION             cascade constraints;
drop table DEPARTMENT           cascade constraints;
drop table INDUSTRY             cascade constraints;
drop table TEMP_USER_ID	        cascade constraints;
drop table TEMP_COMPANY_INFO    cascade constraints;


-- ???: As of 10/8/14 we need to add unique constraint to entity_name+entity_end_date to allow for multiple legitmate names.


-- create tables + add constraints
create table INDUSTRY
(
  industry_id           number NOT NULL,
  industry_name         varchar2(30) NOT NULL,
  industry_desc         varchar2(200),
  start_date            date NOT NULL,
  end_date              date,
  constraint industry_pk primary key (industry_id) enable,
  constraint industry_uk1 unique (industry_name) enable
);
comment on table INDUSTRY is 'Reference table for Industries of Companies using DTM product(s)';


create table LOCATION
(
  location_id 		number not null,
  company_id		number not null,
  address1		varchar2(50),
  address2		varchar2(50),
  address3		varchar2(50),
  city			varchar2(30), 
  county		varchar2(30),
  state			varchar2(20),
  postal_code		varchar2(20),
  country		varchar2(30),
  continent		varchar2(30),
  region		varchar2(30),
  geo_code		varchar2(30),    --some form of Lat/Lon for the LocID
  start_date            date not null,
  end_date              date not null,
  constraint location_pk primary key (location_id) enable,
  constraint location_uq01 unique (location_id, company_id) enable
);
comment on table LOCATION is 'Reference table for locations of Companies and Employees';


create table COMPANY
(
  company_id            number NOT NULL,
  company_name          varchar2(30) NOT NULL,
  parent_company_id	number NOT NULL,
  company_desc		varchar2(200),
  location_id		number,
  total_employees       number,
  company_contact_id	number,
  product_flavor	varchar2(30),
  start_date            date NOT NULL,
  end_date              date NOT NULL,
  constraint company_pk primary key (company_id) enable,
  constraint company_uq01 unique (company_name) enable
);
comment on table COMPANY is 'Reference table for tracking companies using DTM product(s)';


create table MM_INDUSTRY_COMPANY
(
  industry_id 		number NOT NULL,
  company_id 		number NOT NULL,
  start_date            date NOT NULL,
  end_date              date NOT NULL,
  constraint mm_industry_company_pk primary key (industry_id, company_id) enable
);
comment on table MM_INDUSTRY_COMPANY is 'Stores FKs for M-M relations between INDUSTRY and COMPANY tables';


--NOTE: org structure determined by company/parent_company_id from COMPANY table, not DEPARTMENT
create table DEPARTMENT
(
  dept_id               number NOT NULL,
  dept_name             varchar2(30) NOT NULL,
  dept_desc             varchar2(200),
  dept_type		varchar2(20),
  company_id            number NOT NULL,
  start_date            date NOT NULL,
  end_date              date NOT NULL,
  constraint department_pk primary key (dept_id) enable,
  constraint department_uq01 unique (company_id, dept_id) enable
);
comment on table DEPARTMENT is 'Reference table for tracking org structure within each Company';


create table EVENT_CATEGORY
(
  category_id     	number NOT NULL,
  company_id            number NOT NULL,
  category_name         varchar2(30),
  category_description  varchar2(100),
  start_date            date NOT NULL,
  end_date              date NOT NULL,
  constraint event_category_pk primary key (category_id) enable, 
  constraint event_category_uq01 unique (category_id, company_id) enable
);
comment on table EVENT_CATEGORY is 'Reference table describing the Category/bucket for each event';


create table EVENT
(
  event_id              number NOT NULL, 
  event_name 		varchar2(30) NOT NULL,
  event_desc		varchar2(200),
  category_id		number not null,
  event_date            date,
  company_id            number NOT NULL,
  dept_id		number not null,
  event_privacy		varchar2(10),
  start_date            date NOT NULL,
  end_date              date NOT NULL,
  constraint event_pk primary key (event_id) enable
);
comment on table EVENT is 'Reference table for storing notable Events relating to a Company';


--Later:  Need M-M for this table?  Can/should a Question have multiple Categories?
create table QUESTION_CATEGORY
(
  category_id           number NOT NULL,
  company_id            number NOT NULL,
  category_name         varchar2(30),
  category_description  varchar2(100),
  start_date            date NOT NULL,
  end_date              date NOT NULL,
  constraint category_pk primary key (category_id) enable, 
  constraint question_category_uq01 unique (category_id, company_id) enable
);
comment on table QUESTION_CATEGORY is 'Reference table describing the Category/bucket for each question';


create table QUESTION_TYPE
(
  type_id      		number NOT NULL,
  type_name    		varchar2(30),
  type_description  	varchar2(100),
  start_date            date NOT NULL,
  end_date              date NOT NULL,
  constraint question_type_pk primary key (type_id) enable
);
comment on table QUESTION_TYPE is 'Reference table describing the type for each question';

create table QUESTION_SOURCE
(
  source_id      	number NOT NULL,
  source_name  		varchar2(30),
  source_description  	varchar2(100),
  start_date            date NOT NULL,
  end_date              date NOT NULL,
  constraint question_source_pk primary key (source_id) enable
);
comment on table QUESTION_SOURCE is 'Reference table describing the source for each question';


create table QUESTION
(
  question_id           number NOT NULL,
  company_id            number NOT NULL,
  dept_id               number NOT NULL,
  question_text         varchar2(200) NOT NULL,
  category_id           number NOT NULL,
  type_id		number NOT NULL,
  source_id		number NOT NULL,
  min_rating            number,
  max_rating            number,
  weight_factor		number,  -- +/- weightings -1.0 to +1.0 to help correlate pos/neg questions better.
  start_date            date NOT NULL,  --date range when this Question is relevant. If current date is outside start/end(inclusive) then "invalid question".
  end_date              date NOT NULL,  --date range when this Question is relevant. If current date is outside start/end(inclusive) then "invalid question".
  constraint question_pk primary key (question_id) enable,
  constraint question_uq01 unique (company_id, dept_id, question_text) enable,
  constraint question_uq02 unique (question_id, company_id) enable
);
comment on table QUESTION is 'contains all Questions, both Core(N) and Custom(Y)';


create table PRIV
(
  priv_id		number NOT NULL,
  company_id		number not null,
  priv_name		varchar2(20),
  priv_desc		varchar2(200),
  priv_level 		number,
  start_date            date NOT NULL,
  end_date              date NOT NULL,
  constraint priv_pk primary key (priv_id) enable
);
comment on table PRIV is 'Multi-use table: reports, app display, other uses...';


create table EMPLOYEE
(
  emp_id                number not null,
  surname		varchar2(4),
  first_name            varchar2(30) not null,
  middle_name		varchar2(30),
  last_name             varchar2(30) not null,
  pedigree		varchar2(10),
  degree		varchar2(10),
  gender		char(1),
  user_id		varchar2(8),
  user_alias		varchar2(30),
  company_id            number not null,
  dept_id               number not null,
  email_addr            varchar2(50) not null,
  phone_number		varchar2(15),
  manager_id            number not null,
  manager_yn		char(1) not null,
  location_id 		number not null,
  org_level		number, 
  priv_id		number not null,
  password 		varchar2(20),
  comments		varchar2(200),
  start_date            date not null,
  end_date              date not null,
  constraint employee_pk primary key (emp_id) enable, 
  constraint employee_uq01 unique (emp_id, company_id, dept_id) enable
);
comment on table EMPLOYEE is 'Reference table for tracking Employees of Companies';


create table ANSWER
(
  answer_id		number NOT NULL,
  question_id           number NOT NULL,
  answer_text           varchar2(2000),
  answer_date           date NOT NULL,
  emp_id                number NOT NULL,
  company_id		number not null,
  answer_rating         number,		--same range(1-10) as in QUESTION table?
  urgency		number,		--same range(1-10) as in QUESTION table?
  impact		number,		--same range(1-10) as in QUESTION table?
  start_date            date NOT NULL,  --DD *****: how were these 2 Dates intended to be used? They really ought to be tied directly to start/end_date from QUESTION table. Right ?
  end_date              date NOT NULL,  --DD *****: how were these 2 Dates intended to be used? They really ought to be tied directly to start/end_date from QUESTION table. Right ?
  constraint answer_pk primary key (answer_id) enable
);
comment on table ANSWER is 'Table contains Answers of Employees to various Questions';


-- temp table for PB/LITE version to create IDs and update employee table after that
create table TEMP_USER_ID
(
  company_id 		number not null,
  user_id		varchar2(8) not null,  --Can be used for app login
  user_alias		varchar2(30),          --optional NULL; default same as USER_ID? needs BeforeInsert trigger ?  Can be used for app login
  used_yn		char(1) not null,
constraint TEMP_USER_ID_uq01 unique (user_alias) enable
);
comment on table TEMP_USER_ID is 'PB/LITE only:  Used to create/track new logins, id usage, and to xref to Company table if USER_ID or ALIAS is forgotten';



create table TEMP_COMPANY_INFO
(
  company_name 		  varchar2(30),
  employee_surname	  varchar2(4),
  employee_first_name 	  varchar2(30),
  employee_middle_name    varchar2(30),
  employee_last_name	  varchar2(30),
  employee_pedigree	  varchar2(10),
  employee_degree	  varchar2(10),
  employee_gender	  char(1),
  employee_email 	  varchar2(30),
  employee_dept 	  varchar2(30),
  employee_addr1 	  varchar2(50),
  employee_addr2 	  varchar2(50),
  employee_addr3 	  varchar2(50),
  employee_city 	  varchar2(50),
  employee_state 	  varchar2(50),
  employee_country 	  varchar2(30),
  employee_zip 		  varchar2(10),
  employee_manager	  varchar2(30),
  employee_manager_email  varchar2(30),
  temp_load_date	  date,           -- date row loaded into this table
  processed_date	  date,           -- date loaded into pb tables from this temp table
  load_file_name	  varchar2(80)    -- name of file provided by customer that we loaded
);
comment on table TEMP_COMPANY_INFO is 'PB/PREMIUM only: Used for initial load of the Companys'' base data file they are required to send to DTM';



PROMPT Create GTT/Global Temp Table, used for storing intermediate parsed values from app-to-st.proc
--@cr_tables_GTT.sql
/** For use in stored procedures when passing strings back-forth from app to db, e.g. sp_pulse_depts() **/
DROP TABLE gtt_ID_LIST;
CREATE GLOBAL TEMPORARY TABLE GTT_ID_LIST (
  ID_LIST NUMBER,
  ID_TYPE VARCHAR2(50) --DEPT, QUESTION_CATEGORY, etc
) ON COMMIT PRESERVE ROWS;
COMMENT ON TABLE gtt_ID_LIST IS 'GTT/Global Temp Table to store IDs and their respective "TYPES", from comma-separated ID list passed IN to st.proc';


