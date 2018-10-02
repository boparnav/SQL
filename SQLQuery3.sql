use HR;
Go
select * from employees;
select * from employees order by first_name,last_name desc;
select COUNT (employee_id) from employees where commission_pct is NULL;
select max (salary) from employees ;
select first_name,last_name from employees where salary=24000;

-----using subquery---
-----OR----
select first_name,last_name from employees where salary=(select max (salary) from employees) ;

select department_name from departments  as D INNER JOIN  locations as L On D.location_id=L.location_id where state_province='california';
------subquery----
select department_name from departments where location_id=(
select location_id from locations where state_province='california');

------Count the no of salaried employees in each department----


select department_id,COUNT (*) from employees WHERE commission_pct IS NULL Group by department_id;