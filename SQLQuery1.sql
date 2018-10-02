use LearningSQL;
select *from employee;
select *from employee order by emp_no  desc;
select *from employee order by emp_fname desc;
select*from works_on;
-- inner join practice

Select employee.emp_fname+employee.emp_lname as emp_fullname,
works_on.project_no,works_on.job from works_on inner join 
employee on works_on.emp_no=employee.emp_no;



--- view example
select*from works_on;
select*from works_on where job!='NULL';
---to delete some values
delete from works_on where emp_no='10102';
----views
create view someview as select * from works_on where job!='NULL';
select * from someview;
---to delete view 
drop view someview;
---- store procedure practice
create procedure sp_d1 as 
select * from employee where dept_no ='d1';
exec sp_d1;

create procedure sp_employees @dept_no_by_user varchar(20) as  
select *from employee employee where dept_no=@dept_no_by_user;
exec sp_employees @dept_no_by_user="d2";

-----clustered index

create clustered index ix_emp_no on employee (emp_no asc);
select* from employee;


----trigger


insert into employee values(3000,'cena','Samantha','d4');

Select * from employee;
create trigger trg_ristrict_user on employee
instead of insert 
AS 

Begin 
 raiserror ('you cannot insert any data, you are not allowed',16,1)
 rollback
 End 