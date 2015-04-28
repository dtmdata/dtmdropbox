/*
*************************************************************************************************
==> show all data to paid PBox customers in graphical format.
or, pay-up to get raw data output....?  or just don't offer raw data reports at all?


1) what is current/Past participation rate of the Company?   
	--show Time series part.rate


defintion:
The 'participation' should be based on distinct(emps), not #questions
--do historical here too, cumulative running total as time increases. ??




*************************************************************************************************
*/



/* 
BASIC rpt:  show overall company participation *rate* 
*/
--First, validate that a manager is running report, and store his Company_ID.
--Then, run below sql, passing in the Company_ID:

--entire Company, just Emps with Answers:
--INNER join
select 
	   count(*), a.emp_id, e.emp_id, e.company_id
from 
   Answer   A,
   Employee E
where
                 E.emp_id = A.emp_id		--INNER join here, i.e. show just the question Responders
   and         company_id = &Enter_CompanyID 	--e.g. 300=Facebook
-- similarly, can add in DeptID filter
--   and Q.category_id in(<list of relevant Q_IDs>)
group by 
	a.emp_id, e.emp_id, e.company_id   
order by 
   1 desc
;


--OUTER
select 
	count(*), a.emp_id, e.emp_id, e.company_id
from 
   Answer   A,
   Employee E
where
                 E.emp_id = A.emp_id(+)		--need OUTER join here
   and         company_id = &Enter_CompanyID 	--e.g. 300=Facebook
-- similarly, can add in DeptID filter
--   and Q.category_id in(<list of relevant Q_IDs>)
group by 
	a.emp_id, e.emp_id, e.company_id  
order by 
   1 desc
;


--how many Questions does this company have available to answer?
select count(*) TOT_QUESTIONS
from question
where 
company_id = &Enter_CompanyID
;


--how many employees have answered questions for their company?
select count(*) from (
SELECT count(A.emp_id), Q.company_id 
FROM answer A, question Q
WHERE 
    A.question_id = Q.question_id
and Q.company_id  = &Enter_CompanyID
GROUP BY 
A.emp_id, Q.company_id   --leaving company_id here in case want to use this for comparing ALL companies
--ORDER BY EMP_ID asc
)
;



--which employees have answered questions >1x for their company?
--(spike here might be a flag here for someone in this company)
SELECT count(*), Q.question_id, A.emp_id, Q.company_id 
FROM answer A, question Q
WHERE 
    A.question_id = Q.question_id
and Q.company_id  = &Enter_CompanyID
GROUP BY 
Q.question_id, A.emp_id, Q.company_id  --leaving company_id here in case want to use this for comparing ALL companies
ORDER BY A.emp_id, count(*) desc   
;



--which employees have answered questions >1x for their company, ON SAME DAY ?
--(spike here might be a flag here for someone in this company)
SELECT count(*), Q.question_id, A.emp_id, trunc(A.answer_date), Q.company_id 
FROM answer A, question Q
WHERE 
    A.question_id = Q.question_id
and Q.company_id  = &Enter_CompanyID
GROUP BY 
Q.question_id, A.emp_id, trunc(A.answer_date), Q.company_id  --leaving company_id here in case want to use this for comparing ALL companies
HAVING count(*) > 1
ORDER BY A.emp_id, count(*) desc   
;



-----> re-do:
--also, do we want to take into account WHEN the Emp actually started/left the company?  i.e. were they legitimate Emp or not?  employee.start_date/end_date 

--1. Numerator
--want cumulative particpation rate, each day includes all previous day's "emp_id" Answer data!!

SELECT distinct(trunc(answer_date)) ANSWER_DATE
    FROM
	Answer   A1,
	Employee E1
    WHERE 
	A1.emp_id = E1.emp_id
	and E1.company_id = &Enter_Company_ID
;




SELECT distinct(to_char(A1.answer_date,'YYYYMMDD')) ANSWER_DATE, A1.emp_id 
    FROM
	Answer   A1,
	Employee E1
    WHERE 
	A1.emp_id = E1.emp_id
	and E1.company_id = &Enter_Company_ID
group by  to_char(A1.answer_date,'YYYYMMDD'), A1.emp_id
order by 1 ASC
;

--run plsql against above CURSOR, then accumulate the #s into temp table









select * from
(
SELECT 
	distinct(A.emp_id), X.ANSWER_DATE
--	(A.emp_id) , X.ANSWER_DATE
FROM 
   Answer   A,
   Employee E,
   (SELECT distinct(trunc(answer_date)) ANSWER_DATE
    FROM
	Answer   A1,
	Employee E1
    WHERE 
	A1.emp_id = E1.emp_id
	and E1.company_id = &&Enter_Company_ID
   ) X
WHERE 
          A.emp_id = E.emp_id
and   E.company_id = &&company_id   --ensure looking JUST at this guys' company!!!  dont mix/match company data!!
--and A.answer_date >=E.start_date and A.answer_date <= E.end_date
and A.answer_date <= X.ANSWER_DATE  --add this back in when our E dates are all in-sync with our A dates
GROUP BY
	A.emp_id , X.ANSWER_DATE
ORDER BY X.ANSWER_DATE

) Z
from DUAL
;


--This will give, for a specific company, a unique date list, which can be Cartesian-joined with each of the Numerator and Denominator Selects,
--to provide time-cumulative results, when you add into WHERE clause: <=(that distinct date list).
(
SELECT distinct(trunc(answer_date)) ANSWER_DATE
FROM
	Answer   A,
	Employee E
WHERE 
	A.emp_id = E.emp_id
	and E.company_id = &Enter_Company_ID
ORDER BY ANSWER_DATE 
)  ans_dt



select 
	count(distinct(a.emp_id)), trunc(A.answer_date)
from 
   Answer   A
group by trunc(A.answer_date)



--2. Denominator: this should give the total # Employees active in the specific Company, on each date where there is an Answer row for someone in THAT Company.
select 
	count(distinct(e.emp_id))
from 
   Employee E
where 
   E.company_id = &&company_id
;


/**/
--====================================================================================
/**/

-----> re-do:
--also, do we want to take into account WHEN the Emp actually started/left the company?  i.e. were they legitimate Emp or not?  employee.start_date/end_date 

--1. Numerator
--want cumulative particpation rate, each day includes all previous day's "emp_id" Answer data!!

SELECT distinct(trunc(answer_date)) ANSWER_DATE
    FROM
	Answer   A1,
	Employee E1
    WHERE 
	A1.emp_id = E1.emp_id
	and E1.company_id = &Enter_Company_ID
;

--2. Denominator: 

create table olap_pulse_pct_participation as
SELECT distinct(to_char(A1.answer_date,'YYYYMMDD')) ANSWER_DATE, A1.question_id QUESTION_ID, A1.emp_id EMP_ID, &&Enter_Company_ID COMPANY_ID
FROM
	Answer   A1,
	Employee E1
WHERE 
	A1.emp_id = E1.emp_id
	and E1.company_id = &&Enter_Company_ID 
GROUP BY to_char(A1.answer_date,'YYYYMMDD'), A1.question_id, A1.emp_id  
ORDER BY 1,2,3 
;


--run plsql against CURSOR b/o above CTAS, accumulating results into a temp table, e.g. olap_pulse_pct_participation



--gives proper cumul.# for each date tested:
--now, add-in ANS_DTs to SQL...
SELECT count(distinct(A.emp_id)) --, to_char(A.answer_date, 'YYYYMMDD') ANS_DT
FROM 
answer A, 
employee E
WHERE 
    A.emp_id = E.emp_id
and to_char(A.answer_date, 'YYYYMMDD') <= '20140203' --'20130509' --'20120710' 
and E.company_id  = &&Enter_CompanyID
--GROUP BY to_char(A.answer_date, 'YYYYMMDD') , E.emp_id  ORDER BY ANS_DT
;

-- /****** WOOOOOT !  works  ******/
select  count(distinct(X.EMP_ID)) , C.ANSWER_DATE
FROM 
(SELECT A.emp_id EMP_ID, to_char(A.answer_date, 'YYYYMMDD')  ANS_DT
FROM 
answer A, 
employee E
WHERE 
    A.emp_id = E.emp_id
and E.company_id  = &&Enter_CompanyID
) X,
(SELECT distinct('20120707') ANSWER_DATE
 FROM dual  
) C  --get correct answers for single date test!
where
X.ANS_DT <= C.ANSWER_DATE
GROUP BY  C.ANSWER_DATE


--full working NUMERATOR....WORKS!!
select  count(distinct(X.EMP_ID)) , C.ANSWER_DATE
FROM 
(SELECT A.emp_id EMP_ID, to_char(A.answer_date, 'YYYYMMDD')  ANS_DT
FROM 
answer A, 
employee E
WHERE 
    A.emp_id = E.emp_id
and E.company_id  = &&Enter_CompanyID
) X,
(SELECT distinct(to_char(answer_date,'YYYYMMDD')) ANSWER_DATE
    FROM
	Answer   A1,
	Employee E1
WHERE 
	A1.emp_id = E1.emp_id
	and E1.company_id = &&Enter_Company_ID
order by 1 ASC
) C 
where
X.ANS_DT <= C.ANSWER_DATE
GROUP BY  C.ANSWER_DATE
order by C.ANSWER_DATE
;


/***********************************/
/*  100% WORKS!!                   */
/***********************************/

SELECT
count(distinct(X.EMP_ID)) / 
(SELECT count(distinct(e.emp_id)) FROM employee E WHERE E.company_id  = &&Enter_CompanyID
)  as PCT_PARTICIPATION ,
--NUMER,
--DENOM,
C.ANSWER_DATE
FROM 
(SELECT A.emp_id EMP_ID, to_char(A.answer_date, 'YYYYMMDD')  ANS_DT
 FROM Answer A, Employee E
 WHERE  A.emp_id = E.emp_id
    and E.company_id  = &&Enter_CompanyID
) X,
(SELECT distinct(to_char(answer_date,'YYYYMMDD')) ANSWER_DATE
 FROM  Answer A1, 	Employee E1
 WHERE  A1.emp_id = E1.emp_id
	 and E1.company_id = &&Enter_Company_ID
) C   --cartesian list of dates
WHERE  X.ANS_DT <= C.ANSWER_DATE
GROUP BY  C.ANSWER_DATE
ORDER BY C.ANSWER_DATE
;

