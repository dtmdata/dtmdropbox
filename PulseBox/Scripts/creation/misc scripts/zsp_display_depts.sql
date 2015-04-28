create or replace procedure     display_depts (in_company_id number)
is
/* proc will display all departments for a given company_id... must pass in company_id as a parameter */
/* A. Ebadi 12/2014 */

v_temp number := 0;

cursor c1 is
  select dept_name from department
  where company_id= in_company_id;

begin

/* make sure valid db user */
select count(*) into v_temp
from department
where company_id = in_company_id;
if v_temp=0
then
  dbms_output.put_line('Company ID '||in_company_id||' does not exist!');
  return;
end if;

dbms_output.put_line('*');
dbms_output.put_line('*');
dbms_output.put_line('*******************************************************');
dbms_output.put_line('Departments Found for Company ID: '||in_company_id||':');
dbms_output.put_line('*******************************************************');

for c1_rec in c1 loop
dbms_output.put_line(c1_rec.dept_name);

end loop;

end display_depts;