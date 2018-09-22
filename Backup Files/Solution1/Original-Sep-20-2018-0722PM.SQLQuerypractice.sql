create database studentrecord;
use studentrecord;
create table student( id int IDENTITY(1,1)primary key,
						status varchar(20)  NULL default 'enrolled',
						Name  varchar(20) NOT NULL,
						email varchar(20) NOT NULL,
						age integer not null
						check( age between 18 and 65));
drop table student;
insert into student values(1,'enrolled','john','john@gmail.com');
insert into student values(2,'enrolled','Marry','marry@gmail.com');
insert into student values(3,'enrolled','Alex','alex@gmail.com');
select *from student;


(" to show autoincrement in table ")

insert into student(name,age,email) values('Marry',19,'marry@gmail.com');
select *from student;


use LearningSQL;
select dept_no, emp_no from employee;
select distinct dept_no from employee;
select Count(distinct dept_no) from employee;
select dept_no from employee group by dept_no;
select count (dept_no) from employee group by dept_no;
Select * from works_on;
Select project_no, count(project_no) as 'No. of Employee' from works_on group by project_no;

alter table students
 alter column phone integer