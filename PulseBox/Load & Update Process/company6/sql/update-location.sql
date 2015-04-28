update location  set company_id=(select company_id from company where company_name='&my_company') where company_id=1 and  city!='Sample City';
commit;