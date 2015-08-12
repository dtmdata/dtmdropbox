-- set scan off so it reads "&" as data and not variable
set scan off;


-- flatiron chick-fil-a 
insert into industry values (industry_id_seq.nextval, 'Food And Beverage'      , 'Food And Beverage Industry'                 , sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));

insert into location values (location_id_seq.nextval, 3034, '2580 Coalton Rd'  , '', '', 'Superior', 'Boulder' , 'CO', '80027', 'USA', 'North America', '', 'N/A', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));

insert into company values (company_id_seq.nextval, 'Chick-fil-A', 1, 'Chick-fil-A', 2023, 3500, 1, 'Lite', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'), 1);

insert into mm_industry_company values (1030, 3034, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));

insert into department values (dept_id_seq.nextval, 'Chick-fil-A Flatiron'      , 'Chick-fil-A Flatiron'          , '', 3034, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));

insert into employee values (emp_id_seq.nextval, 'Mr.'    , 'Dean'  , '', 'Lawes'  , '', '', '', 'B34R9WW1', '' , 3034, 4061, 'dean.lawes@chick-fil-a.com'   , '6505434800', 1  , 'Y', 2023, 0, 5000, 'pass', 'test', to_date('2012-07-01','YYYY-MM-DD'), to_date('12-31-9999', 'MM-DD-YYYY'), 'N');

insert into employee values (emp_id_seq.nextval, ''    , 'Chick-fil-A Flatiron'  , '', 'Customer'  , '', '', '', 'B34R9AX4', '' , 3034, 4061, 'chick-fil-a-flatiron@chick-fil-a.com'   , '6505434800', 6092  , 'N', 2023, 1, 5000, 'pass', 'test', to_date('2012-07-01','YYYY-MM-DD'), to_date('12-31-9999', 'MM-DD-YYYY'), 'N');


-- 104th chick-fil-a 
insert into location values (location_id_seq.nextval, 3034, '10280 Federal Blvd'  , '', '', 'Federal Heights', 'Adams' , 'CO', '80260', 'USA', 'North America', '', 'N/A', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));

insert into department values (dept_id_seq.nextval, 'Chick-fil-A Federal Heights'      , 'Chick-fil-A Federal Heights'          , '', 3034, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));

insert into employee values (emp_id_seq.nextval, 'Mr.'    , 'Joe'  , '', 'Smith'  , '', '', '', 'X56R9XY1', '' , 3034, 4062, 'joe.smith@chick-fil-a.com'   , '6505434800', 1  , 'Y', 2024, 0, 5000, 'pass', 'test', to_date('2012-07-01','YYYY-MM-DD'), to_date('12-31-9999', 'MM-DD-YYYY'), 'N');

insert into employee values (emp_id_seq.nextval, ''    , 'Chick-fil-A Federal Heights'  , '', 'Customer'  , '', '', '', 'H43R9AZZ', '' , 3034, 4062, 'chick-fil-a-federalheights@chick-fil-a.com'   , '6505434800', 6094  , 'N', 2024, 1, 5000, 'pass', 'test', to_date('2012-07-01','YYYY-MM-DD'), to_date('12-31-9999', 'MM-DD-YYYY'), 'N');



-- 120th and washington (thorncreek crossing) chick-fil-a 
insert into location values (location_id_seq.nextval, 3034, '1301 E 120th Ave'  , '', '', 'Thornton', 'Adams' , 'CO', '80233', 'USA', 'North America', '', 'N/A', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));

insert into department values (dept_id_seq.nextval, 'Chick-fil-A Thorncreek'      , 'Chick-fil-A Thorncreek Crossing'          , '', 3034, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));

insert into employee values (emp_id_seq.nextval, ''    , 'Chick-fil-A Thorncreek'  , '', 'Customer'  , '', '', '', 'A2WR9ACV', '' , 3034, 4064, 'chick-fil-a-thorncreekcrossing@chick-fil-a.com'   , '6505434800', 6094  , 'N', 2025, 1, 5000, 'pass', 'test', to_date('2012-07-01','YYYY-MM-DD'), to_date('12-31-9999', 'MM-DD-YYYY'), 'N');



-- load vp and ceo of chick-fil-a
insert into location values (location_id_seq.nextval, 3034, '5200 Buffington Rd'  , '', '', 'Atlanta', 'Fulton' , 'GA', '30349', 'USA', 'North America', '', 'N/A', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));

insert into department values (dept_id_seq.nextval, 'Chick-fil-A Exec'      , 'Chick-fil-A Exec'          , '', 3034, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));

insert into employee values (emp_id_seq.nextval, ''    , 'Chick-fil-A'  , '', 'CEO'  , '', '', '', 'G2WR9AHH', '' , 3034, 4065, 'chick-fil-a-ceo@chick-fil-a.com'   , '6505434800', 1  , 'N', 2026, 1, 5000, 'pass', 'test', to_date('2012-07-01','YYYY-MM-DD'), to_date('12-31-9999', 'MM-DD-YYYY'), 'N');

insert into employee values (emp_id_seq.nextval, ''    , 'Chick-fil-A'  , '', 'VP'  , '', '', '', 'H2WR9ACS', '' , 3034, 4065, 'chick-fil-a-vp@chick-fil-a.com'   , '6505434800', 6099  , 'N', 2026, 1, 5000, 'pass', 'test', to_date('2012-07-01','YYYY-MM-DD'), to_date('12-31-9999', 'MM-DD-YYYY'), 'N');

update employee set manager_id=6100 where emp_id in (6092, 6094);
update employee set manager_id=6099 where emp_id=6100;

--add free text question for this company so users can enter pulses
insert into question_category values (93, 3034, 'Generic Question Category', 'Generic question category for pre-defined questions users will see in PulseBox', sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));

insert into question values (24, 3034, 4065, 'FREE TEXT QUESTION', 93, 12001, 13000, 1, 10, 1, sysdate, to_date('12-31-9999', 'MM-DD-YYYY'));




commit;

-- set scan back on
set scan on;





