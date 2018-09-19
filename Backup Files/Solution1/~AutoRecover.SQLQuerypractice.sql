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