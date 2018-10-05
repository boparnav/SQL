use HR;
GO
-----find employees having salary greater than the average salary
 select first_name ,last_name from employees where salary >(select AVG(salary) from employees);


 select max (salary) from employees;
 -----find the name of employees eho are working as accountant---
 select first_name ,last_name from employees where job_id =(select job_id from jobs where job_title='Accountant');
 select job_id from jobs where job_title='Accountant';

select first_name ,last_name from employees AS E INNER JOIN jobs AS J ON E.job_id=J.job_id where job_title='Accountant';

---find the details of the employee whose first name contain E as second character from the end of the string----
select * from employees where first_name like '%E_';


-----IN Operation---

-----find the manager id from departments shipping,it ,finance




select manager_id from departments where department_name ='shipping'
									OR department_name ='IT'  
									OR department_name ='Finance' ;

select manager_id from departments where department_name IN ('shipping','IT','finance');

-----list the country name in which the region id >1-----
select country_name from countries where region_id >1;


-----list all the department_name of the location in US using subqureies----



select department_name from departments where location_id IN(select location_id  from  locations where country_id ='US');

----Find employees who are manager-----

select first_name,last_name from employees where employee_id IN (
select manager_id from employees);



select * from employees;
    --------JOINING TABLES___

----list all the cities  of region ASIA---


select city from locations AS L   INNER JOIN countries AS C  ON L.country_id=C.country_id INNER JOIN regions AS R ON C.region_id=R.region_id Where
    R.region_name='Asia'; 


	------show the details of those employee who contain letter m in firstname and also display lastname ,city,department name ,state/povince

	 ----- select department_name from departments AS D INNER JOIN employees AS E ON D. department_id=E.department_id INNER JOIN locations AS L ON  D.location_id =L.location_id ;



	  -----select city ,state/province from locations AS L INNER JOIN departments AS D ON 




	  Select E.first_name,E.last_name,D.department_name,L.City,L.state_province from employees AS E
							 INNER JOIN departments AS D
		 ON E.department_id=D.department_id
	INNER JOIN locations AS L 
	    ON L.location_id =D.location_id 
		where E.first_name LIKE '%M%';



--------what is Dan Raphlays department  name---

Select E.first_name,E.last_name, D.department_name from employees AS E INNER JOIN departments AS D 
			ON E.department_id= D.department_id where E.first_name='Den' AND E.last_name='Raphaely';


------Group By ,Having Clause-----
------Show the name of the departments in which the number of employees are more than 3----
  Select count (*)  AS "Employeees",D.department_name from  employees As E 
  INNER JOIN  departments AS D 
   ON D.department_id= E.department_id  
   GROUP BY D.department_name   
   having count(*)>3

  --------show  region name in which the company is working in more than 4 cities---
  ---select count( *) AS "CITIES", R. region_name  from countries AS C
 --  INNER JOIN Regions As R
---  ON  C.region_id =R.region_id 
      --- Group BY R. region_name

Select R.region_name, count (l.city) from locations AS L 
INNER JOIN  countries AS C 
 ON  L.country_id=C.country_id
 INNER JOIN regions As R
 ON C.region_id=R.region_id

 Group By region_name

 HAVING COUNT (l.CITY)>4




 ----CREATE Trigger for Producthistory in which it should not allowed delete option ----
  use HR
    select* from locations;
	   delete from location where location_id=1000;


	   create trigger del_trigger
	   ON locations
	   instead of delete


	   AS 
	   BEGIN 
	   ----raiserror ('you cannot perform delete',16,1);
	   ---rollback


	   raiserror ('you cannot perform delete',12,244);
	   rollback

	   END;
	   



  ------create trigger on sql  server that does not allow to delete database----
   -----CREATE TRIGGER Safedtabase
   ------ON ALL SERVER 
   ------DROP_DATABASE
   ---AS 
   ---BEGIN 
         ----print('you must disable Trigger SafeDatabase to drop database',10,2)

	----ROLLBACK



	---END


