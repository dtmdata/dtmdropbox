

set lines 200
set pages 200
col event_date for a10
col event_name for a30
col event_desc for a30
col event_type for a30

SELECT 
to_char(event_date, 'YYYYMMDD') as EVENT_DATE, event_name, event_desc, event_type
FROM event
WHERE company_id = &Enter_CompanyID
ORDER BY 
   EVENT_DATE asc
;

