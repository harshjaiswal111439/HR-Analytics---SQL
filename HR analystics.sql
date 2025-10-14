select * from hrdata


--Employee Count:
select sum(employee_count) from hrdata
--where education = 'High School'
--where department = 'Sales'
--where education_field = 'Medical'


--Attrition Count:
select count(attrition) from hrdata
where attrition = 'Yes' and education = 'Doctoral Degree'


--Attrition Rate:
select round((select count(attrition) from hrdata where attrition = 'Yes') / 
sum(employee_count)*100,2) from hrdata


--Active Employee:
select sum(employee_count) - (select count(attrition) 
from hrdata  where attrition='Yes') from hrdata;

--Average Age:
select round(avg(age),0) from hrdata


--ATTRITION BY GENDER
select gender, count(attrition) from hrdata
where attrition = 'Yes' 
group by gender
order by count(attrition) desc


--Department wise Attrition:
select department, count(attrition), round((cast (count(attrition) as numeric) / 
(select count(attrition) from hrdata where attrition= 'Yes')) * 100, 2) as pct from hrdata
where attrition='Yes'
group by department 
order by count(attrition) desc;


--NO OF EMPLOYEE BY AGE GROUP
select age, sum(employee_count) from hrdata
group by age
order by age

--Education Field wise Attrition:
select education_field, count(attrition) from hrdata
where attrition = 'Yes'
group by education_field
order by count(attrition) desc

--Attrition Rate by Gender for different Age Group
select age_band, gender, count(attrition),
round((cast(count(attrition) as numeric)/
(select count(attrition) from hrdata where attrition = 'Yes' ))*100,2) as pct 
from hrdata
where attrition = 'Yes'
group by age_band, gender
order by count(attrition) desc

--Job Satisfaction Rating
CREATE EXTENSION IF NOT EXISTS tablefunc;

SELECT *
FROM crosstab(
  'SELECT job_role, job_satisfaction, sum(employee_count)
   FROM hrdata
   GROUP BY job_role, job_satisfaction
   ORDER BY job_role, job_satisfaction'
	) AS ct(job_role varchar(50), one numeric, two numeric, three numeric, four numeric)
ORDER BY job_role;






