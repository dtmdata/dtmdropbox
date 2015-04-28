insert into company(company_id, company_name, parent_company_id,company_desc,total_employees,product_flavor,start_date,end_date) 
select company_id_seq.nextval, a.company_name, company_id_seq.currval, a.company_desc, a.total_employees, a.product_flavor, sysdate,to_date('12-31-9999','mm-dd-yyyy')
 from company_temp a;