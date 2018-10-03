use HR;
Go
select * from employees;
select* from jobs;
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


------OR ------
Select first_name from employees where first_name like '%k%' ;

-----stored procedure----

create procedure Addition
			 @num1 int,@num2 int,@num3 int,
			  @result int out
			  As 
			  SET @result =@num1+@num2+@num3



			  declare  @result  int
			  exec Addition 9,4,5, @result  out
	select  @result ;



-----Function---
 Create function  FunctionForToatl(@val1 int, @val2 int,@val3 int)
 Returns Int
 AS
 BEGIN
       Declare @total int
	    SET @total=@val1+@val2+@val3
		RETURN @total
		END
		select dbo.FunctionForToatl (3,4,5);
------Average----
Create function  FunctionForAvg(@val1 int, @val2 int,@val3 int)
 Returns Int
 AS
 BEGIN
       Declare @Avg int
	    SET @Avg=(@val1+@val2+@val3)/3
		RETURN @Avg
		END
		select dbo.FunctionForAvg (3,4,5);



		----Create aTable valued function that returns a list of emoplyees from a specific department---
		Create function EmployeeList(@departmentname varchar(30))
		Returns table
		As 
		
			return(select First_name,last_name from employees AS E  INNER JOIN departments AS D
			 ON  E.department_id=D.department_id where D. department_name= @departmentname
			);

		select* from employeelist('IT');

		select* from employeelist('Purchasing');
			---query
			select First_name,last_name from employees AS E  INNER JOIN departments AS D
			 ON  E.department_id=D.department_id where D. department_name='IT'



			 select First_name,last_name from employees AS E  INNER JOIN departments AS D
			 ON  E.department_id=D.department_id where D. department_name='Shipping'


----write a table valued function for difference b/w max salary and min salary for a specific jib title---
   Create function DifferSalary (@jobtitle varchar(35))
		Returns table
		As 
		
			return(select max_salary-min_salary AS difference from jobs 
			 where job_title=@jobtitle);

		select* from DifferSalary ('Public Accountant');


		-----String Function----
		select  UPPER ('navdeep');
		select LOWER ('NAVDEEP');
		select LEN ('Hello World');
		Select SUBSTRING ('Hello',1,2);

		select SUBSTRING (first_name,1,1)+last_name as  'FullName'    from employees;


			------Current date and time---
			Select SYSDATETIME();
			Select DATEPART(YEAR,'2007-10-30');
			Select DATEPART(MONTH,'2007-10-30');
			Select DATEPART(DAY,'2007-10-30');
----Find no. of employee hired in 2005----
   Select COUNT(*) from employees  where  DATEPART(YEAR,HIRE_DATE) ='2005';


   select first_name,last_name ,DATEDIFF( YEAR,HIRE_DATE,SYSDATETIME())
    AS Experience
	 FROM employees;
    -----list the country located in Europe (subquery)--
	select* from countries;
	select country_name from countries where region_id=(select region_id  from  regions where region_name='Europe');