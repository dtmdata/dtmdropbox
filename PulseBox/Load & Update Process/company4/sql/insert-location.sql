insert into location(location_id,company_id,address1,address2,address3,city,county,state,postal_code,country,continent,start_date,end_date)
select location_id_seq.nextval,1,a.address1,a.address2,a.address3,a.city,a.county,a.state,a.postal_code,a.country,a.continent,sysdate,to_date('12-31-9999','mm-dd-yyyy')
from location_temp a;