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
