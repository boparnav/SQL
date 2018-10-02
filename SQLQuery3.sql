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

------show the name of the departments along with no of employees in each department

select* from departments;
select department_name, COUNT(*)As "No. of Employee" from departments AS D INNER JOIN employees AS E 
					ON E.department_id =d.department_id group by D.department_name;


------ show the name of the employees who contain a letter K to the firstname---
Select* from employees where first_name like '%k%' ;