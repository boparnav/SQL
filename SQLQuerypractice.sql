create database studentrecord;
use studentrecord;
create table student( id int NOT NULL,
						status varchar(20)  NULL default 'enrolled',
						Name  varchar(20) NOT NULL,
						email varchar(20) NOT NULL,);
drop table student;

insert into student values(1,'enrolled','john','john@gmail.com');
insert into student values(2,'enrolled','Marry','marry@gmail.com');
insert into student values(3,'enrolled','Alex','alex@gmail.com');
insert into student(id,name,email) values(2,'Marry','marry@gmail.com');
select *from student;