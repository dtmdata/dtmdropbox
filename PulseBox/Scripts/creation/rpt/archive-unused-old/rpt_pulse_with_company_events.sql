/*

5) Lastly, I would have a simple report that displays (#1 report = rpt_pulse_company.sql ; Overall Company with Event table data) pulse, 
and shows 3-4 events also on same graph/report.  
This could be called the Major Event Pulse Report or something.  
The point of this would be to tie major events such as hiring of new CIO to company pulse!  

NOTE: 
Can either: 
1) use UNION ALL and tweak SQL from 'rpt_pulse_company.sql' file so columns match up, -OR-
2) run 'rpt_pulse_company.sql' and 'rpt_show_company_events.sql' separately 
	but plot output of each onto same chart.
#1) shown below for example.


select dummy, 'foobar' as EXTRA_STUFF from dual
union all
select dummy, to_char(sysdate, 'YYYYMMDD.HH24MISS') from dual
union all
select dummy, NULL from dual
; 

*/


--entire Company, by Date:
set lines 200
set pages 200
col event_name for a30
col event_desc for a30
col event_type for a30

select 
   to_char(A.answer_date,'YYYYMMDD') as ANS_EV_DATE, 
   NULL as EVENT_NAME,
   NULL as EVENT_DESC,
   NULL as EVENT_TYPE,
   count(*) COUNT, 
   avg(A.answer_rating) AVG, 
   min(A.answer_rating) MIN, 
   max(A.answer_rating) MAX, 
   stddev(A.answer_rating) STDDEV, 
   variance(A.answer_rating) VARIANCE
from 
   Answer A,
   Employee E
where
                 A.emp_id = E.emp_id 
   and         company_id = &Enter_CompanyID  --e.g. 300=Facebook
-- similarly, can add in DeptID filter
--   and Q.category_id in(<list of relevant Q_IDs>)
--   and "date" >= sysdate -30    --show DEFAULT of 30 days; GUI selected??
group by 
   to_char(A.answer_date,'YYYYMMDD')
UNION ALL
select 
to_char(event_date, 'YYYYMMDD') as ANS_EV_DATE, event_name, event_desc, event_type, NULL, NULL, NULL, NULL, NULL, NULL 
from event
where company_id = &Enter_CompanyID
order by 
   ANS_EV_DATE asc
;

