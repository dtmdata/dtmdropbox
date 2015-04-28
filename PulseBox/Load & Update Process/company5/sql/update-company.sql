update company a  set a.location_id = (select b.location_id from location b where b.company_id=a.company_id) where a.company_name='&my_company';
commit;