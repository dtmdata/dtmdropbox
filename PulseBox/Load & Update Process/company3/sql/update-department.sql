update department a set a.company_id = (select company_id from company b where a.company_name=b.company_name) and a.company_name='&my_company';
commit;