-- set scan off so it reads "&" as data and not variable
set scan off;

-- remove rows from existing tables
delete from mm_industry_company;
delete from question_category;
delete from question;
delete from question_type;
delete from question_source;
delete from event;
delete from event_category;
delete from priv;
delete from employee;
delete from department;
delete from company;
delete from industry;
delete from TEMP_USER_ID;
delete from TEMP_COMPANY_INFO;
delete from NOTIFICATION;


-- insert all generic/dummy data first
prompt INSERT GENERIC/DUMMY DATA............................
insert into industry values (1, 'Sample Industry', 'Generic temporary industry to be used as placeholder only', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into location values (1, 1, '123 Sample St', '', '', 'Sample City', 'Sample County', 'Sample State', 'N/A', 'Sample Country', 'Sample Continent', 'Sample Region', 'N/A', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into company values (1, 'Sample Company', 1, 'Generic company to be used temporary basis', 1, 10, 1, 'Lite', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (1, 'Sample Department', 'Generic dept to be used temporary basis', 'Temporary', 1, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into priv values (1, 1, 'Sample Priv', 'Generic priv to be used temporary basis', 1, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (1, 'Mr.', 'Sample', 'E.', 'Employee', 'Jr', 'PhD', 'M', 'A2Z75S18', 'my_username', 1, 1, 'sample.employee@samplecompany.com', 'N/A', 1, 'N', 1, 1, 1, 'samplepassword', 'testing only', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into event_category values (1, 1, 'Sample Event Category', 'Generic event category used temporary basis', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into event values (1, 'Sample Event', 'Generic event used temporary basis', 1, to_date('05-01-2014', 'MM-DD-YYYY'), 1, 1, 'public', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_category values (1, 1, 'Sample Question Category', 'Generic category to be used temporary basis', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_source values (1, 'Sample question source', 'Generic question source to be used temporary basis', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_type values (1, 'Sample Question Type', 'Generic question type to be used temporary basis', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (1, 1, 1, 'Sample question?', 1, 1, 1, 1, 10, 4, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into answer values (1, 1, 'Sample answer', to_date('09-28-2014', 'MM-DD-YYYY'), 1, 1, 7, 5, 8, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into notification values (1, 1, 1, 'Sample Notification Name', 'Sample Notification Text', 'sample.employee@samplecompany.com', 'Y', sysdate, sysdate, 0, 60, 60, 2, 8, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
commit;

--insert 3 sample notifications for company 3000 to be used by pb0, pb1 users that we can give to anyone  -axe
insert into notification values (notification_id_seq.nextval, 3000, 4000, 'Average Pulse', 'Your average team pulse fell below 20%!', 'tom.smith@soc.com', 'Y', sysdate, trunc(sysdate), 0, 60, 60, 2, 8, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'), 6000);
insert into notification values (notification_id_seq.nextval, 3000, 4001, 'Average Pulse', 'Your average team participation fell below 20%!', 'tom.smith@soc.com', 'Y', sysdate, trunc(sysdate), 0, 60, 60, 2, 8, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'), 6000);
insert into notification values (notification_id_seq.nextval, 3000, 4002, 'Average Pulse', 'Your average team pulse fell below 20%!', 'tom.smith@soc.com', 'Y', sysdate, trunc(sysdate), 0, 60, 60, 2, 8, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'), 6000);


--special IDs: 10 through whatever needed. This is for the hardcoded IDs that the App will be using. 
insert into question values (10, 1, 1, 'FREE TEXT QUESTION', 1, 12001, 13000, 1, 10, 1, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (11, 3000, 4000, 'FREE TEXT QUESTION', 80, 12001, 13000, 1, 10, 1, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (12, 3001, 4004, 'FREE TEXT QUESTION', 81, 12001, 13000, 1, 10, 1, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (13, 3002, 4007, 'FREE TEXT QUESTION', 82, 12001, 13000, 1, 10, 1, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (14, 3003, 4008, 'FREE TEXT QUESTION', 83, 12001, 13000, 1, 10, 1, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (15, 3004, 4009, 'FREE TEXT QUESTION', 84, 12001, 13000, 1, 10, 1, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (16, 3005, 4010, 'FREE TEXT QUESTION', 85, 12001, 13000, 1, 10, 1, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (17, 3006, 4011, 'FREE TEXT QUESTION', 86, 12001, 13000, 1, 10, 1, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (18, 3007, 4012, 'FREE TEXT QUESTION', 87, 12001, 13000, 1, 10, 1, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (19, 3008, 4013, 'FREE TEXT QUESTION', 88, 12001, 13000, 1, 10, 1, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (20, 3009, 4014, 'FREE TEXT QUESTION', 89, 12001, 13000, 1, 10, 1, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (21, 3010, 4015, 'FREE TEXT QUESTION', 90, 12001, 13000, 1, 10, 1, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (22, 3011, 4016, 'FREE TEXT QUESTION', 91, 12001, 13000, 1, 10, 1, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (23, 3012, 4017, 'FREE TEXT QUESTION', 92, 12001, 13000, 1, 10, 1, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));


PROMPT |===============> INSERT TEST DATA <=================================================================================|
PROMPT
PROMPT

-- now insert test data:
PROMPT INDUSTRY................................
--IDs should start at 1000 in seq definition
insert into industry values (industry_id_seq.nextval, 'Internet'      , 'Internet Industry'                 , sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into industry values (industry_id_seq.nextval, 'Social Media'  , 'Social Media Industry'             , sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into industry values (industry_id_seq.nextval, 'Telecommunications', 'Diversified Telecommunication Services', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into industry values (industry_id_seq.nextval, 'Software', 'Computer Software Industry', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into industry values (industry_id_seq.nextval, 'Banking', 'Banking Industry', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into industry values (industry_id_seq.nextval, 'Materials', 'Basic Materials Industry', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into industry values (industry_id_seq.nextval, 'Construction', 'Construction Industry', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into industry values (industry_id_seq.nextval, 'Electronics', 'Electronics Industry', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into industry values (industry_id_seq.nextval, 'Energy', 'Energy Industry', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into industry values (industry_id_seq.nextval, 'Entertainment', 'Entertainment Industry', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into industry values (industry_id_seq.nextval, 'Healthcare', 'Healthcare Industry', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into industry values (industry_id_seq.nextval, 'Insurance', 'Insurance Industry', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into industry values (industry_id_seq.nextval, 'Media', 'Media Industry', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into industry values (industry_id_seq.nextval, 'Real Estate', 'Real Estate Industry', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into industry values (industry_id_seq.nextval, 'Transportation', 'Transportation Industry', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into industry values (industry_id_seq.nextval, 'Utilities', 'Utilities Industry', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into industry values (industry_id_seq.nextval, 'Financial', 'Financial Industry', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into industry values (industry_id_seq.nextval, 'Pharmaceutical', 'Pharmaceutical Industry', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into industry values (industry_id_seq.nextval, 'Travel', 'Travel & Leisure Industry', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into industry values (industry_id_seq.nextval, 'Education', 'Education Industry', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into industry values (industry_id_seq.nextval, 'Manufacturing', 'Manufacturing Industry', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into industry values (industry_id_seq.nextval, 'Retail', 'Retail & General Merchandise Industry', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into industry values (industry_id_seq.nextval, 'Service', 'Service Sector/Industry', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));


PROMPT LOCATION................................
--IDs should start at 2000 in seq definition
insert into location values (location_id_seq.nextval, 1, '1601 Willow Road'  , '', '', 'Menlo Park', 'San Mateo' , 'CA', '94025', 'USA', 'North America', '', 'N/A', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into location values (location_id_seq.nextval, 1, '1025 Eldorado Blvd', '', '', 'Broomfield', 'Broomfield', 'CO', '80021', 'USA', 'North America', '','N/A', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into location values (location_id_seq.nextval, 1, '101 DTM Data Parkway', '', '', 'Boulder', 'Boulder', 'CO', '80301', 'USA', 'North America', '','N/A', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into location values (location_id_seq.nextval, 1, '123 Tiny Drive', '', '', 'San Diego', 'San Diego', 'CA', '92103', 'USA', 'North America', '','N/A', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into location values (location_id_seq.nextval, 1, '234 Small Way', '', '', 'Denver', 'Denver', 'CO', '80204', 'USA', 'North America', '','N/A', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into location values (location_id_seq.nextval, 1, '456 Medium Place', '', '', 'Miami', 'Miami-Dade', 'FL', '33132', 'USA', 'North America', '','N/A', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into location values (location_id_seq.nextval, 1, '789 Large Circle', '', '', 'Madison', 'WI', 'Dane', '53704', 'USA', 'North America', '','N/A', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into location values (location_id_seq.nextval, 1, '999 Very Large Ave', '', '', 'Washington', 'District of Columbia', 'DC', '20011', 'USA', 'North America', '','N/A', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into location values (location_id_seq.nextval, 1, '1010 Easy St', '', '', 'Toronto', '', 'Ontario', 'A1A 1A1', 'Canada', 'North America', '','N/A', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into location values (location_id_seq.nextval, 1, '3 High Street', '', '', 'London', 'Buckinghamshire', '', 'HP19 3EQ', 'United Kingdom', 'Europe', '', 'N/A', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into location values (location_id_seq.nextval, 1, 'Suite 109 Floor 5 240 Wandaloo ESP', '', 'WA', 'New Canberra', '', '', '1234', 'Australia', 'Australia', '', 'N/A', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into location values (location_id_seq.nextval, 1, 'Piedras No 623 Piso2 Dto.4', '', '', 'Buenos Aires', '', '', 'C1009ABS', 'Argentina', 'South America', '', 'N/A', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into location values (location_id_seq.nextval, 1, 'Park Place Tower, Suite 1403', 'Sheikh Zayed Road, PO Box 3614', '', 'Dubai', '', '', '', 'United Arab Emirates', 'Asia', 'Middle East', 'N/A', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into location values (location_id_seq.nextval, 1, '300 HAO HUÁIHAIZHONGLÙ'  , 'SHÀNGHAISHÌ', '', '', '' , 'SHÀNGHAISHÌ', '200021', 'China', 'Asia', '', 'N/A', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into location values (location_id_seq.nextval, 1, 'Röntgenstr. 9'  , '', '', 'MAXDORF', '' , '', '67133', 'Germany', 'Europe', '', 'N/A', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into location values (location_id_seq.nextval, 1, '1 Palam Vihar Marg'  , '', '', 'Gurgaon', 'Chauma' , 'Palam Vihar', '122017', 'India', 'Asia', 'South Asia', 'N/A', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into location values (location_id_seq.nextval, 1, 'Privada Union 126'  , 'Iztacalco, Col. Agricola Pantitlan', '', '', '' , '', '08100', 'Mexico', 'North America', '', 'N/A', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));


PROMPT COMPANY................................
--IDs should start at 3000 in seq definition
insert into company values (company_id_seq.nextval, 'Sample Online Company'              , 3000, 'Sample Online Company'              , 2000, 7185 , 6000, 'Premium', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into company values (company_id_seq.nextval, 'Sample Telecom Company', 3001, 'Sample Telecom Company', 2001, 10000, 6001, 'Premium', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into company values (company_id_seq.nextval, 'DTM Data', 3002, 'DTM Data, LLC', 2002, 4, 1, 'Premium', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into company values (company_id_seq.nextval, 'Tiny Company', 3003, 'Tiny Company, LLC', 2003, 7, 1, 'Lite', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into company values (company_id_seq.nextval, 'Small Company', 3004, 'Small Company, LLC', 2004, 35, 1, 'Lite', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into company values (company_id_seq.nextval, 'Medium Company', 3005, 'Medium Company, LLC', 2005, 745, 1, 'Premium', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into company values (company_id_seq.nextval, 'Large Company', 3007, 'Large Company, LLC', 2006, 8400, 1, 'Premium', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into company values (company_id_seq.nextval, 'Very Large Company', 3007, 'Very Large Company, LLC', 2007, 74000, 1, 'Premium', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into company values (company_id_seq.nextval, 'Euro Data', 3007, 'European Data, LLC', 2009, 475, 1, 'Premium', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into company values (company_id_seq.nextval, 'North Of The Border Software', 3007, 'NOTBS, LLC', 2008, 5000, 1, 'Premium', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into company values (company_id_seq.nextval, 'Down Under Solutions', 3007, 'DUS Solutions, LLC', 2010, 75, 1, 'Lite', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into company values (company_id_seq.nextval, 'Wang Enterprises', 3007, 'Wang Enterprises, LLC', 2013, 8456, 1, 'Premium', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into company values (company_id_seq.nextval, 'Dubai Construction Company', 3007, 'Dubai Construction Company, LLC', 2012, 4129, 1, 'Premium', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
commit;

PROMPT Update LOCATION table with correct company_id values................................
update location l set l.company_id=(select c.company_id from company c where c.company_name like '%Sample Online%') where l.address1 like '%Willow%';
update location l set l.company_id=(select c.company_id from company c where c.company_name like '%Sample Telecom%') where l.address1 like '%Eldorado%';
update location l set l.company_id=(select c.company_id from company c where c.company_name like '%DTM%') where l.address1 like '%DTM%';
update location l set l.company_id=(select c.company_id from company c where c.company_name like '%Tiny%') where l.address1 like '%Tiny%';
update location l set l.company_id=(select c.company_id from company c where c.company_name like '%Small%') where l.address1 like '%Small%';
update location l set l.company_id=(select c.company_id from company c where c.company_name like '%Medium%') where l.address1 like '%Medium%';
update location l set l.company_id=(select c.company_id from company c where c.company_name like 'Large Company%') where l.address1 like '%Large Circle%';
update location l set l.company_id=(select c.company_id from company c where c.company_name like '%Very Large%') where l.address1 like '%Very Large Ave%';
update location l set l.company_id=(select c.company_id from company c where c.company_name like '%Euro%') where l.address1 like '%High Street%';
update location l set l.company_id=(select c.company_id from company c where c.company_name like '%North Of%') where l.address1 like '%Easy St%';
update location l set l.company_id=(select c.company_id from company c where c.company_name like '%Down Under%') where l.address1 like '%Wandaloo%';
update location l set l.company_id=(select c.company_id from company c where c.company_name like '%Wang%') where l.address1 like '%HAO%';
update location l set l.company_id=(select c.company_id from company c where c.company_name like '%Dubai%') where l.address1 like '%Park Place%';



PROMPT MM_INDUSTRY_COMPANY................................
--DD: need to hard-code IDs here since no sequence and values already generated elsewhere.
--be aware of this when throwing in more test data, later.
insert into mm_industry_company values (1000, 3000, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into mm_industry_company values (1001, 3000, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into mm_industry_company values (1000, 3001, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into mm_industry_company values (1002, 3001, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into mm_industry_company values (1003, 3002, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into mm_industry_company values (1005, 3003, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into mm_industry_company values (1018, 3004, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into mm_industry_company values (1007, 3005, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into mm_industry_company values (1008, 3006, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into mm_industry_company values (1016, 3007, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into mm_industry_company values (1003, 3008, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into mm_industry_company values (1003, 3009, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into mm_industry_company values (1010, 3010, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into mm_industry_company values (1021, 3011, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into mm_industry_company values (1006, 3012, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));



PROMPT DEPARTMENT................................
--IDs should start at 4000 in seq definition
insert into department values (dept_id_seq.nextval, 'CEO'      , 'Chief Executive Officer'          , 'CEO-top level', 3000, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'IT'       , 'Information Technology'           , 'IT'           , 3000, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'Marketing', 'Marketing Department'             , 'Marketing'    , 3000, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'HR'       , 'Human Resources'                  , 'HR'           , 3000, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));

insert into department values (dept_id_seq.nextval, 'CEO'      , 'Chief Executive Officer'          , 'CEO-top level', 3001, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'NOC'      , 'Network Operations Center'        , 'NOC'          , 3001, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'IOC'      , 'Infrastructure Operations Center' , 'IOC'          , 3001, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'Executive Team'      , 'Original co-founders' , 'Main Executive Team'          , 3002, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));

insert into department values (dept_id_seq.nextval, 'HR'       , 'Human Resources'                  , 'HR'           , 3003, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'HR'       , 'Human Resources'                  , 'HR'           , 3004, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'HR'       , 'Human Resources'                  , 'HR'           , 3005, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'HR'       , 'Human Resources'                  , 'HR'           , 3006, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'HR'       , 'Human Resources'                  , 'HR'           , 3007, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'HR'       , 'Human Resources'                  , 'HR'           , 3008, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'HR'       , 'Human Resources'                  , 'HR'           , 3009, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'HR'       , 'Human Resources'                  , 'HR'           , 3010, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'HR'       , 'Human Resources'                  , 'HR'           , 3011, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'HR'       , 'Human Resources'                  , 'HR'           , 3012, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));

insert into department values (dept_id_seq.nextval, 'IT'       , 'Information Technology'           , 'IT'           , 3003, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'IT'       , 'Information Technology'           , 'IT'           , 3004, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'IT'       , 'Information Technology'           , 'IT'           , 3005, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'IT'       , 'Information Technology'           , 'IT'           , 3006, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'IT'       , 'Information Technology'           , 'IT'           , 3007, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'IT'       , 'Information Technology'           , 'IT'           , 3008, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'IT'       , 'Information Technology'           , 'IT'           , 3009, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'IT'       , 'Information Technology'           , 'IT'           , 3010, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'IT'       , 'Information Technology'           , 'IT'           , 3011, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'IT'       , 'Information Technology'           , 'IT'           , 3012, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));

insert into department values (dept_id_seq.nextval, 'Sales'       , 'Sales Department'           , 'Sales'           , 3003, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'Sales'       , 'Sales Department'           , 'Sales'           , 3004, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'Sales'       , 'Sales Department'           , 'Sales'           , 3005, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'Sales'       , 'Sales Department'           , 'Sales'           , 3006, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'Sales'       , 'Sales Department'           , 'Sales'           , 3007, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'Sales'       , 'Sales Department'           , 'Sales'           , 3008, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'Sales'       , 'Sales Department'           , 'Sales'           , 3009, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'Sales'       , 'Sales Department'           , 'Sales'           , 3010, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'Sales'       , 'Sales Department'           , 'Sales'           , 3011, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'Sales'       , 'Sales Department'           , 'Sales'           , 3012, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));

insert into department values (dept_id_seq.nextval, 'Marketing'       , 'Marketing Department'           , 'Marketing'           , 3003, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'Marketing'       , 'Marketing Department'           , 'Marketing'           , 3004, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'Marketing'       , 'Marketing Department'           , 'Marketing'           , 3005, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'Marketing'       , 'Marketing Department'           , 'Marketing'           , 3006, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'Marketing'       , 'Marketing Department'           , 'Marketing'           , 3007, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'Marketing'       , 'Marketing Department'           , 'Marketing'           , 3008, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'Marketing'       , 'Marketing Department'           , 'Marketing'           , 3009, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'Marketing'       , 'Marketing Department'           , 'Marketing'           , 3010, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'Marketing'       , 'Marketing Department'           , 'Marketing'           , 3011, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'Marketing'       , 'Marketing Department'           , 'Marketing'           , 3012, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));

insert into department values (dept_id_seq.nextval, 'R&D'       , 'Research & Developement'           , 'R&D'           , 3005, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'Network'       , 'Network'           , 'Network'           , 3005, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'Security'       , 'Corporate Security'           , 'Security'           , 3005, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'Facilities'       , 'Facilities'           , 'Facilities'           , 3005, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'Operations'       , 'Company Operations'           , 'Operations'           , 3005, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'Data Science'       , 'Data Science Dept'           , 'Data Science'           , 3005, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into department values (dept_id_seq.nextval, 'AP'       , 'Accounts Payable'           , 'AP'           , 3005, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));



PROMPT PRIV................................
--IDs should start at 5000 in seq definition
insert into priv values (priv_id_seq.nextval, 1, 'Super User', 'Priv with highest access level', 5, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into priv values (priv_id_seq.nextval, 1, 'Reporter'  , 'Priv with lowest access level' , 1, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into priv values (priv_id_seq.nextval, 1, 'Mid-Level' , 'Priv with mid-level access'    , 3, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));


PROMPT EMPLOYEE................................
--IDs should start at 6000 in seq definition.   If you have your own dept (even if u have no one reporting to you yet) then that is your dept_id, otherwise you take on your boss's dept_it
--keep in mind the org structure is determined only by manager_id. Dept_id is just for organization
insert into employee values (emp_id_seq.nextval, ''    , 'Tom'  , 'T.', 'Smith'  , '', '', '', 'B34R9T6N', 'xyz@yahoo.com' , 3000, 4000, 'tom.smith@soc.com'   , '6505434800', 1  , 'Y', 2000, 2, 5000, 'pass', 'test', to_date('2012-07-01','YYYY-MM-DD'), to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mr.' , 'Rich' , 'M.', 'Davis'  , '', '', '', 'Z94R9T6W', 'ABC123'        , 3000, 4001, 'rich.davis@soc.com'  , '6505434800', 6000  , 'N', 2000, 2, 5001, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mr'  , 'Raul' , 'X.', 'Herrara', '', '', '', '5WZ45A21', ''              , 3000, 4001, 'raul.herrara@soc.com', '6505434800', 6000  , 'N', 2000, 2, 5002, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Sr.' , 'Jack' , 'D.', 'Scheidt' , '', '', '', 'B34XYZ6N', 'Capt Jack'     , 3000, 4001, 'jack.schidt@soc.com' , '6505434800', 6000, 'N', 2000, 2, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));

insert into employee values (emp_id_seq.nextval, ''    , 'Bubba' , '' , 'Gump'   , '', '', '', 'B74XTZ45', 'Tom'           , 3001, 4002, 'tom.hanks@stc.com'     , '7208881000', 1  , 'Y', 2001, 4, 5001, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));

insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Abdul' , '' , 'Ebadi'   , '', '', '', '8J34WAX1', 'Axe'           , 3002, 4007, 'abdul.ebadi@dtmdata.com'     , '7208415995', 1  , 'Y', 2002, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Dave' , '' , 'Durland'   , '', '', '', '34JRT54X', 'DD'           , 3002, 4007, 'dave.durland@dtmdata.com'     , '7202431037', 6005  , 'Y', 2002, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Naveen' , '' , 'Sirikonda'   , '', '', '', 'W1YA87BS', 'Nav'           , 3002, 4007, 'naveen.sirikonda@dtmdata.com'     , '4057082903', 6005  , 'Y', 2002, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Alex' , '' , 'Torres'   , '', '', '', 'CW21JO12', ''           , 3002, 4007, 'alex.torres@dtmdata.com'     , '6094449858', 6005  , 'Y', 2002, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));

insert into employee values (emp_id_seq.nextval, 'Mrs'    , 'Alecia' , '' , 'Cummings'   , '', '', '', 'W3J5S9UZ', ''           , 3003, 4008, 'alecia.cummings@tinycompany.com'     , '7201234567', 1  , 'Y', 2003, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Jerry' , '' , 'Noel'   , '', '', '', '123JFX78', ''           , 3003, 4018, 'jerry.noel@tinycompany.com'     , '7201234567', 6009  , 'Y', 2003, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Dino' , '' , 'Rogers'   , '', '', '', 'YJW8FX78', ''           , 3003, 4028, 'dino.rogers@tinycompany.com'     , '7201234567', 6009  , 'Y', 2003, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mr'    , 'John' , 'X.' , 'Smith'   , '', '', '', 'AZ87PJ12', ''           , 3003, 4038, 'john.x.smith@tinycompany.com'     , '7201234567', 6009  , 'Y', 2003, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mr'    , 'John' , '' , 'Smith'   , '', '', '', 'NBV786OW', ''           , 3003, 4008, 'john.smith@tinycompany.com'     , '7201234567', 6009  , 'Y', 2003, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mrs'    , 'Laura' , '' , 'Drew'   , '', '', '', 'LI76XC90', ''           , 3003, 4008, 'laura.drew@tinycompany.com'     , '7201234567', 6009  , 'Y', 2003, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Ms'    , 'Alyssa' , '' , 'Nguyn'   , '', '', '', 'UI4J12PV', ''           , 3003, 4008, 'alyssa.nguyn@tinycompany.com'     , '7201234567', 6009  , 'Y', 2003, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));

insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Reggie' , '' , 'Smith'   , '', '', '', 'NBV786UW', ''           , 3004, 4009, 'reggie.smith@smallcompany.com'     , '7201234567', 1  , 'Y', 2004, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mrs'    , 'Jan' , '' , 'Liu'   , '', '', '', 'LI96XC90', ''           , 3004, 4019, 'jan.liu@smallcompany.com'     , '7201234567', 6016  , 'Y', 2004, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Ms'    , 'Melissa' , '' , 'Knoll'   , '', '', '', 'XI4J12PV', ''           , 3004, 4029, 'melissa.knoll@smallcompany.com'     , '7201234567', 6016  , 'Y', 2004, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Yi' , '' , 'Wang'   , '', '', '', 'AI4J12PV', ''           , 3004, 4039, 'yi.wang@smallcompany.com'     , '7201234567', 6016  , 'Y', 2004, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Steve' , '' , 'Smith'   , '', '', '', 'YJ4J12PV', ''           , 3004, 4019, 'steve.smith@smallcompany.com'     , '7201234567', 6017  , 'Y', 2004, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Ms'    , 'Marrisa' , '' , 'Page'   , '', '', '', 'W94J12PV', ''           , 3004, 4019, 'marrisa.page@smallcompany.com'     , '7201234567', 6017  , 'Y', 2004, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Ms'    , 'Sonia' , '' , 'Hewet'   , '', '', '', 'Z94J12PV', ''           , 3004, 4019, 'sonia.hewet@smallcompany.com'     , '7201234567', 6017  , 'Y', 2004, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Jack' , '' , 'Trane'   , '', '', '', 'YZ8J12PV', ''           , 3004, 4029, 'jack.trane@smallcompany.com'     , '7201234567', 6018  , 'Y', 2004, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Ms'    , 'Jen' , '' , 'Proctor'   , '', '', '', 'LI4J12PV', ''           , 3004, 4029, 'jen.proctor@smallcompany.com'     , '7201234567', 6018  , 'Y', 2004, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Ty' , '' , 'English'   , '', '', '', 'SY4J12PV', ''           , 3004, 4029, 'ty.english@smallcompany.com'     , '7201234567', 6018  , 'Y', 2004, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Zak' , '' , 'Stevie'   , '', '', '', 'HH4J12PV', ''           , 3004, 4039, 'zak.stevie@smallcompany.com'     , '7201234567', 6019  , 'Y', 2004, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Ms'    , 'Laurinda' , '' , 'James'   , '', '', '', 'UI4J12PV', ''           , 3004, 4039, 'laurinda.james@smallcompany.com'     , '7201234567', 6019  , 'Y', 2004, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Mark' , '' , 'Bortko'   , '', '', '', '8I4J12PV', ''           , 3004, 4039, 'mark.bortko@smallcompany.com'     , '7201234567', 6019  , 'Y', 2004, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));

insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Jacob' , '' , 'Smith'   , '', '', '', 'GBV786UW', ''           , 3005, 4010, 'jacob.smith@mediumcompany.com'     , '7201234567', 1  , 'Y', 2005, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mrs'    , 'Michelle' , '' , 'Johnson'   , '', '', '', 'YI96XC90', ''     , 3005, 4020, 'michelle.johnson@mediumcompany.com'     , '7201234567', 6029  , 'Y', 2005, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Ms'    , 'Julia' , '' , 'Midler'   , '', '', '', 'HI4J12PV', ''           , 3005, 4030, 'julia.midler@mediumcompany.com'     , '7201234567', 6029  , 'Y', 2005, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mr'    , 'JR' , '' , 'Newberry'   , '', '', '', '894J12PV', ''           , 3005, 4040, 'jr.newberry@mediumcompany.com'     , '7201234567', 6029  , 'Y', 2005, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Alex' , '' , 'Riley'   , '', '', '', 'WZ4J12PV', ''           , 3005, 4048, 'alex.riley@mediumcompany.com'     , '7201234567', 6029  , 'Y', 2005, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Ms'    , 'Erin' , '' , 'Jankovich'   , '', '', '', 'GI4J12PV', ''           , 3005, 4049, 'erin.jankovich@mediumcompany.com'     , '7201234567', 6029  , 'Y', 2005, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Robert' , '' , 'House'   , '', '', '', 'NB4J12PV', ''           , 3005, 4020, 'robert.house@mediumcompany.com'     , '7201234567', 6030  , 'Y', 2005, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Nitin' , '' , 'Kumar'   , '', '', '', 'MN4J12PV', ''           , 3005, 4050, 'nitin.kumar@mediumcompany.com'     , '7201234567', 6030  , 'Y', 2005, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Bob' , '' , 'Argus'   , '', '', '', 'WY4J12PV', ''           , 3005, 4051, 'bob.argus@mediumcompany.com'     , '7201234567', 6030  , 'Y', 2005, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Ms'    , 'Lorissa' , '' , 'Wilder'   , '', '', '', 'WX4J12PV', ''           , 3005, 4030, 'lorissa.wilder@mediumcompany.com'     , '7201234567', 6031  , 'Y', 2005, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Malcom' , '' , 'Faried'   , '', '', '', '8U4J12PV', ''           , 3005, 4030, 'malcom.faried@mediumcompany.com'     , '7201234567', 6031  , 'Y', 2005, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Jim' , '' , 'Jones'   , '', '', '', 'HU4J12PV', ''           , 3005, 4052, 'jim.jones@mediumcompany.com'     , '7201234567', 6031  , 'Y', 2005, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mrs'    , 'Jean' , '' , 'Newcastle'   , '', '', '', 'AA4J12PV', ''           , 3005, 4040, 'jean.newcastle@mediumcompany.com'     , '7201234567', 6032  , 'Y', 2005, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Sean' , '' , 'Schafer'   , '', '', '', '9I4J12PV', ''           , 3005, 4040, 'sean.schafer@mediumcompany.com'     , '7201234567', 6032  , 'Y', 2005, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Jose' , '' , 'Lopez'   , '', '', '', 'HI3E12PV', ''           , 3005, 4040, 'jose.lopez@mediumcompany.com'     , '7201234567', 6032  , 'Y', 2005, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Jon' , '' , 'Ramirez'   , '', '', '', 'HI9J12PV', ''           , 3005, 4048, 'john.ramirez@mediumcompany.com'     , '7201234567', 6033  , 'Y', 2005, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Ms'    , 'Kayla' , '' , 'Hiler'   , '', '', '', 'NN4J12PV', ''           , 3005, 4048, 'kala.hiler@mediumcompany.com'     , '7201234567', 6033  , 'Y', 2005, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mr'    , 'James' , '' , 'Smith'   , '', '', '', 'WW4J12PV', ''           , 3005, 4048, 'james.smith@mediumcompany.com'     , '7201234567', 6033  , 'Y', 2005, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Aaron' , '' , 'Stewart'   , '', '', '', 'HI4N72PV', ''           , 3005, 4049, 'aaron.stewart@mediumcompany.com'     , '7201234567', 6034  , 'Y', 2005, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Ms'    , 'Tori' , '' , 'Snyder'   , '', '', '', 'JJ4J12PV', ''           , 3005, 4053, 'tori.snyder@mediumcompany.com'     , '7201234567', 6034  , 'Y', 2005, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Alexander' , '' , 'Richie'   , '', '', '', 'HI4J89PV', ''      , 3005, 4049, 'alexander.richie@mediumcompany.com'     , '7201234567', 6034  , 'Y', 2005, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Sonny' , '' , 'Alter'   , '', '', '', 'BB4J12PV', ''           , 3005, 4050, 'sonny.alter@mediumcompany.com'     , '7201234567', 6036  , 'Y', 2005, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Ms'    , 'Laura' , '' , 'Lawson'   , '', '', '', 'UY4J12PV', ''           , 3005, 4050, 'laura.lawson@mediumcompany.com'     , '7201234567', 6036  , 'Y', 2005, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Lewis' , '' , 'White'   , '', '', '', 'HI1J12PV', ''           , 3005, 4051, 'lewis.white@mediumcompany.com'     , '7201234567', 6037  , 'Y', 2005, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Larry' , '' , 'Dallas'   , '', '', '', 'MK4J12PV', ''           , 3005, 4051, 'larry.dallas@mediumcompany.com'     , '7201234567', 6037  , 'Y', 2005, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Ms'    , 'Toni' , '' , 'Sharp'   , '', '', '', 'HI4J12HI', ''           , 3005, 4052, 'toni.sharp@mediumcompany.com'     , '7201234567', 6040  , 'Y', 2005, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Jeff' , '' , 'Sigler'   , '', '', '', 'HIWJ12PV', ''           , 3005, 4052, 'jeff.sigler@mediumcompany.com'     , '7201234567', 6040  , 'Y', 2005, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Ms'    , 'Jerry' , '' , 'Anderson'   , '', '', '', 'HI4J87PV', ''        , 3005, 4054, 'jerry.anderson@mediumcompany.com'     , '7201234567', 6048  , 'Y', 2005, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Eric' , '' , 'Cox'   , '', '', '', 'HIJ712PV', ''           , 3005, 4053, 'eric.cox@mediumcompany.com'     , '7201234567', 6048  , 'Y', 2005, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Ms'    , 'Lexi' , '' , 'Schroeder'   , '', '', '', 'ZZ4J198V', ''           , 3005, 4010, 'lexi.schroeder@mediumcompany.com'     , '7201234567', 6029  , 'Y', 2005, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Ms'    , 'Bobi' , '' , 'Arons'   , '', '', '', 'ZZ4J198V', ''           , 3005, 4054, 'bobi.arons@mediumcompany.com'     , '7201234567', 6056  , 'Y', 2005, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));

insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Xiu' , '' , 'Li'   , '', '', '', 'ZZV786UW', ''           , 3006, 4011, 'xiu.li@largecompany.com'     , '7201234567', 1  , 'Y', 2006, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mrs'    , 'Michelle' , '' , 'Johnson'   , '', '', '', 'YI96XC90', ''           , 3006, 4021, 'michelle.johnson@largecompany.com'     , '7201234567', 6060  , 'Y', 2006, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Ms'    , 'Nancy' , '' , 'Zeitler'   , '', '', '', 'AI4J12PV', ''           , 3006, 4031, 'nancy.zeitler@largecompany.com'     , '7201234567', 6060  , 'Y', 2006, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));

insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Joe' , '' , 'Gary'   , '', '', '', 'BI4J12PV', ''           , 3007, 4032, 'joe.gary@verylargecompany.com'     , '7201234567', 1  , 'Y', 2007, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Steven' , '' , 'Smith'   , '', '', '', 'BIBJ12PV', ''           , 3007, 4022, 'steven.smith@verylargecompany.com'     , '7201234567', 6063  , 'Y', 2007, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mrs'    , 'Sara' , '' , 'Anan'   , '', '', '', 'BI4J12ZZ', ''           , 3007, 4012, 'sara.anan@verylargecompany.com'     , '7201234567', 6063  , 'Y', 2007, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));

insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Hans' , '' , 'Gretchen'   , '', '', '', '254J12ZZ', ''           , 3008, 4013, 'hans.gretchen@eurodata.com'     , '7201234567', 1  , 'Y', 2009, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Ian' , '' , 'Hughes'   , '', '', '', '784J12ZZ', ''           , 3008, 4023, 'ian.hughes@eurodata.com'     , '7201234567', 6066  , 'Y', 2009, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mrs'    , 'Tatyana' , '' , 'Ivensky'   , '', '', '', 'JW4J12ZZ', ''           , 3008, 4033, 'tatyana.ivensky@eurodata.com'     , '7201234567', 6066  , 'Y', 2009, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));

insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Patrick' , '' , 'Rey'   , '', '', '', 'XZ2J12ZZ', ''           , 3009, 4034, 'patrick.rey@notbs.com'     , '7201234567', 1  , 'Y', 2008, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Van' , '' , 'McCray'   , '', '', '', 'AB2J12ZZ', ''           , 3009, 4024, 'van.mccray@notbs.com'     , '7201234567', 6069  , 'Y', 2008, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mrs'    , 'Joey' , '' , 'Rice'   , '', '', '', 'AM2J12ZZ', ''           , 3009, 4014, 'joey.rice@notbs.com'     , '7201234567', 6069  , 'Y', 2008, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));

insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Jim' , '' , 'Rooks'   , '', '', '', 'AM2J12HG', ''           , 3010, 4015, 'jim.rooks@dus.com'     , '7201234567', 1  , 'Y', 2010, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mrs'    , 'Ginger' , '' , 'Robs'   , '', '', '', 'AM2J12YT', ''           , 3010, 4025, 'ginger.robs@dus.com'     , '7201234567', 6072  , 'Y', 2010, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Red' , '' , 'Barrow'   , '', '', '', 'AM2J1221', ''           , 3010, 4035, 'red.barrow@dus.com'     , '7201234567', 6072  , 'Y', 2010, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));

insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Yi' , '' , 'Xing'   , '', '', '', 'YHG79ZWW', ''           , 3011, 4016, 'yi.xing@wang.com'     , '7201234567', 1  , 'Y', 2013, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Yang' , '' , 'Zhou'   , '', '', '', 'JJG79ZWW', ''           , 3011, 4026, 'yang.zhou@wang.com'     , '7201234567', 6075  , 'Y', 2013, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mrs'    , 'Lucy' , '' , 'Yang'   , '', '', '', 'ZHG79ZWW', ''           , 3011, 4036, 'lucy.yang@wang.com'     , '7201234567', 6075  , 'Y', 2013, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));

insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Ahmad' , '' , 'Khan'   , '', '', '', 'VBG79ZWW', ''           , 3012, 4037, 'ahmad.khan@dcc.com'     , '7201234567', 1  , 'Y', 2012, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Nasir' , '' , 'Mohammad'   , '', '', '', 'ZBG79ZWW', ''           , 3012, 4027, 'nasir.mohammad@dcc.com'     , '7201234567', 6078  , 'Y', 2012, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into employee values (emp_id_seq.nextval, 'Mr'    , 'Asif' , '' , 'Hotaki'   , '', '', '', 'ZBG79ZWW', ''           , 3012, 4017, 'asif.hotaki@dcc.com'     , '7201234567', 6078  , 'Y', 2012, 1, 5000, 'pass', 'test', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));


PROMPT EVENT_CATEGORY................................
--IDs should start at 11000 in seq definition
insert into event_category values (event_category_id_seq.nextval, 3000, 'Corporate', 'Tracking company events related to corporate', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into event_category values (event_category_id_seq.nextval, 3000, 'Acquisiton', 'Tracking company events related to buyout of company xyz', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into event_category values (event_category_id_seq.nextval, 3001, 'Corporate', 'Tracking company events related to corporate', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into event_category values (event_category_id_seq.nextval, 3001, 'Stock Split', 'Tracking company events related to our stock split', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into event_category values (event_category_id_seq.nextval, 3002, 'Corporate', 'Tracking company events related to corporate', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into event_category values (event_category_id_seq.nextval, 3002, 'New HQ', 'Tracking company events related to new corporate headquarters', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into event_category values (event_category_id_seq.nextval, 3003, 'Corporate', 'Tracking company events related to corporate', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into event_category values (event_category_id_seq.nextval, 3004, 'Corporate', 'Tracking company events related to corporate', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into event_category values (event_category_id_seq.nextval, 3005, 'Corporate', 'Tracking company events related to corporate', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into event_category values (event_category_id_seq.nextval, 3005, 'Layoff', 'Tracking company events related to the layoff', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into event_category values (event_category_id_seq.nextval, 3005, 'Project 2020', 'Tracking company events related to our major project 2020', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into event_category values (event_category_id_seq.nextval, 3007, 'Corporate', 'Tracking company events related to corporate', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into event_category values (event_category_id_seq.nextval, 3008, 'Corporate', 'Tracking company events related to corporate', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into event_category values (event_category_id_seq.nextval, 3009, 'Corporate', 'Tracking company events related to corporate', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into event_category values (event_category_id_seq.nextval, 3010, 'Corporate', 'Tracking company events related to corporate', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into event_category values (event_category_id_seq.nextval, 3011, 'Corporate', 'Tracking company events related to corporate', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into event_category values (event_category_id_seq.nextval, 3012, 'Corporate', 'Tracking company events related to corporate', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));

PROMPT EVENT................................
--IDs should start at 7000 in seq definition
insert into event values (event_id_seq.nextval, 'Bought PB'   , 'Day FB signed agreement to purchase PB', 11001  , to_date('11-01-2014', 'MM-DD-YYYY'), 3000, 4001, 'public', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into event values (event_id_seq.nextval, 'Hired CIO'   , 'Hired new CIO'                         , 11000 , to_date('08-11-2014', 'MM-DD-YYYY'), 3000, 4002, 'private', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into event values (event_id_seq.nextval, 'Fired CIO'   , 'Fired our CIO'                         , 11000 , to_date('03-18-2014', 'MM-DD-YYYY'), 3000, 4003, 'private', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into event values (event_id_seq.nextval, 'Stock price' , 'Day stock first broke $50'             , 11002  , to_date('11-01-2014', 'MM-DD-YYYY'), 3001, 4005, 'private', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into event values (event_id_seq.nextval, 'Started Company' , 'First Day DTM Data was formed!'             , 11004  , to_date('11-23-2014', 'MM-DD-YYYY'), 3002, 4007, 'public', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into event values (event_id_seq.nextval, 'New HR head' , 'First new HR head started.'             , 11006  , to_date('09-20-2014', 'MM-DD-YYYY'), 3003, 4018, 'private', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into event values (event_id_seq.nextval, 'Fired VP' , 'VP of operations gone'             , 11007  , to_date('03-11-2014', 'MM-DD-YYYY'), 3004, 4029, 'private', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into event values (event_id_seq.nextval, 'Sold' , 'Sold our company to company XYZ'             , 11008  , to_date('05-27-2014', 'MM-DD-YYYY'), 3005, 4048, 'private', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into event values (event_id_seq.nextval, 'Layoff' , 'Company layoff - impacted 23'             , 11009  , to_date('07-11-2014', 'MM-DD-YYYY'), 3005, 4048, 'private', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into event values (event_id_seq.nextval, 'Project 2020 Kickoff' , 'Start of our main company project!'             , 11010  , to_date('03-11-2014', 'MM-DD-YYYY'), 3005, 4048, 'private', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into event values (event_id_seq.nextval, 'Corporate Realignment' , 'Realigned 8 executives under Jones'             , 11008  , to_date('06-09-2014', 'MM-DD-YYYY'), 3005, 4048, 'private', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into event values (event_id_seq.nextval, 'Recognition System Overhaul' , 'Announced overhaul of our employee recognition system', 11011, to_date('09-25-2014', 'MM-DD-YYYY'), 3007, 4022, 'private', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into event values (event_id_seq.nextval, 'New Performance Review Tool' , 'Started using new XYZ performance review tool', 11012, to_date('02-11-2014', 'MM-DD-YYYY'), 3008, 4023, 'public', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into event values (event_id_seq.nextval, 'Reduced Bonuses' , 'Reduced bonus for entire company fromm 10% to 5%', 11013, to_date('02-26-2014', 'MM-DD-YYYY'), 3009, 4024, 'private', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into event values (event_id_seq.nextval, 'Massive Hiring' , 'Big hiring announced due to prduct XYZ taking off', 11014, to_date('04-11-2014', 'MM-DD-YYYY'), 3010, 4025, 'private', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into event values (event_id_seq.nextval, 'Opened Rec Center' , 'First day onsite rec center opened up', 11015, to_date('10-07-2014', 'MM-DD-YYYY'), 3011, 4016, 'public', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into event values (event_id_seq.nextval, 'Cafeteria Food Changed' , 'Added a totally new Italian section', 11016, to_date('12-08-2014', 'MM-DD-YYYY'), 3012, 4017, 'private', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));


PROMPT QUESTION_CATEGORY................................
--IDs should start at 8000 in seq definition
insert into question_category values (category_id_seq.nextval, 3000, 'HR'        , 'HR type questions'        , sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_category values (category_id_seq.nextval, 3000, 'Company'   , 'Company type questions'   , sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_category values (category_id_seq.nextval, 3000, 'Cafeteria' , 'Cafeteria type questions' , sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_category values (category_id_seq.nextval, 3000, 'Workplace' , 'Workplace type questions' , sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_category values (category_id_seq.nextval, 3001, 'Workplace' , 'Workplace type questions' , sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_category values (category_id_seq.nextval, 3002, 'Team Dynamic' , 'Startup Teams Inter-workings' , sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_category values (category_id_seq.nextval, 3003, 'Overall Company' , 'Things going on at company level' , sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_category values (category_id_seq.nextval, 3004, 'Efficiency' , 'Suggestions for making things more efficient' , sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_category values (category_id_seq.nextval, 3005, 'Overall Company' , 'Improvements to our company' , sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_category values (category_id_seq.nextval, 3006, 'Rec Center' , 'Onsite recreation center' , sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_category values (category_id_seq.nextval, 3007, 'Bonus Program' , 'Employee bonus program' , sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_category values (category_id_seq.nextval, 3008, 'Flexible Work Schedule' , 'Questions regarding flexible work schedule' , sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_category values (category_id_seq.nextval, 3009, 'Company XYZ Buyout' , 'Issues related to buyout of company XYZ' , sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_category values (category_id_seq.nextval, 3010, 'Offices' , 'Issues related to office re-configuration for employees' , sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_category values (category_id_seq.nextval, 3011, 'Management' , 'Things related to managers/directors/VPs/etc' , sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_category values (category_id_seq.nextval, 3012, 'Improvement Suggestions' , 'Ideas for improving things in your dept/company' , sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));

--add "Attrition" question_category for all companies so we can run attrition report... by axe 2/22/15
insert into question_category values (category_id_seq.nextval, 3000, 'Attrition' , 'Team attrition/retention' , sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_category values (category_id_seq.nextval, 3001, 'Attrition' , 'Team attrition/retention' , sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_category values (category_id_seq.nextval, 3002, 'Attrition' , 'Team attrition/retention' , sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_category values (category_id_seq.nextval, 3003, 'Attrition' , 'Team attrition/retention' , sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_category values (category_id_seq.nextval, 3004, 'Attrition' , 'Team attrition/retention' , sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_category values (category_id_seq.nextval, 3005, 'Attrition' , 'Team attrition/retention' , sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_category values (category_id_seq.nextval, 3006, 'Attrition' , 'Team attrition/retention' , sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_category values (category_id_seq.nextval, 3007, 'Attrition' , 'Team attrition/retention' , sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_category values (category_id_seq.nextval, 3008, 'Attrition' , 'Team attrition/retention' , sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_category values (category_id_seq.nextval, 3009, 'Attrition' , 'Team attrition/retention' , sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_category values (category_id_seq.nextval, 3010, 'Attrition' , 'Team attrition/retention' , sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_category values (category_id_seq.nextval, 3011, 'Attrition' , 'Team attrition/retention' , sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_category values (category_id_seq.nextval, 3012, 'Attrition' , 'Team attrition/retention' , sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));

PROMPT QUESTION_TYPE................................
--IDs should start at 12000 in seq definition
insert into question_type values (question_type_id_seq.nextval, 'YN', 'Yes/No question', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_type values (question_type_id_seq.nextval, 'Free Text', 'Free text answers attached to these questions', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_type values (question_type_id_seq.nextval, 'Rating', 'Question that requires rating in answer', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));

PROMPT QUESTION_SOURCE................................
--IDs should start at 13000 in seq definition
insert into question_source values (question_source_id_seq.nextval, 'Standard', 'Standard question provided by DTM Data', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_source values (question_source_id_seq.nextval, 'Custom', 'Custom question created by customer', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));

PROMPT QUESTION................................
--IDs should start at 9000 in seq definition
--start of sample online company questions:
insert into question values (question_id_seq.nextval, 3000, 4001, 'How likely are you to leave the company after the upcoming bonus payout?' , 8016, 12002, 13001, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3000, 4000, 'How is life at your Company today?'                                       , 8001, 12002, 13001, 1, 10, 3, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3000, 4002, 'Rate your happiness at your company?'                                         , 8016, 12002, 13001, 1, 10, 6, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3000, 4001, 'How is the food at the cafeteria?'                                        , 8002, 12002, 13001, 1, 10, 1, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3000, 4001, 'How is your workplace environment?'                                       , 8003, 12002, 13001, 1, 10, 1, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));


--start of dtmdata questions
insert into question values (question_id_seq.nextval, 3002, 4007, 'How is team doing in your opinion?'                                       , 8018, 12002, 13001, 1, 10, 6, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3002, 4007, 'Any major suggestions you have to make things better now?'                                       , 8018, 12002, 13001, 1, 10, 8, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3002, 4007, 'What is your confidence level in our future success?'                                       , 8005, 12002, 13001, 1, 10, 9, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3002, 4007, 'How do you feel about the # of hours you are putting in?'                                       , 8005, 12002, 13001, 1, 10, 7, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3002, 4007, 'Rate the impact of John Smith being let go?'                                       , 8005, 12002, 13001, 1, 10, 4, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3002, 4007, 'What do you feel is the next important milestone for our company?'                                       , 8005, 12002, 13001, 1, 10, 3, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3002, 4007, 'Do you feel weekly team meeting is good?'                                       , 8005, 12002, 13001, 1, 10, 5, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3002, 4007, 'Do you think we should pursue VC or do Bootstrap?'                                       , 8005, 12002, 13001, 1, 10, 4, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3002, 4007, 'What is your rating of the CEO?'                                       , 8005, 12002, 13001, 1, 10, 7, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3002, 4007, 'List one thing that you would recommend to make things more efficient?', 8005, 12002, 13001, 1, 10, 9, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));

--start of tinycompany questions
insert into question values (question_id_seq.nextval, 3003, 4008, 'How are things?'                                       , 8019, 12002, 13001, 1, 10, 6, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3003, 4018, 'Do you have any suggestions for improvment?'                                       , 8006, 12002, 13001, 1, 10, 8, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3003, 4028, 'Rate your future with our company?'                                       , 8019, 12002, 13001, 1, 10, 9, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3003, 4038, 'You feel overworked?'                                       , 8019, 12002, 13001, 1, 10, 7, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3003, 4008, 'Rate the impact of Charlie Stewart being let go?'                                       , 8006, 12002, 13001, 1, 10, 4, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3003, 4018, 'What is the biggest upcoming goal for the company?'                                       , 8006, 12002, 13001, 1, 10, 3, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3003, 4028, 'Do you feel a monthly All Hands meeting is enough?'                                       , 8006, 12002, 13001, 1, 10, 5, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3003, 4038, 'What do you think the best thing to wo with company now?'                                       , 8006, 12002, 13001, 1, 10, 4, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3003, 4008, 'What is your rating of the CTO?'                                       , 8006, 12002, 13001, 1, 10, 7, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3003, 4018, 'List your #1 efficiency idea for our company?'                                       , 8006, 12002, 13001, 1, 10, 9, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));

--start of smallcompany questions
insert into question values (question_id_seq.nextval, 3004, 4009, 'How are things in your immediate team?'                                       , 8007, 12002, 13001, 1, 10, 6, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3004, 4019, 'Any suggestions right now?'                                       , 8007, 12002, 13001, 1, 10, 8, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3004, 4029, 'How confident are you about our future?'                                       , 8020, 12002, 13001, 1, 10, 9, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3004, 4039, 'How is your work/life balance right now?'                                       , 8020, 12002, 13001, 1, 10, 7, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3004, 4009, 'Rate the impact of Michelle Jones being let go?'                                       , 8007, 12002, 13001, 1, 10, 4, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3004, 4019, 'What do you feel is the next important goal for our company?'                                       , 8007, 12002, 13001, 1, 10, 3, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3004, 4029, 'Do you feel monthly team meeting is good?'                                       , 8007, 12002, 13001, 1, 10, 5, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3004, 4039, 'Best thing to do with company going forward?'                                       , 8007, 12002, 13001, 1, 10, 4, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3004, 4009, 'What is your rating of your VP?'                                       , 8007, 12002, 13001, 1, 10, 7, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3004, 4019, 'How do you make your department more efficient?'                                       , 8007, 12002, 13001, 1, 10, 9, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));

--start of mediumcompany questions
insert into question values (question_id_seq.nextval, 3005, 4010, 'How are things in your department now?'                                       , 8008, 12002, 13001, 1, 10, 6, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3005, 4020, 'Any improvement suggestions?'                                       , 8008, 12002, 13001, 1, 10, 8, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3005, 4030, 'How do you feel about future at this company?'                                       , 8021, 12002, 13001, 1, 10, 9, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3005, 4040, 'Do you feel like you are putting enough or too many hours?'                                       , 8008, 12002, 13001, 1, 10, 7, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3005, 4048, 'Rate the impact of Steve Rogers being let go?'                                       , 8008, 12002, 13001, 1, 10, 4, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3005, 4049, 'Any big upcoming events/milestones?'                                       , 8008, 12002, 13001, 1, 10, 3, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3005, 4050, 'Do you feel meeting frequency is OK?'                                       , 8008, 12002, 13001, 1, 10, 5, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3005, 4051, 'What should we do with the company?'                                       , 8008, 12002, 13001, 1, 10, 4, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3005, 4052, 'What is your rating of the CFO?'                                       , 8008, 12002, 13001, 1, 10, 7, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3005, 4053, 'List the #1 thing on your mind related to work?'                                       , 8008, 12002, 13001, 1, 10, 9, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3005, 4054, 'Would you recommend this place to a friend to work?'                                       , 8021, 12002, 13001, 1, 10, 9, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));

--start of largecompany questions
insert into question values (question_id_seq.nextval, 3006, 4011, 'Are you looking to leave the company in the next 6 months?'                                       , 8022, 12002, 13001, 1, 10, 7, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3006, 4021, 'How would you rate your immediate manager?'                                       , 8009, 12002, 13001, 1, 10, 9, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3006, 4031, 'If you could change one thing in the company what would that be?'                                       , 8009, 12002, 13001, 1, 10, 9, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));

--start of verylargecompany questions
insert into question values (question_id_seq.nextval, 3007, 4012, 'Are you looking to leave the company in the next 6 months?'                                       , 8023, 12002, 13001, 1, 10, 7, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3007, 4022, 'How would you rate your immediate manager?'                                       , 8010, 12002, 13001, 1, 10, 9, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3007, 4032, 'If you could change one thing in the company what would that be?'                                       , 8010, 12002, 13001, 1, 10, 9, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));

--start of eurodata questions
insert into question values (question_id_seq.nextval, 3008, 4013, 'Are you looking to leave the company in the next 6 months?'                                       , 8024, 12002, 13001, 1, 10, 7, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3008, 4023, 'How would you rate your immediate manager?'                                       , 8011, 12002, 13001, 1, 10, 9, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3008, 4033, 'If you could change one thing in the company what would that be?'                                       , 8011, 12002, 13001, 1, 10, 9, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));

--start of northofthebordersoftware questions
insert into question values (question_id_seq.nextval, 3009, 4014, 'Are you looking to leave the company in the next 6 months?'                                       , 8025, 12002, 13001, 1, 10, 7, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3009, 4024, 'How would you rate your immediate manager?'                                       , 8012, 12002, 13001, 1, 10, 9, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3009, 4034, 'If you could change one thing in the company what would that be?'                                       , 8012, 12002, 13001, 1, 10, 9, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));

--start of downundersolutions questions
insert into question values (question_id_seq.nextval, 3010, 4015, 'Are you looking to leave the company in the next 6 months?'                                       , 8026, 12002, 13001, 1, 10, 7, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3010, 4025, 'How would you rate your immediate manager?'                                       , 8013, 12002, 13001, 1, 10, 9, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3010, 4035, 'If you could change one thing in the company what would that be?'                                       , 8013, 12002, 13001, 1, 10, 9, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));

--start of wangenterprises questions
insert into question values (question_id_seq.nextval, 3011, 4016, 'Are you looking to leave the company in the next 6 months?'                                       , 8027, 12002, 13001, 1, 10, 7, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3011, 4026, 'How would you rate your immediate manager?'                                       , 8014, 12002, 13001, 1, 10, 9, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3011, 4036, 'If you could change one thing in the company what would that be?'                                       , 8014, 12002, 13001, 1, 10, 9, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));

--start of dubaiconstructioncompany questions
insert into question values (question_id_seq.nextval, 3012, 4017, 'Are you looking to leave the company in the next 6 months?'                                       , 8028, 12002, 13001, 1, 10, 7, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3012, 4027, 'How would you rate your immediate manager?'                                       , 8015, 12002, 13001, 1, 10, 9, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3012, 4037, 'If you could change one thing in the company what would that be?'                                       , 8015, 12002, 13001, 1, 10, 9, sysdate-3*365, to_date('12-31-9999', 'MM-DD-YYYY'));

--couple of extra questions added so doesn't mess up order of question_id...ie if we don't put these at end foreign key constraints will fail
insert into question values (question_id_seq.nextval, 3000, 4001, 'WHAT FREE TEXT WOULD YOU LIKE TO ENTER?' , 80, 12001, 13001, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3002, 4001, 'WHAT FREE TEXT WOULD YOU LIKE TO ENTER?' , 82, 12001, 13001, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));




--insert standard dtm data questions  added by axe 5/4/2015
-- insert into question_category first
insert into question_category values (80, 3000, 'Generic Question Category', 'Generic question category for pre-defined questions users will see in PulseBox', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_category values (81, 3001, 'Generic Question Category', 'Generic question category for pre-defined questions users will see in PulseBox', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_category values (82, 3002, 'Generic Question Category', 'Generic question category for pre-defined questions users will see in PulseBox', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_category values (83, 3003, 'Generic Question Category', 'Generic question category for pre-defined questions users will see in PulseBox', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_category values (84, 3004, 'Generic Question Category', 'Generic question category for pre-defined questions users will see in PulseBox', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_category values (85, 3005, 'Generic Question Category', 'Generic question category for pre-defined questions users will see in PulseBox', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_category values (86, 3006, 'Generic Question Category', 'Generic question category for pre-defined questions users will see in PulseBox', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_category values (87, 3007, 'Generic Question Category', 'Generic question category for pre-defined questions users will see in PulseBox', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_category values (88, 3008, 'Generic Question Category', 'Generic question category for pre-defined questions users will see in PulseBox', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_category values (89, 3009, 'Generic Question Category', 'Generic question category for pre-defined questions users will see in PulseBox', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_category values (90, 3010, 'Generic Question Category', 'Generic question category for pre-defined questions users will see in PulseBox', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_category values (91, 3011, 'Generic Question Category', 'Generic question category for pre-defined questions users will see in PulseBox', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question_category values (92, 3012, 'Generic Question Category', 'Generic question category for pre-defined questions users will see in PulseBox', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));

-- now insert the 10 questions for company_id 3000
insert into question values (question_id_seq.nextval, 3000, 4000, 'How are you feeling right now about the company?' , 80, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3000, 4000, 'How are you feeling right now about your department?' , 80, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3000, 4000, 'How are you feeling about your manager?' , 80, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3000, 4000, 'Are you currently considering leaving the company?' , 80, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3000, 4000, 'Do you currently have something valuable on your mind that management should be aware of?' , 80, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3000, 4000, 'Do you feel the company is going in the right direction?' , 80, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3000, 4000, 'Do you feel your department is going in the right direction?' , 80, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3000, 4000, 'Do you feel your voice is being heard by the right people in the company?' , 80, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3000, 4000, 'How likely are you to leave the company after the bonus payout in 2 weeks?' , 80, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3000, 4000, 'Do you feel the number of hours you are working is ok?' , 80, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));

-- now insert the 10 questions for company_id 3001
insert into question values (question_id_seq.nextval, 3001, 4004, 'How are you feeling right now about the company?' , 81, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3001, 4004, 'How are you feeling right now about your department?' , 81, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3001, 4004, 'How are you feeling about your manager?' , 81, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3001, 4004, 'Are you currently considering leaving the company?' , 81, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3001, 4004, 'Do you currently have something valuable on your mind that management should be aware of?' , 81, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3001, 4004, 'Do you feel the company is going in the right direction?' , 81, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3001, 4004, 'Do you feel your department is going in the right direction?' , 81, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3001, 4004, 'Do you feel your voice is being heard by the right people in the company?' , 81, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3001, 4004, 'How likely are you to leave the company after the bonus payout in 2 weeks?' , 81, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3001, 4004, 'Do you feel the number of hours you are working is ok?' , 81, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));

-- now insert the 10 questions for company_id 3002
insert into question values (question_id_seq.nextval, 3002, 4007, 'How are you feeling right now about the company?' , 82, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3002, 4007, 'How are you feeling right now about your department?' , 82, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3002, 4007, 'How are you feeling about your manager?' , 82, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3002, 4007, 'Are you currently considering leaving the company?' , 82, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3002, 4007, 'Do you currently have something valuable on your mind that management should be aware of?' , 82, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3002, 4007, 'Do you feel the company is going in the right direction?' , 82, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3002, 4007, 'Do you feel your department is going in the right direction?' , 82, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3002, 4007, 'Do you feel your voice is being heard by the right people in the company?' , 82, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3002, 4007, 'How likely are you to leave the company after the bonus payout in 2 weeks?' , 82, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3002, 4007, 'Do you feel the number of hours you are working is ok?' , 82, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));

-- now insert the 10 questions for company_id 3003
insert into question values (question_id_seq.nextval, 3003, 4008, 'How are you feeling right now about the company?' , 83, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3003, 4008, 'How are you feeling right now about your department?' , 83, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3003, 4008, 'How are you feeling about your manager?' , 83, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3003, 4008, 'Are you currently considering leaving the company?' , 83, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3003, 4008, 'Do you currently have something valuable on your mind that management should be aware of?' , 83, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3003, 4008, 'Do you feel the company is going in the right direction?' , 83, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3003, 4008, 'Do you feel your department is going in the right direction?' , 83, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3003, 4008, 'Do you feel your voice is being heard by the right people in the company?' , 83, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3003, 4008, 'How likely are you to leave the company after the bonus payout in 2 weeks?' , 83, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3003, 4008, 'Do you feel the number of hours you are working is ok?' , 83, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));

-- now insert the 10 questions for company_id 3004
insert into question values (question_id_seq.nextval, 3004, 4009, 'How are you feeling right now about the company?' , 84, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3004, 4009, 'How are you feeling right now about your department?' , 84, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3004, 4009, 'How are you feeling about your manager?' , 84, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3004, 4009, 'Are you currently considering leaving the company?' , 84, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3004, 4009, 'Do you currently have something valuable on your mind that management should be aware of?' , 84, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3004, 4009, 'Do you feel the company is going in the right direction?' , 84, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3004, 4009, 'Do you feel your department is going in the right direction?' , 84, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3004, 4009, 'Do you feel your voice is being heard by the right people in the company?' , 84, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3004, 4009, 'How likely are you to leave the company after the bonus payout in 2 weeks?' , 84, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3004, 4009, 'Do you feel the number of hours you are working is ok?' , 84, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));

-- now insert the 10 questions for company_id 3005
insert into question values (question_id_seq.nextval, 3005, 4010, 'How are you feeling right now about the company?' , 85, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3005, 4010, 'How are you feeling right now about your department?' , 85, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3005, 4010, 'How are you feeling about your manager?' , 85, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3005, 4010, 'Are you currently considering leaving the company?' , 85, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3005, 4010, 'Do you currently have something valuable on your mind that management should be aware of?' , 85, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3005, 4010, 'Do you feel the company is going in the right direction?' , 85, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3005, 4010, 'Do you feel your department is going in the right direction?' , 85, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3005, 4010, 'Do you feel your voice is being heard by the right people in the company?' , 85, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3005, 4010, 'How likely are you to leave the company after the bonus payout in 2 weeks?' , 85, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into question values (question_id_seq.nextval, 3005, 4010, 'Do you feel the number of hours you are working is ok?' , 85, 12002, 13000, 1, 10, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));


PROMPT ANSWER................................
--IDs should start at 10000 in seq definition
--start of sample online company answers
insert into answer values (answer_id_seq.nextval, 9002, 'If the food was not free I would not eat it!'              , to_date('07-04-2012', 'MM-DD-YYYY'), 6001,  3000, 2, 8, 8, to_date('07-04-2012', 'MM-DD-YYYY'), to_date('12-31-9999', 'MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9002, 'Food is much better than my old place.'              , to_date('07-04-2012', 'MM-DD-YYYY'), 6001,  3000, 7, 5, 5, to_date('07-04-2012', 'MM-DD-YYYY'), to_date('12-31-9999', 'MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9002, 'Food sucks big time here!'              , to_date('07-04-2012', 'MM-DD-YYYY'), 6002,  3000, 1, 7, 7, to_date('07-04-2012', 'MM-DD-YYYY'), to_date('12-31-9999', 'MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9003, 'The noise level of other employees is nice on wknds'       , to_date('07-08-2012', 'MM-DD-YYYY'), 6003,  3000, 9, 8, 8, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9003, 'The noise level of other employees is very distracting.'   , to_date('07-09-2012', 'MM-DD-YYYY'), 6003,  3000, 2, 8, 8, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9003, 'The noise level of other employees is very distracting.'   , to_date('07-10-2012', 'MM-DD-YYYY'), 6002,  3000, 2, 8, 8, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9003, 'The noise level of other employees is very distracting.'   , to_date('07-11-2012', 'MM-DD-YYYY'), 6003,  3000, 1, 8, 8, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9003, 'The noise level of other employees is very distracting.'   , to_date('07-12-2012', 'MM-DD-YYYY'), 6003,  3000, 2, 8, 8, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9003, 'The noise level of other employees is very distracting.'   , to_date('07-13-2012', 'MM-DD-YYYY'), 6003,  3000, 6, 8, 8, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9003, 'The noise level of other employees is nice on wknds.'      , to_date('07-14-2012', 'MM-DD-YYYY'), 6003,  3000, 8, 8, 8, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9003, 'The noise level of other employees is nice on wknds.'      , to_date('07-15-2012', 'MM-DD-YYYY'), 6003,  3000, 9, 8, 8, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9003, 'The noise level of other employees is very distracting.'   , to_date('07-16-2012', 'MM-DD-YYYY'), 6003,  3000, 2, 8, 8, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9003, 'The noise level of other employees is very distracting.'   , to_date('07-17-2012', 'MM-DD-YYYY'), 6003,  3000, 2, 8, 8, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9003, 'The noise level of other employees is very distracting.'   , to_date('07-18-2012', 'MM-DD-YYYY'), 6003,  3000, 2, 8, 8, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9003, 'The noise level of other employees is very distracting.'   , to_date('07-19-2012', 'MM-DD-YYYY'), 6003,  3000, 2, 8, 8, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9003, 'The noise level of other employees is very distracting.'   , to_date('07-20-2012', 'MM-DD-YYYY'), 6003,  3000, 2, 8, 8, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9003, 'The noise level of other employees is usually good on wknd', to_date('07-21-2012', 'MM-DD-YYYY'), 6003,  3000, 9, 8, 8, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9003, 'The noise level of other employees is nice on wknds.'      , to_date('07-22-2012', 'MM-DD-YYYY'), 6003,  3000, 10, 8, 8, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9003, 'The noise level of other employees is nice on wknds.'      , to_date('07-22-2012', 'MM-DD-YYYY'), 6003,  3000, 10, 8, 8, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9003, 'The noise level of other employees is nice on wknds.'      , to_date('07-22-2012', 'MM-DD-YYYY'), 6003,  3000, 9, 8, 8, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9003, 'I am deaf; this does not matter to me.'                    , to_date('07-22-2012', 'MM-DD-YYYY'), 6002,  3000, 5, 8, 8, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9003, 'The noise level of other employees is very distracting.'   , to_date('07-23-2012', 'MM-DD-YYYY'), 6003,  3000, 4, 8, 8, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9003, 'The noise level of other employees is very distracting.'   , to_date('07-24-2012', 'MM-DD-YYYY'), 6003,  3000, 2, 8, 8, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9003, 'The noise level of other employees is very distracting.'   , to_date('07-25-2012', 'MM-DD-YYYY'), 6003,  3000, 3, 8, 8, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9003, 'The noise level of other employees is very distracting.'   , to_date('07-26-2012', 'MM-DD-YYYY'), 6003,  3000, 2, 8, 8, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9003, 'The noise level of other employees is very distracting.'   , to_date('07-27-2012', 'MM-DD-YYYY'), 6003,  3000, 2, 8, 8, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9001, 'I am pretty happy these days!'                             , to_date('03-21-2014', 'MM-DD-YYYY'), 6001,  3000, 8, 5, 5, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9002, 'Food at cafeteria is awsome and its free!'                 , to_date('05-09-2014', 'MM-DD-YYYY'), 6002, 3000, 10, 5, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9001, 'Work totally sucks!!!'                                     , to_date('02-03-2014', 'MM-DD-YYYY'), 6000,  3000, 1, 9, 9, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9000, 'So so.....'                                                , to_date('10-24-2014', 'MM-DD-YYYY'), 6001,  3000, 3, 6, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9000, 'Excellent!'                                                , to_date('10-26-2014', 'MM-DD-YYYY'), 6002,  3000, 7, 5, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9000, 'Life is OK today at our company!'                             , to_date('10-28-2014', 'MM-DD-YYYY'), 6002,  3000, 9, 6, 2, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9000, 'Life is kinda creepy TODAY at our company!'                   , to_date('10-31-2014', 'MM-DD-YYYY'), 6003,  3000, 7, 6, 7, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9002, 'It tastes like a box of chocolates'                        , to_date('05-09-2014', 'MM-DD-YYYY'), 6003, 3000, 10, 5, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));

--start of dtmdata answers
insert into answer values (answer_id_seq.nextval, 9005, 'Some major issues w/ team right now'                        , to_date('11-09-2014', 'MM-DD-YYYY'), 6005, 3002, 4, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9005, 'Things are ok.'                        , to_date('08-10-2014', 'MM-DD-YYYY'), 6006, 3002, 7, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9005, 'So so...'                        , to_date('02-10-2014', 'MM-DD-YYYY'), 6007, 3002, 2, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9005, 'Things are much better than few weeks ago!'                        , to_date('01-01-2014', 'MM-DD-YYYY'), 6008, 3002, 1, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9005, 'About the same as before'                        , to_date('10-12-2014', 'MM-DD-YYYY'), 6005, 3002, 7, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9005, 'I think we are headed in the right direction!'                        , to_date('07-11-2014', 'MM-DD-YYYY'), 6006, 3002, 8, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9005, 'Team dynamic right now is no good.'                        , to_date('09-09-2014', 'MM-DD-YYYY'), 6007, 3002, 7, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9005, 'Not sure at all.  Too busy.'                        , to_date('08-03-2014', 'MM-DD-YYYY'), 6008, 3002, 4, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9005, 'Workload is way too high'                        , to_date('03-11-2014', 'MM-DD-YYYY'), 6007, 3002, 5, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9005, 'Things are going very well!'                        , to_date('12-12-2014', 'MM-DD-YYYY'), 6007, 3002, 8, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));

insert into answer values (answer_id_seq.nextval, 9006, 'All is well!'                        , to_date('11-10-2014', 'MM-DD-YYYY'), 6005, 3002, 4, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9006, 'Things are ok.'                        , to_date('03-11-2014', 'MM-DD-YYYY'), 6006, 3002, 7, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9006, 'Yes, we need to meet at least twice per week!'                        , to_date('02-23-2014', 'MM-DD-YYYY'), 6007, 3002, 2, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9006, 'No, things are ok'                        , to_date('04-01-2014', 'MM-DD-YYYY'), 6008, 3002, 1, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9006, 'I don''t like our website!'                        , to_date('09-09-2014', 'MM-DD-YYYY'), 6005, 3002, 7, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9006, 'No, I think we are headed in the right direction!'                        , to_date('04-24-2014', 'MM-DD-YYYY'), 6006, 3002, 8, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9006, 'We all need to put more time into our favorite project.'                        , to_date('01-01-2014', 'MM-DD-YYYY'), 6007, 3002, 7, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9006, 'Lunch meetings better than after hours....'                        , to_date('09-12-2014', 'MM-DD-YYYY'), 6008, 3002, 4, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9006, 'Wish I could spend more time on our project.'                        , to_date('02-02-2014', 'MM-DD-YYYY'), 6007, 3002, 5, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9006, 'Things are going GREAT!  No suggestions.'                        , to_date('03-13-2014', 'MM-DD-YYYY'), 6007, 3002, 8, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));

insert into answer values (answer_id_seq.nextval, 9007, '9 out of 10 baby!'                        , to_date('11-23-2014', 'MM-DD-YYYY'), 6005, 3002, 4, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9007, 'As good as possible!'                        , to_date('05-05-2014', 'MM-DD-YYYY'), 6006, 3002, 7, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9007, '10!'                        , to_date('08-04-2014', 'MM-DD-YYYY'), 6007, 3002, 2, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9007, 'Not so good right now'                        , to_date('12-12-2014', 'MM-DD-YYYY'), 6008, 3002, 1, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9007, 'Amazing confidence that we will rock!'                        , to_date('10-17-2014', 'MM-DD-YYYY'), 6005, 3002, 7, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9007, 'Awsome sky is our limit!'                        , to_date('03-22-2014', 'MM-DD-YYYY'), 6006, 3002, 8, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9007, '8/10'                        , to_date('08-09-2014', 'MM-DD-YYYY'), 6007, 3002, 7, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9007, 'Not good'                        , to_date('11-12-2014', 'MM-DD-YYYY'), 6008, 3002, 4, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9007, 'Pretty good, but we have some issues'                        , to_date('02-09-2014', 'MM-DD-YYYY'), 6007, 3002, 5, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9007, 'No complaints here my friend!  I''m thrilled to be part of this!'                        , to_date('12-23-2014', 'MM-DD-YYYY'), 6007, 3002, 8, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));


insert into answer values (answer_id_seq.nextval, 9008, 'hrs is good'                        , to_date('11-23-2014', 'MM-DD-YYYY'), 6005, 3002, 4, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9008, 'so so'                        , to_date('05-05-2014', 'MM-DD-YYYY'), 6006, 3002, 7, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9008, 'I can def put more hours!'                        , to_date('08-04-2014', 'MM-DD-YYYY'), 6007, 3002, 2, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9008, 'Kinda busy these days, but fun!'                        , to_date('12-12-2014', 'MM-DD-YYYY'), 6008, 3002, 1, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9008, 'Family time is keeping me from putting hours in right now so my bad'                        , to_date('10-17-2014', 'MM-DD-YYYY'), 6005, 3002, 7, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9008, 'No complaints about hours here'                        , to_date('03-22-2014', 'MM-DD-YYYY'), 6006, 3002, 8, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9008, 'Too busy'                        , to_date('08-09-2014', 'MM-DD-YYYY'), 6007, 3002, 7, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9008, 'Not good'                        , to_date('11-12-2014', 'MM-DD-YYYY'), 6008, 3002, 4, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9008, 'Hard to say.  I don''t know what others are putting in'                        , to_date('02-09-2014', 'MM-DD-YYYY'), 6007, 3002, 3, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9008, 'No complaints here my friend... got plent more hours I can put in!'                        , to_date('12-23-2014', 'MM-DD-YYYY'), 6007, 3002, 8, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));

insert into answer values (answer_id_seq.nextval, 9009, 'Definitely a positive thing!'                        , to_date('11-09-2014', 'MM-DD-YYYY'), 6005, 3002, 3, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9009, 'That leader was bad for the team'                        , to_date('08-10-2014', 'MM-DD-YYYY'), 6006, 3002, 6, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9009, 'So so...'                        , to_date('02-10-2014', 'MM-DD-YYYY'), 6007, 3002, 5, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9009, 'Things are much better than few weeks ago!'                        , to_date('01-01-2014', 'MM-DD-YYYY'), 6008, 3002, 6, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9009, 'Not sure yet'                        , to_date('10-12-2014', 'MM-DD-YYYY'), 6005, 3002, 5, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9009, 'I think we are headed in the right direction finally!'                        , to_date('07-11-2014', 'MM-DD-YYYY'), 6006, 3002, 5, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9009, 'Team dynamic right now is amazing!'                        , to_date('09-09-2014', 'MM-DD-YYYY'), 6007, 3002, 8, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9009, 'Not sure at all.  Too busy.'                        , to_date('08-03-2014', 'MM-DD-YYYY'), 6008, 3002, 5, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9009, 'So far so good!'                        , to_date('03-11-2014', 'MM-DD-YYYY'), 6007, 3002, 7, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9009, 'Things are going very well!'                        , to_date('12-12-2014', 'MM-DD-YYYY'), 6007, 3002, 9, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));

insert into answer values (answer_id_seq.nextval, 9010, 'Next stop get demo up!'                        , to_date('11-10-2014', 'MM-DD-YYYY'), 6005, 3002, 6, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9010, 'Make website solid'                        , to_date('03-11-2014', 'MM-DD-YYYY'), 6006, 3002, 5, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9010, 'Have regular team meetings'                        , to_date('02-23-2014', 'MM-DD-YYYY'), 6007, 3002, 4, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9010, 'Raise some money so we can do this full time!  Too much fun!'                        , to_date('04-01-2014', 'MM-DD-YYYY'), 6008, 3002, 3, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9010, 'Not sure'                        , to_date('09-09-2014', 'MM-DD-YYYY'), 6005, 3002, 5, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9010, 'Continue to press on!'                        , to_date('04-24-2014', 'MM-DD-YYYY'), 6006, 3002, 6, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9010, 'Get customer #1!'                        , to_date('01-01-2014', 'MM-DD-YYYY'), 6007, 3002, 4, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9010, 'Continue to make solid progress'                        , to_date('09-12-2014', 'MM-DD-YYYY'), 6008, 3002, 8, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9010, 'Spend more time on demo - all of us'                        , to_date('02-02-2014', 'MM-DD-YYYY'), 6007, 3002, 2, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9010, 'Next stop IPO!'                        , to_date('03-13-2014', 'MM-DD-YYYY'), 6007, 3002, 9, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));

insert into answer values (answer_id_seq.nextval, 9011, 'Once a week meeting is fine'                        , to_date('11-23-2014', 'MM-DD-YYYY'), 6005, 3002, 6, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9011, 'I guess...'                        , to_date('05-05-2014', 'MM-DD-YYYY'), 6006, 3002, 5, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9011, 'No, I think min 2X week meeting is needed'                        , to_date('08-04-2014', 'MM-DD-YYYY'), 6007, 3002, 5, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9011, 'Just fine...'                        , to_date('12-12-2014', 'MM-DD-YYYY'), 6008, 3002, 4, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9011, 'I would rather meet on the weekends'                        , to_date('10-17-2014', 'MM-DD-YYYY'), 6005, 3002, 4, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9011, 'Sure'                        , to_date('03-22-2014', 'MM-DD-YYYY'), 6006, 3002, 5, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9011, 'Most of the time'                        , to_date('08-09-2014', 'MM-DD-YYYY'), 6007, 3002, 5, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9011, 'I don''t think we need any meetings'                        , to_date('11-12-2014', 'MM-DD-YYYY'), 6008, 3002, 8, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9011, 'Yes, but people have to make sure they are on time!'                        , to_date('02-09-2014', 'MM-DD-YYYY'), 6007, 3002, 3, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9011, 'No complaints at all!  I''m thrilled to be part of this!'                        , to_date('12-23-2014', 'MM-DD-YYYY'), 6007, 3002, 9, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));

insert into answer values (answer_id_seq.nextval, 9012, 'Bootstrapping all the way!'                        , to_date('11-09-2014', 'MM-DD-YYYY'), 6005, 3002, 5, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9012, 'President knows best!'                        , to_date('08-10-2014', 'MM-DD-YYYY'), 6006, 3002, 8, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9012, 'Bootstrap'                        , to_date('02-10-2014', 'MM-DD-YYYY'), 6007, 3002, 3, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9012, 'Not sure'                        , to_date('01-01-2014', 'MM-DD-YYYY'), 6008, 3002, 2, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9012, 'Bootstrap'                        , to_date('10-12-2014', 'MM-DD-YYYY'), 6005, 3002, 6, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9012, 'Maybe VC but not sure'                        , to_date('07-11-2014', 'MM-DD-YYYY'), 6006, 3002, 7, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9012, 'VC!'                        , to_date('09-09-2014', 'MM-DD-YYYY'), 6007, 3002, 7, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9012, 'Whichever is best for us'                        , to_date('08-03-2014', 'MM-DD-YYYY'), 6008, 3002, 8, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9012, 'Boot...'                        , to_date('03-11-2014', 'MM-DD-YYYY'), 6007, 3002, 4, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9012, 'Don''t know about either much'                        , to_date('12-12-2014', 'MM-DD-YYYY'), 6007, 3002, 6, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));

--start of tinycompany answers
insert into answer values (answer_id_seq.nextval, 9015, 'Some major issues w/ team right now'                        , to_date('11-09-2014', 'MM-DD-YYYY'), 6009, 3003, 4, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9015, 'Things are ok.'                        , to_date('08-10-2014', 'MM-DD-YYYY'), 6010, 3003, 7, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9015, 'So so...'                        , to_date('02-10-2014', 'MM-DD-YYYY'), 6011, 3003, 2, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9015, 'Things are much better than few weeks ago!'                        , to_date('01-01-2014', 'MM-DD-YYYY'), 6012, 3003, 1, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9015, 'About the same as before'                        , to_date('10-12-2014', 'MM-DD-YYYY'), 6013, 3003, 7, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9015, 'I think we are headed in the right direction!'                        , to_date('07-11-2014', 'MM-DD-YYYY'), 6014, 3003, 8, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9015, 'Team dynamic right now is no good.'                        , to_date('09-09-2014', 'MM-DD-YYYY'), 6015, 3003, 7, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9015, 'Not sure at all.  Too busy.'                        , to_date('08-03-2014', 'MM-DD-YYYY'), 6009, 3003, 4, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9015, 'Workload is way too high'                        , to_date('03-11-2014', 'MM-DD-YYYY'), 6010, 3003, 5, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9015, 'Things are going very well!'                        , to_date('12-12-2014', 'MM-DD-YYYY'), 6011, 3003, 8, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));

insert into answer values (answer_id_seq.nextval, 9016, 'All is well!'                        , to_date('11-10-2014', 'MM-DD-YYYY'), 6009, 3003, 4, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9016, 'Things are ok.'                        , to_date('03-11-2014', 'MM-DD-YYYY'), 6010, 3003, 7, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9016, 'Yes, we need to meet at least twice per week!'                        , to_date('02-23-2014', 'MM-DD-YYYY'), 6011, 3003, 2, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9016, 'No, things are ok'                        , to_date('04-01-2014', 'MM-DD-YYYY'), 6012, 3003, 1, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9016, 'I don''t like our website!'                        , to_date('09-09-2014', 'MM-DD-YYYY'), 6013, 3003, 7, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9016, 'No, I think we are headed in the right direction!'                        , to_date('04-24-2014', 'MM-DD-YYYY'), 6014, 3003, 8, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9016, 'We all need to put more time into our favorite project.'                        , to_date('01-01-2014', 'MM-DD-YYYY'), 6015, 3003, 7, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9016, 'Lunch meetings better than after hours....'                        , to_date('09-12-2014', 'MM-DD-YYYY'), 6009, 3003, 4, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9016, 'Wish I could spend more time on our project.'                        , to_date('02-02-2014', 'MM-DD-YYYY'), 6010, 3003, 5, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9016, 'Things are going GREAT!  No suggestions.'                        , to_date('03-13-2014', 'MM-DD-YYYY'), 6011, 3003, 8, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));

insert into answer values (answer_id_seq.nextval, 9017, '9 out of 10 baby!'                        , to_date('11-23-2014', 'MM-DD-YYYY'), 6009, 3003, 4, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9017, 'As good as possible!'                        , to_date('05-05-2014', 'MM-DD-YYYY'), 6010, 3003, 7, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9017, '10!'                        , to_date('08-04-2014', 'MM-DD-YYYY'), 6011, 3003, 2, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9017, 'Not so good right now'                        , to_date('12-12-2014', 'MM-DD-YYYY'), 6012, 3003, 1, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9017, 'Amazing confidence that we will rock!'                        , to_date('10-17-2014', 'MM-DD-YYYY'), 6013, 3003, 7, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9017, 'Awsome sky is our limit!'                        , to_date('03-22-2014', 'MM-DD-YYYY'), 6014, 3003, 8, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9017, '8/10'                        , to_date('08-09-2014', 'MM-DD-YYYY'), 6015, 3003, 7, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9017, 'Not good'                        , to_date('11-12-2014', 'MM-DD-YYYY'), 6009, 3003, 4, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9017, 'Pretty good, but we have some issues'                        , to_date('02-09-2014', 'MM-DD-YYYY'), 6010, 3003, 5, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9017, 'No complaints here my friend!  I''m thrilled to be part of this!'                        , to_date('12-23-2014', 'MM-DD-YYYY'), 6011, 3003, 8, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));

insert into answer values (answer_id_seq.nextval, 9018, 'hrs is good'                        , to_date('11-23-2014', 'MM-DD-YYYY'), 6009, 3003, 4, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9018, 'so so'                        , to_date('05-05-2014', 'MM-DD-YYYY'), 6010, 3003, 7, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9018, 'I can def put more hours!'                        , to_date('08-04-2014', 'MM-DD-YYYY'), 6011, 3003, 2, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9018, 'Kinda busy these days, but fun!'                        , to_date('12-12-2014', 'MM-DD-YYYY'), 6012, 3003, 1, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9018, 'Family time is keeping me from putting hours in right now so my bad'                        , to_date('10-17-2014', 'MM-DD-YYYY'), 6013, 3003, 7, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9018, 'No complaints about hours here'                        , to_date('03-22-2014', 'MM-DD-YYYY'), 6014, 3003, 8, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9018, 'Too busy'                        , to_date('08-09-2014', 'MM-DD-YYYY'), 6015, 3003, 7, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9018, 'Not good'                        , to_date('11-12-2014', 'MM-DD-YYYY'), 6009, 3003, 4, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9018, 'Hard to say.  I don''t know what others are putting in'                        , to_date('02-09-2014', 'MM-DD-YYYY'), 6010, 3003, 3, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9018, 'No complaints here my friend... got plent more hours I can put in!'                        , to_date('12-23-2014', 'MM-DD-YYYY'), 6011, 3003, 8, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));

insert into answer values (answer_id_seq.nextval, 9019, 'Definitely a positive thing!'                        , to_date('11-09-2014', 'MM-DD-YYYY'), 6009, 3003, 3, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9019, 'That leader was bad for the team'                        , to_date('08-10-2014', 'MM-DD-YYYY'), 6010, 3003, 6, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9019, 'So so...'                        , to_date('02-10-2014', 'MM-DD-YYYY'), 6011, 3003, 5, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9019, 'Things are much better than few weeks ago!'                        , to_date('01-01-2014', 'MM-DD-YYYY'), 6012, 3003, 6, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9019, 'Not sure yet'                        , to_date('10-12-2014', 'MM-DD-YYYY'), 6013, 3003, 5, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9019, 'I think we are headed in the right direction finally!'                        , to_date('07-11-2014', 'MM-DD-YYYY'), 6014, 3003, 5, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9019, 'Team dynamic right now is amazing!'                        , to_date('09-09-2014', 'MM-DD-YYYY'), 6015, 3003, 8, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9019, 'Not sure at all.  Too busy.'                        , to_date('08-03-2014', 'MM-DD-YYYY'), 6009, 3003, 5, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9019, 'So far so good!'                        , to_date('03-11-2014', 'MM-DD-YYYY'), 6010, 3003, 7, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9019, 'Things are going very well!'                        , to_date('12-12-2014', 'MM-DD-YYYY'), 6011, 3003, 9, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));

insert into answer values (answer_id_seq.nextval, 9020, 'Next stop get demo up!'                        , to_date('11-10-2014', 'MM-DD-YYYY'), 6009, 3003, 6, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9020, 'Make website solid'                        , to_date('03-11-2014', 'MM-DD-YYYY'), 6010, 3003, 5, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9020, 'Have regular team meetings'                        , to_date('02-23-2014', 'MM-DD-YYYY'), 6011, 3003, 4, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9020, 'Raise some money so we can do this full time!  Too much fun!'                        , to_date('04-01-2014', 'MM-DD-YYYY'), 6012, 3003, 3, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9020, 'Not sure'                        , to_date('09-09-2014', 'MM-DD-YYYY'), 6013, 3003, 5, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9020, 'Continue to press on!'                        , to_date('04-24-2014', 'MM-DD-YYYY'), 6014, 3003, 6, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9020, 'Get customer #1!'                        , to_date('01-01-2014', 'MM-DD-YYYY'), 6015, 3003, 4, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9020, 'Continue to make solid progress'                        , to_date('09-12-2014', 'MM-DD-YYYY'), 6009, 3003, 8, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9020, 'Spend more time on demo - all of us'                        , to_date('02-02-2014', 'MM-DD-YYYY'), 6010, 3003, 2, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9020, 'Next stop IPO!'                        , to_date('03-13-2014', 'MM-DD-YYYY'), 6011, 3003, 9, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));

insert into answer values (answer_id_seq.nextval, 9021, 'Once a week meeting is fine'                        , to_date('11-23-2014', 'MM-DD-YYYY'), 6009, 3003, 6, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9021, 'I guess...'                        , to_date('05-05-2014', 'MM-DD-YYYY'), 6010, 3003, 5, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9021, 'No, I think min 2X week meeting is needed'                        , to_date('08-04-2014', 'MM-DD-YYYY'), 6011, 3003, 5, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9021, 'Just fine...'                        , to_date('12-12-2014', 'MM-DD-YYYY'), 6012, 3003, 4, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9021, 'I would rather meet on the weekends'                        , to_date('10-17-2014', 'MM-DD-YYYY'), 6013, 3003, 4, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9021, 'Sure'                        , to_date('03-22-2014', 'MM-DD-YYYY'), 6014, 3003, 5, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9021, 'Most of the time'                        , to_date('08-09-2014', 'MM-DD-YYYY'), 6015, 3003, 5, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9021, 'I don''t think we need any meetings'                        , to_date('11-12-2014', 'MM-DD-YYYY'), 6009, 3003, 8, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9021, 'Yes, but people have to make sure they are on time!'                        , to_date('02-09-2014', 'MM-DD-YYYY'), 6010, 3003, 3, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9021, 'No complaints at all!  I''m thrilled to be part of this!'                        , to_date('12-23-2014', 'MM-DD-YYYY'), 6011, 3003, 9, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));

insert into answer values (answer_id_seq.nextval, 9022, 'Bootstrapping all the way!'                        , to_date('11-09-2014', 'MM-DD-YYYY'), 6009, 3003, 5, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9022, 'President knows best!'                        , to_date('08-10-2014', 'MM-DD-YYYY'), 6010, 3003, 8, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9022, 'Bootstrap'                        , to_date('02-10-2014', 'MM-DD-YYYY'), 6011, 3003, 3, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9022, 'Not sure'                        , to_date('01-01-2014', 'MM-DD-YYYY'), 6012, 3003, 2, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9022, 'Bootstrap'                        , to_date('10-12-2014', 'MM-DD-YYYY'), 6013, 3003, 6, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9022, 'Maybe VC but not sure'                        , to_date('07-11-2014', 'MM-DD-YYYY'), 6014, 3003, 7, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9022, 'VC!'                        , to_date('09-09-2014', 'MM-DD-YYYY'), 6015, 3003, 7, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9022, 'Whichever is best for us'                        , to_date('08-03-2014', 'MM-DD-YYYY'), 6009, 3003, 8, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9022, 'Boot...'                        , to_date('03-11-2014', 'MM-DD-YYYY'), 6010, 3003, 4, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9022, 'Don''t know about either much'                        , to_date('12-12-2014', 'MM-DD-YYYY'), 6011, 3003, 6, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));


--start of smallcompany answers
insert into answer values (answer_id_seq.nextval, 9025, 'Some major issues w/ team right now'                        , to_date('11-09-2014', 'MM-DD-YYYY'), 6016, 3004, 4, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9025, 'Things are ok.'                        , to_date('08-10-2014', 'MM-DD-YYYY'), 6017, 3004, 7, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9025, 'So so...'                        , to_date('02-10-2014', 'MM-DD-YYYY'), 6018, 3004, 2, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9025, 'Things are much better than few weeks ago!'                        , to_date('01-01-2014', 'MM-DD-YYYY'), 6019, 3004, 1, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9025, 'About the same as before'                        , to_date('10-12-2014', 'MM-DD-YYYY'), 6020, 3004, 7, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9025, 'I think we are headed in the right direction!'                        , to_date('07-11-2014', 'MM-DD-YYYY'), 6021, 3004, 8, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9025, 'Team dynamic right now is no good.'                        , to_date('09-09-2014', 'MM-DD-YYYY'), 6022, 3004, 7, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9025, 'Not sure at all.  Too busy.'                        , to_date('08-03-2014', 'MM-DD-YYYY'), 6023, 3004, 4, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9025, 'Workload is way too high'                        , to_date('03-11-2014', 'MM-DD-YYYY'), 6024, 3004, 5, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9025, 'Things are going very well!'                        , to_date('12-12-2014', 'MM-DD-YYYY'), 6025, 3004, 8, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));

insert into answer values (answer_id_seq.nextval, 9026, 'All is well!'                        , to_date('11-10-2014', 'MM-DD-YYYY'), 6026, 3004, 4, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9026, 'Things are ok.'                        , to_date('03-11-2014', 'MM-DD-YYYY'), 6027, 3004, 7, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9026, 'Yes, we need to meet at least twice per week!'                        , to_date('02-23-2014', 'MM-DD-YYYY'), 6028, 3004, 2, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9026, 'No, things are ok'                        , to_date('04-01-2014', 'MM-DD-YYYY'), 6016, 3004, 1, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9026, 'I don''t like our website!'                        , to_date('09-09-2014', 'MM-DD-YYYY'), 6017, 3004, 7, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9026, 'No, I think we are headed in the right direction!'                        , to_date('04-24-2014', 'MM-DD-YYYY'), 6018, 3004, 8, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9026, 'We all need to put more time into our favorite project.'                        , to_date('01-01-2014', 'MM-DD-YYYY'), 6019, 3004, 7, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9026, 'Lunch meetings better than after hours....'                        , to_date('09-12-2014', 'MM-DD-YYYY'), 6020, 3004, 4, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9026, 'Wish I could spend more time on our project.'                        , to_date('02-02-2014', 'MM-DD-YYYY'), 6021, 3004, 5, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9026, 'Things are going GREAT!  No suggestions.'                        , to_date('03-13-2014', 'MM-DD-YYYY'), 6022, 3004, 8, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));

insert into answer values (answer_id_seq.nextval, 9027, '9 out of 10 baby!'                        , to_date('11-23-2014', 'MM-DD-YYYY'), 6023, 3004, 4, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9027, 'As good as possible!'                        , to_date('05-05-2014', 'MM-DD-YYYY'), 6024, 3004, 7, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9027, '10!'                        , to_date('08-04-2014', 'MM-DD-YYYY'), 6025, 3004, 2, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9027, 'Not so good right now'                        , to_date('12-12-2014', 'MM-DD-YYYY'), 6026, 3004, 1, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9027, 'Amazing confidence that we will rock!'                        , to_date('10-17-2014', 'MM-DD-YYYY'), 6027, 3004, 7, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9027, 'Awsome sky is our limit!'                        , to_date('03-22-2014', 'MM-DD-YYYY'), 6028, 3004, 8, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9027, '8/10'                        , to_date('08-09-2014', 'MM-DD-YYYY'), 6016, 3004, 7, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9027, 'Not good'                        , to_date('11-12-2014', 'MM-DD-YYYY'), 6017, 3004, 4, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9027, 'Pretty good, but we have some issues'                        , to_date('02-09-2014', 'MM-DD-YYYY'), 6018, 3004, 5, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9027, 'No complaints here my friend!  I''m thrilled to be part of this!'                        , to_date('12-23-2014', 'MM-DD-YYYY'), 6019, 3004, 8, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));

insert into answer values (answer_id_seq.nextval, 9028, 'hrs is good'                        , to_date('11-23-2014', 'MM-DD-YYYY'), 6020, 3004, 4, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9028, 'so so'                        , to_date('05-05-2014', 'MM-DD-YYYY'), 6021, 3004, 7, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9028, 'I can def put more hours!'                        , to_date('08-04-2014', 'MM-DD-YYYY'), 6022, 3004, 2, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9028, 'Kinda busy these days, but fun!'                        , to_date('12-12-2014', 'MM-DD-YYYY'), 6023, 3004, 1, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9028, 'Family time is keeping me from putting hours in right now so my bad'                        , to_date('10-17-2014', 'MM-DD-YYYY'), 6024, 3004, 7, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9028, 'No complaints about hours here'                        , to_date('03-22-2014', 'MM-DD-YYYY'), 6025, 3004, 8, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9028, 'Too busy'                        , to_date('08-09-2014', 'MM-DD-YYYY'), 6026, 3004, 7, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9028, 'Not good'                        , to_date('11-12-2014', 'MM-DD-YYYY'), 6027, 3004, 4, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9028, 'Hard to say.  I don''t know what others are putting in'                        , to_date('02-09-2014', 'MM-DD-YYYY'), 6028, 3004, 3, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9028, 'No complaints here my friend... got plent more hours I can put in!'                        , to_date('12-23-2014', 'MM-DD-YYYY'), 6016, 3004, 8, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));

insert into answer values (answer_id_seq.nextval, 9029, 'Definitely a positive thing!'                        , to_date('11-09-2014', 'MM-DD-YYYY'), 6017, 3004, 3, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9029, 'That leader was bad for the team'                        , to_date('08-10-2014', 'MM-DD-YYYY'), 6018, 3004, 6, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9029, 'So so...'                        , to_date('02-10-2014', 'MM-DD-YYYY'), 6019, 3004, 5, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9029, 'Things are much better than few weeks ago!'                        , to_date('01-01-2014', 'MM-DD-YYYY'), 6020, 3004, 6, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9029, 'Not sure yet'                        , to_date('10-12-2014', 'MM-DD-YYYY'), 6021, 3004, 5, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9029, 'I think we are headed in the right direction finally!'                        , to_date('07-11-2014', 'MM-DD-YYYY'), 6022, 3004, 5, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9029, 'Team dynamic right now is amazing!'                        , to_date('09-09-2014', 'MM-DD-YYYY'), 6023, 3004, 8, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9029, 'Not sure at all.  Too busy.'                        , to_date('08-03-2014', 'MM-DD-YYYY'), 6024, 3004, 5, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9029, 'So far so good!'                        , to_date('03-11-2014', 'MM-DD-YYYY'), 6025, 3004, 7, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9029, 'Things are going very well!'                        , to_date('12-12-2014', 'MM-DD-YYYY'), 6026, 3004, 9, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));

insert into answer values (answer_id_seq.nextval, 9030, 'Next stop get demo up!'                        , to_date('11-10-2014', 'MM-DD-YYYY'), 6027, 3004, 6, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9030, 'Make website solid'                        , to_date('03-11-2014', 'MM-DD-YYYY'), 6028, 3004, 5, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9030, 'Have regular team meetings'                        , to_date('02-23-2014', 'MM-DD-YYYY'), 6016, 3004, 4, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9030, 'Raise some money so we can do this full time!  Too much fun!'                        , to_date('04-01-2014', 'MM-DD-YYYY'), 6017, 3004, 3, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9030, 'Not sure'                        , to_date('09-09-2014', 'MM-DD-YYYY'), 6018, 3004, 5, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9030, 'Continue to press on!'                        , to_date('04-24-2014', 'MM-DD-YYYY'), 6019, 3004, 6, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9030, 'Get customer #1!'                        , to_date('01-01-2014', 'MM-DD-YYYY'), 6020, 3004, 4, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9030, 'Continue to make solid progress'                        , to_date('09-12-2014', 'MM-DD-YYYY'), 6021, 3004, 8, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9030, 'Spend more time on demo - all of us'                        , to_date('02-02-2014', 'MM-DD-YYYY'), 6022, 3004, 2, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9030, 'Next stop IPO!'                        , to_date('03-13-2014', 'MM-DD-YYYY'), 6023, 3004, 9, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));

insert into answer values (answer_id_seq.nextval, 9031, 'Once a week meeting is fine'                        , to_date('11-23-2014', 'MM-DD-YYYY'), 6024, 3004, 6, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9031, 'I guess...'                        , to_date('05-05-2014', 'MM-DD-YYYY'), 6025, 3004, 5, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9031, 'No, I think min 2X week meeting is needed'                        , to_date('08-04-2014', 'MM-DD-YYYY'), 6026, 3004, 5, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9031, 'Just fine...'                        , to_date('12-12-2014', 'MM-DD-YYYY'), 6027, 3004, 4, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9031, 'I would rather meet on the weekends'                        , to_date('10-17-2014', 'MM-DD-YYYY'), 6028, 3004, 4, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9031, 'Sure'                        , to_date('03-22-2014', 'MM-DD-YYYY'), 6016, 3004, 5, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9031, 'Most of the time'                        , to_date('08-09-2014', 'MM-DD-YYYY'), 6017, 3004, 5, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9031, 'I don''t think we need any meetings'                        , to_date('11-12-2014', 'MM-DD-YYYY'), 6018, 3004, 8, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9031, 'Yes, but people have to make sure they are on time!'                        , to_date('02-09-2014', 'MM-DD-YYYY'), 6019, 3004, 3, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9031, 'No complaints at all!  I''m thrilled to be part of this!'                        , to_date('12-23-2014', 'MM-DD-YYYY'), 6020, 3004, 9, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));

insert into answer values (answer_id_seq.nextval, 9032, 'Bootstrapping all the way!'                        , to_date('11-09-2014', 'MM-DD-YYYY'), 6021, 3004, 5, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9032, 'President knows best!'                        , to_date('08-10-2014', 'MM-DD-YYYY'), 6022, 3004, 8, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9032, 'Bootstrap'                        , to_date('02-10-2014', 'MM-DD-YYYY'), 6023, 3004, 3, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9032, 'Not sure'                        , to_date('01-01-2014', 'MM-DD-YYYY'), 6024, 3004, 2, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9032, 'Bootstrap'                        , to_date('10-12-2014', 'MM-DD-YYYY'), 6025, 3004, 6, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9032, 'Maybe VC but not sure'                        , to_date('07-11-2014', 'MM-DD-YYYY'), 6026,3004,  7, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9032, 'VC!'                        , to_date('09-09-2014', 'MM-DD-YYYY'), 6027, 3004, 7, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9032, 'Whichever is best for us'                        , to_date('08-03-2014', 'MM-DD-YYYY'), 6028, 3004, 8, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9032, 'Boot...'                        , to_date('03-11-2014', 'MM-DD-YYYY'), 6016, 3004, 4, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9032, 'Don''t know about either much'                        , to_date('12-12-2014', 'MM-DD-YYYY'), 6017, 3004, 6, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));


--start of mediumcompany answers
insert into answer values (answer_id_seq.nextval, 9035, 'Some major issues w/ team right now'                        , to_date('11-09-2014', 'MM-DD-YYYY'), 6029, 3005, 4, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9035, 'Things are ok.'                        , to_date('08-10-2014', 'MM-DD-YYYY'), 6030, 3005, 7, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9035, 'So so...'                        , to_date('02-10-2014', 'MM-DD-YYYY'), 6031, 3005, 2, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9035, 'Things are much better than few weeks ago!'                        , to_date('01-01-2014', 'MM-DD-YYYY'), 6032, 3005, 1, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9035, 'About the same as before'                        , to_date('10-12-2014', 'MM-DD-YYYY'), 6033, 3005, 7, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9035, 'I think we are headed in the right direction!'                        , to_date('07-11-2014', 'MM-DD-YYYY'), 6034, 3005, 8, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9035, 'Team dynamic right now is no good.'                        , to_date('09-09-2014', 'MM-DD-YYYY'), 6035, 3005, 7, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9035, 'Not sure at all.  Too busy.'                        , to_date('08-03-2014', 'MM-DD-YYYY'), 6036, 3005, 4, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9035, 'Workload is way too high'                        , to_date('03-11-2014', 'MM-DD-YYYY'), 6037, 3005, 5, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9035, 'Things are going very well!'                        , to_date('12-12-2014', 'MM-DD-YYYY'), 6038, 3005, 8, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));

insert into answer values (answer_id_seq.nextval, 9036, 'All is well!'                        , to_date('11-10-2014', 'MM-DD-YYYY'), 6039, 3005, 4, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9036, 'Things are ok.'                        , to_date('03-11-2014', 'MM-DD-YYYY'), 6040, 3005, 7, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9036, 'Yes, we need to meet at least twice per week!'                        , to_date('02-23-2014', 'MM-DD-YYYY'), 6041, 3005, 2, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9036, 'No, things are ok'                        , to_date('04-01-2014', 'MM-DD-YYYY'), 6042, 3005, 1, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9036, 'I don''t like our website!'                        , to_date('09-09-2014', 'MM-DD-YYYY'), 6043, 3005, 7, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9036, 'No, I think we are headed in the right direction!'                        , to_date('04-24-2014', 'MM-DD-YYYY'), 6044, 3005, 8, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9036, 'We all need to put more time into our favorite project.'                        , to_date('01-01-2014', 'MM-DD-YYYY'), 6045, 3005, 7, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9036, 'Lunch meetings better than after hours....'                        , to_date('09-12-2014', 'MM-DD-YYYY'), 6046, 3005, 4, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9036, 'Wish I could spend more time on our project.'                        , to_date('02-02-2014', 'MM-DD-YYYY'), 6047, 3005, 5, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9036, 'Things are going GREAT!  No suggestions.'                        , to_date('03-13-2014', 'MM-DD-YYYY'), 6048, 3005, 8, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));

insert into answer values (answer_id_seq.nextval, 9037, '9 out of 10 baby!'                        , to_date('11-23-2014', 'MM-DD-YYYY'), 6048, 3005, 4, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9037, 'As good as possible!'                        , to_date('05-05-2014', 'MM-DD-YYYY'), 6050, 3005, 7, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9037, '10!'                        , to_date('08-04-2014', 'MM-DD-YYYY'), 6025, 3005, 2, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9037, 'Not so good right now'                        , to_date('12-12-2014', 'MM-DD-YYYY'), 6051, 3005, 1, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9037, 'Amazing confidence that we will rock!'                        , to_date('10-17-2014', 'MM-DD-YYYY'), 6052, 3005, 7, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9037, 'Awsome sky is our limit!'                        , to_date('03-22-2014', 'MM-DD-YYYY'), 6053, 3005, 8, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9037, '8/10'                        , to_date('08-09-2014', 'MM-DD-YYYY'), 6016, 3005, 7, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9037, 'Not good'                        , to_date('11-12-2014', 'MM-DD-YYYY'), 6054, 3005, 4, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9037, 'Pretty good, but we have some issues'                        , to_date('02-09-2014', 'MM-DD-YYYY'), 6055, 3005, 5, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9037, 'No complaints here my friend!  I''m thrilled to be part of this!'                        , to_date('12-23-2014', 'MM-DD-YYYY'), 6056, 3005, 8, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));

insert into answer values (answer_id_seq.nextval, 9038, 'hrs is good'                        , to_date('11-23-2014', 'MM-DD-YYYY'), 6057, 3005, 4, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9038, 'so so'                        , to_date('05-05-2014', 'MM-DD-YYYY'), 6058, 3005, 7, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9038, 'I can def put more hours!'                        , to_date('08-04-2014', 'MM-DD-YYYY'), 6059, 3005, 2, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9038, 'Kinda busy these days, but fun!'                        , to_date('12-12-2014', 'MM-DD-YYYY'), 6029, 3005, 1, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9038, 'Family time is keeping me from putting hours in right now so my bad'                        , to_date('10-17-2014', 'MM-DD-YYYY'), 6030, 3005, 7, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9038, 'No complaints about hours here'                        , to_date('03-22-2014', 'MM-DD-YYYY'), 6031, 3005, 8, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9038, 'Too busy'                        , to_date('08-09-2014', 'MM-DD-YYYY'), 6032, 3005, 7, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9038, 'Not good'                        , to_date('11-12-2014', 'MM-DD-YYYY'), 6033, 3005, 4, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9038, 'Hard to say.  I don''t know what others are putting in'                        , to_date('02-09-2014', 'MM-DD-YYYY'), 6034, 3005, 3, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9038, 'No complaints here my friend... got plent more hours I can put in!'                        , to_date('12-23-2014', 'MM-DD-YYYY'), 6035, 3005, 8, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));

insert into answer values (answer_id_seq.nextval, 9039, 'Definitely a positive thing!'                        , to_date('11-09-2014', 'MM-DD-YYYY'), 6036, 3005, 3, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9039, 'That leader was bad for the team'                        , to_date('08-10-2014', 'MM-DD-YYYY'), 6037, 3005, 6, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9039, 'So so...'                        , to_date('02-10-2014', 'MM-DD-YYYY'), 6038, 3005, 5, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9039, 'Things are much better than few weeks ago!'                        , to_date('01-01-2014', 'MM-DD-YYYY'), 6039, 3005, 6, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9039, 'Not sure yet'                        , to_date('10-12-2014', 'MM-DD-YYYY'), 6040, 3005, 5, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9039, 'I think we are headed in the right direction finally!'                        , to_date('07-11-2014', 'MM-DD-YYYY'), 6041, 3005, 5, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9039, 'Team dynamic right now is amazing!'                        , to_date('09-09-2014', 'MM-DD-YYYY'), 6042, 3005, 8, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9039, 'Not sure at all.  Too busy.'                        , to_date('08-03-2014', 'MM-DD-YYYY'), 6043, 3005, 5, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9039, 'So far so good!'                        , to_date('03-11-2014', 'MM-DD-YYYY'), 6044, 3005, 7, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9039, 'Things are going very well!'                        , to_date('12-12-2014', 'MM-DD-YYYY'), 6045, 3005, 9, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));

insert into answer values (answer_id_seq.nextval, 9040, 'Next stop get demo up!'                        , to_date('11-10-2014', 'MM-DD-YYYY'), 6046, 3005, 6, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9040, 'Make website solid'                        , to_date('03-11-2014', 'MM-DD-YYYY'), 6047, 3005, 5, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9040, 'Have regular team meetings'                        , to_date('02-23-2014', 'MM-DD-YYYY'), 6048, 3005, 4, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9040, 'Raise some money so we can do this full time!  Too much fun!'                        , to_date('04-01-2014', 'MM-DD-YYYY'), 6049, 3005, 3, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9040, 'Not sure'                        , to_date('09-09-2014', 'MM-DD-YYYY'), 6050, 3005, 5, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9040, 'Continue to press on!'                        , to_date('04-24-2014', 'MM-DD-YYYY'), 6051, 3005, 6, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9040, 'Get customer #1!'                        , to_date('01-01-2014', 'MM-DD-YYYY'), 6052, 3005, 4, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9040, 'Continue to make solid progress'                        , to_date('09-12-2014', 'MM-DD-YYYY'), 6053, 3005, 8, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9040, 'Spend more time on demo - all of us'                        , to_date('02-02-2014', 'MM-DD-YYYY'), 6054, 3005, 2, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9040, 'Next stop IPO!'                        , to_date('03-13-2014', 'MM-DD-YYYY'), 6055, 3005, 9, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));

insert into answer values (answer_id_seq.nextval, 9041, 'Once a week meeting is fine'                        , to_date('11-23-2014', 'MM-DD-YYYY'), 6056, 3005, 6, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9041, 'I guess...'                        , to_date('05-05-2014', 'MM-DD-YYYY'), 6057, 3005, 5, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9041, 'No, I think min 2X week meeting is needed'                        , to_date('08-04-2014', 'MM-DD-YYYY'), 6058, 3005, 5, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9041, 'Just fine...'                        , to_date('12-12-2014', 'MM-DD-YYYY'), 6059, 3005, 4, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9041, 'I would rather meet on the weekends'                        , to_date('10-17-2014', 'MM-DD-YYYY'), 6029, 3005, 4, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9041, 'Sure'                        , to_date('03-22-2014', 'MM-DD-YYYY'), 6030, 3005, 5, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9041, 'Most of the time'                        , to_date('08-09-2014', 'MM-DD-YYYY'), 6031, 3005, 5, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9041, 'I don''t think we need any meetings'                        , to_date('11-12-2014', 'MM-DD-YYYY'), 6032, 3005, 8, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9041, 'Yes, but people have to make sure they are on time!'                        , to_date('02-09-2014', 'MM-DD-YYYY'), 6033, 3005, 3, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9041, 'No complaints at all!  I''m thrilled to be part of this!'                        , to_date('12-23-2014', 'MM-DD-YYYY'), 6034, 3005, 9, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));

insert into answer values (answer_id_seq.nextval, 9042, 'Bootstrapping all the way!'                        , to_date('11-09-2014', 'MM-DD-YYYY'), 6035, 3005, 5, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9042, 'President knows best!'                        , to_date('08-10-2014', 'MM-DD-YYYY'), 6036, 3005, 8, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9042, 'Bootstrap'                        , to_date('02-10-2014', 'MM-DD-YYYY'), 6037, 3005, 3, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9042, 'Not sure'                        , to_date('01-01-2014', 'MM-DD-YYYY'), 6038, 3005, 2, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9042, 'Bootstrap'                        , to_date('10-12-2014', 'MM-DD-YYYY'), 6039, 3005, 6, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9042, 'Maybe VC but not sure'                        , to_date('07-11-2014', 'MM-DD-YYYY'), 6040, 3005, 7, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9042, 'VC!'                        , to_date('09-09-2014', 'MM-DD-YYYY'), 6041, 3005, 7, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9042, 'Whichever is best for us'                        , to_date('08-03-2014', 'MM-DD-YYYY'), 6042, 3005, 8, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9042, 'Boot...'                        , to_date('03-11-2014', 'MM-DD-YYYY'), 6043, 3005, 4, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9042, 'Don''t know about either much'                        , to_date('12-12-2014', 'MM-DD-YYYY'), 6044, 3005, 6, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));

insert into answer values (answer_id_seq.nextval, 9043, 'Very solid!'                        , to_date('11-09-2014', 'MM-DD-YYYY'), 6045, 3005, 8, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9043, 'The best!'                        , to_date('08-10-2014', 'MM-DD-YYYY'), 6046, 3005, 8, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9043, 'No good... time to revisit decision!'                        , to_date('02-10-2014', 'MM-DD-YYYY'), 6047, 3005, 3, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9043, 'Bad'                        , to_date('01-01-2014', 'MM-DD-YYYY'), 6048, 3005, 2, 1, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9043, 'OK'                        , to_date('10-12-2014', 'MM-DD-YYYY'), 6049, 3005, 6, 4, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9043, 'Solid!'                        , to_date('07-11-2014', 'MM-DD-YYYY'), 6050, 3005, 7, 8, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9043, 'Exactly what we need!'                        , to_date('09-09-2014', 'MM-DD-YYYY'), 6051, 3005, 7, 6, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9043, 'Not doing a good job lately....'                        , to_date('08-03-2014', 'MM-DD-YYYY'), 6052, 3005, 8, 9, 8, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9043, 'Not sure...'                        , to_date('03-11-2014', 'MM-DD-YYYY'), 6053, 3005, 4, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9043, 'Good, I guess'                        , to_date('12-12-2014', 'MM-DD-YYYY'), 6054, 3005, 6, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));

--start of largecompany answers
insert into answer values (answer_id_seq.nextval, 9046, 'Not sure...'                        , to_date('03-11-2014', 'MM-DD-YYYY'), 6060, 3006, 5, 5, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9047, 'Manager is good!'                        , to_date('12-12-2014', 'MM-DD-YYYY'), 6061, 3006, 7, 6, 3, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9048, 'I would add free food in cafeteria!'                        , to_date('12-12-2014', 'MM-DD-YYYY'), 6062, 3006, 6, 6, 7, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9046, 'Who knows...'                        , to_date('03-11-2014', 'MM-DD-YYYY'), 6060, 3006, 2, 3, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9047, 'Manager no good again!'                        , to_date('12-12-2014', 'MM-DD-YYYY'), 6061, 3006, 2, 6, 3, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9048, 'Just add some more parking spots!'                        , to_date('12-12-2014', 'MM-DD-YYYY'), 6062, 3006, 8, 6, 7, sysdate, to_date('12-31-9999','MM-DD-YYYY'));

--start of verylargecompany answers
insert into answer values (answer_id_seq.nextval, 9049, 'Yeah, I''m out of here as this place is no good!'                        , to_date('01-01-2014', 'MM-DD-YYYY'), 6063, 3007, 2, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9050, 'OK!'                        , to_date('09-22-2014', 'MM-DD-YYYY'), 6064, 3007, 4, 6, 3, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9051, 'Remove my immediate manager!'                        , to_date('10-04-2014', 'MM-DD-YYYY'), 6065, 3007, 2, 9, 7, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9049, 'OK place right now!'                        , to_date('01-01-2014', 'MM-DD-YYYY'), 6063, 3007, 7, 5, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9050, 'So so...'                        , to_date('09-22-2014', 'MM-DD-YYYY'), 6064, 3007, 5, 5, 3, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9051, 'Need our old offices back!'                        , to_date('10-04-2014', 'MM-DD-YYYY'), 6065, 3007, 4, 5, 7, sysdate, to_date('12-31-9999','MM-DD-YYYY'));

--start of eurodata answers
insert into answer values (answer_id_seq.nextval, 9052, 'This place is ok!'                        , to_date('09-12-2014', 'MM-DD-YYYY'), 6066, 3008, 7, 3, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9053, 'Manager is totally no good!'                        , to_date('12-25-2014', 'MM-DD-YYYY'), 6067, 3008, 3, 6, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9054, 'Probably bring back differnt teas in break room...'                        , to_date('05-23-2014', 'MM-DD-YYYY'), 6068, 3008, 4, 5, 3, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9052, 'Who knows...'                        , to_date('09-12-2014', 'MM-DD-YYYY'), 6066, 3008, 4, 3, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9053, 'Manager is ok now!'                        , to_date('12-25-2014', 'MM-DD-YYYY'), 6067, 3008, 5, 6, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9054, 'Not much at this time...'                        , to_date('05-23-2014', 'MM-DD-YYYY'), 6068, 3008, 6, 5, 6, sysdate, to_date('12-31-9999','MM-DD-YYYY'));

--start of northofthebordersoftware answers
insert into answer values (answer_id_seq.nextval, 9055, 'Not bad here!'                        , to_date('04-28-2014', 'MM-DD-YYYY'), 6069, 3009, 8, 3, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9056, 'Manager is good!'                        , to_date('10-02-2014', 'MM-DD-YYYY'), 6070, 3009, 6, 3, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9057, 'Increase our bonus...'                        , to_date('10-18-2014', 'MM-DD-YYYY'), 6071, 3009, 7, 6, 3, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9055, 'Starting to get bad...'                        , to_date('04-28-2014', 'MM-DD-YYYY'), 6069, 3009, 3, 3, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9056, 'Hard to tell right now...'                        , to_date('10-02-2014', 'MM-DD-YYYY'), 6070, 3009, 5, 3, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9057, 'Bring back the stock options program!'                        , to_date('10-18-2014', 'MM-DD-YYYY'), 6071, 3009, 9, 6, 7, sysdate, to_date('12-31-9999','MM-DD-YYYY'));

--start of downundersolutions answers
insert into answer values (answer_id_seq.nextval, 9058, 'I will be gone as soon as I find a job.  This place is terrible!'                        , to_date('06-13-2014', 'MM-DD-YYYY'), 6072, 3010, 1, 8, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9059, 'Manager is totally no good!'                        , to_date('11-12-2014', 'MM-DD-YYYY'), 6073, 3010, 2, 6, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9060, 'Nothing'                        , to_date('01-12-2014', 'MM-DD-YYYY'), 6074, 3010, 5, 5, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9058, 'I''m out!!!'                        , to_date('06-13-2014', 'MM-DD-YYYY'), 6072, 3010, 2, 9, 9, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9059, 'No good just like this company!'                        , to_date('11-12-2014', 'MM-DD-YYYY'), 6073, 3010, 1, 6, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9060, 'Stop waste of money on company parties!'                        , to_date('01-12-2014', 'MM-DD-YYYY'), 6074, 3010, 7, 4, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));

--start of wangenterprises answers
insert into answer values (answer_id_seq.nextval, 9061, 'No, I will be here 5 years from now!'                        , to_date('08-22-2014', 'MM-DD-YYYY'), 6075, 3011, 9, 3, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9062, 'Manager is awsome!'                        , to_date('02-12-2014', 'MM-DD-YYYY'), 6076, 3011, 9, 6, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9063, 'Really nothing'                        , to_date('12-08-2014', 'MM-DD-YYYY'), 6077, 3011, 5, 4, 3, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9061, 'I''m will not be here soon!'                        , to_date('08-22-2014', 'MM-DD-YYYY'), 6075, 3011, 2, 3, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9062, 'Management is no good in this place!'                        , to_date('02-12-2014', 'MM-DD-YYYY'), 6076, 3011, 3, 6, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9063, 'Not sure where to start!'                        , to_date('12-08-2014', 'MM-DD-YYYY'), 6077, 3011, 1, 4, 3, sysdate, to_date('12-31-9999','MM-DD-YYYY'));

--start of dubaiconstructioncompany answers
insert into answer values (answer_id_seq.nextval, 9064, 'No, I will be here 10 years from now!'                        , to_date('09-03-2014', 'MM-DD-YYYY'), 6078, 3012, 9, 3, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9065, 'Manager could not be better!'                        , to_date('10-25-2014', 'MM-DD-YYYY'), 6079, 3012, 9, 6, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9066, 'Not much'                        , to_date('01-03-2014', 'MM-DD-YYYY'), 6080, 3012, 5, 4, 3, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9064, 'I''m good right now!'                        , to_date('09-03-2014', 'MM-DD-YYYY'), 6078, 3012, 7, 3, 4, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9065, 'Manager is awsome!'                        , to_date('10-25-2014', 'MM-DD-YYYY'), 6079, 3012, 8, 6, 5, sysdate, to_date('12-31-9999','MM-DD-YYYY'));
insert into answer values (answer_id_seq.nextval, 9066, 'Yes, let us work from home!'                        , to_date('01-03-2014', 'MM-DD-YYYY'), 6080, 3012, 3, 4, 3, sysdate, to_date('12-31-9999','MM-DD-YYYY'));

commit;

-- set scan back on
set scan on;





