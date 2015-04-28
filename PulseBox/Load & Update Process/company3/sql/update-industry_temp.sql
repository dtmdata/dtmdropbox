update industry_temp a set industry_id= (select b.industry_id from industry b where a.industry_name=b.industry_name);
update industry_temp  set company_id=(select company_id from company where company_name='&my_company');
commit;