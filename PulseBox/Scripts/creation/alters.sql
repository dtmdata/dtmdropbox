alter table company add (foreign key (location_id) references location (location_id) enable validate);
alter table company add (foreign key (parent_company_id) references company (company_id) enable validate);
alter table company add (foreign key (company_contact_id) references employee (emp_id));
alter table company add (foreign key (location_id, company_id) references location (location_id, company_id) enable validate);

alter table mm_industry_company add (foreign key (industry_id) references industry (industry_id) enable validate);
alter table mm_industry_company add (foreign key (company_id) references company (company_id) enable validate);

alter table department add (foreign key (company_id) references company (company_id) enable validate);

alter table event_category add (foreign key (company_id) references company (company_id) enable validate);

alter table event add (foreign key (company_id, dept_id) references department (company_id, dept_id) enable validate);
alter table event add (foreign key (category_id, company_id) references event_category (category_id, company_id) enable validate);

alter table question_category add (foreign key (company_id) references company (company_id) enable validate);

alter table question add (foreign key (type_id) references question_type (type_id) enable validate);
alter table question add (foreign key (source_id) references question_source (source_id) enable validate);
alter table question add (foreign key (company_id) references company (company_id) enable validate);
alter table question add (foreign key (dept_id) references department (dept_id) enable validate);
alter table question add (foreign key (category_id, company_id) references question_category (category_id, company_id) enable validate);

alter table employee add (foreign key (dept_id) references department (dept_id) enable validate);
alter table employee add (foreign key (company_id) references company (company_id) enable validate);
alter table employee add (foreign key (manager_id) references employee (emp_id) enable validate);
alter table employee add (foreign key (location_id) references location (location_id) enable validate);
alter table employee add (foreign key (priv_id) references priv (priv_id) enable validate);
alter table employee add (foreign key (user_type_id) references user_type (user_type_id) enable validate);

alter table answer add (foreign key (emp_id) references employee (emp_id) enable validate);
alter table answer add (foreign key (question_id, company_id) references question (question_id, company_id) enable validate);

alter table notification add (foreign key (company_id) references company (company_id) enable validate);
alter table notification add (foreign key (dept_id) references department (dept_id) enable validate);


--commmenting next constraint out as it really tightens things and causes lots of bad data
--alter table answer add (foreign key (emp_id, company_id, dept_id) references employee (emp_id, company_id, dept_id) enable validate);

--addt'l alters for ANSWER are in RUNALL.SQL=>ALTERS_SPECIAL1.SQL

alter table priv add (foreign key (company_id) references company (company_id) enable validate);



