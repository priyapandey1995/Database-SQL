create database CQA_112;
use CQA_112;

create table student(id varchar(5) not null,name varchar(50) not null,primary key (id));
select * from student;

-- IN-- alter_the_student
call get_Student_Details; 

-- OUT --
call output_the_gender(@result);
select @result;

-- INOUT -- 
call In_Out_studentId(@Row_Count,1);
select @Row_count;

-- update call procedure  -- 
call update_Email('abc@gmail.com','2');

-- insert new --
call insert_new_details(4,'rinku',10000,'F','student','rinku@gmail.com');

call alter_the_student;

alter table student add email varchar(50) after occupation;
delete from student where id=4;
update student set email="priya@gmail.com" where id=1;
insert into student(id,name,salary,gender,occupation) values (5,'tiku','40000','M','student');
alter table student add occupation varchar(10) not null after gender;

update student set salary="30000" where id=3;
update student set occupation='student' where name="abhi";
truncate table student;

create table contact_details(firstname varchar(50) not null,lastname varchar(5) not null,primary key(firstname));
create table address(zip varchar(50) not null,city varchar(50) not null,state varchar(50) not null,primary key(zip));
create table contact_details_address(firstname varchar(50) not null,zip varchar(50) not null,foreign key(firstname) references contact_details(firstname));
desc contact_details;

desc address;
desc contact_details_address;

insert into contact_details(firstname,lastname) values('priya','pande');
insert into address(zip,city,state) values('560073','bangalore','karnataka');
