-- ejet database --
create database Ejet;
use Ejet;

create table Engineer_Details(Engineer_ID int ,
Engineer_Name varchar(50),
Mobile_Number varchar(10),
Qualification varchar(50),
Experience varchar(20),
Primary key(Engineer_id));
 
 Insert into  Engineer_Details(Engineer_ID,Engineer_Name,Mobile_Number,Qualification,Experience)
 values(1,'priya',8884327526,'b.tech','1 years'),
 (2,'neha',8889789652,'b.tech','2 years'),
 (3,'abhi',9008938916,'b.tech','3 years'),
 (4,'somu',9886322224,'b.tech','4 years');
select * from Engineer_Details;

ALTER TABLE Engineer_Details ADD Salary varchar(50) AFTER Age;
UPDATE Engineer_Details set salary =35000 where Engineer_Name='somu';

-- Second table --
create table contact_details(Engineer_ID int, contact_id int primary key,foreign key(Engineer_ID) 
references Engineer_Details(Engineer_ID));

insert into contact_details(Engineer_ID,contact_id) values (1,112),(2,113),(3,114),(4,115);
select * from contact_details;

-- 4.Stored Procedures -- 

-- 1.get all details -- 
call get_details;

-- 2. insert -- 
call insert_details(5,'piku','897865432','b.tech','1 years');

-- 3.update -- 
call update_details(8978675642,'piku');

-- 4 delete -- 
call delete_detials(5);

-- 5 get and update  -- 
call get_all_details('priya',@total);
select @total;

-- constraints -- 
-- not null --
ALTER TABLE Engineer_Details MODIFY COLUMN Mobile_Number varchar(10) not null;

-- UNIQUE -- 
ALTER TABLE Engineer_Details ADD UNIQUE(Engineer_Name);

-- Primary key -- 
create table Engineer_Details(Engineer_ID int ,
Engineer_Name varchar(50),
Mobile_Number varchar(10),
Qualification varchar(50),
Experience varchar(20),
Primary key(Engineer_id));

-- Foreign Key -- 
create table contact_details(Engineer_ID int, contact_id int primary key,foreign key(Engineer_ID) 
references Engineer_Details(Engineer_ID));

 -- Check -- 
 ALTER TABLE Engineer_Details ADD check (Age>=18);

-- default -- 
ALTER TABLE Engineer_Details ALTER Experience SET DEFAULT '2 years';

-- Auto-Increment--
ALTER TABLE Engineer_Details AUTO_INCREMENT =100;

-- INNER JOIN --
SELECT Engineer_Details.Engineer_Name
FROM Engineer_Details
Inner JOIN contact_Details ON Engineer_Details.Engineer_ID = contact_details.Engineer_ID;

 -- LEFT JOIN -- 
 SELECT contact_details.Engineer_ID
 FROM contact_details
 LEFT JOIN Engineer_Details ON contact_details.Engineer_ID = Engineer_Details.Engineer_ID;

-- Right join --
SELECT Engineer_Details.Qualification
FROM Engineer_Details
Right JOIN contact_Details ON Engineer_Details.Engineer_ID = contact_details.Engineer_ID;


-- sub queries -- 
create table Student_Database(Name varchar(50) primary key,Roll_No varchar(50),location varchar(50),phone_Number varchar(50));
select * from Student_Database;
INSERT INTO Student_Database values('priya','200','bangalore','8884327526'),('neha','201','mandya','8884367826'),('abhi','202','chitradugra','8784327526'),('somu','203','bangalore','8884327526');

create table student(Name varchar(50) ,
Roll_No varchar(50),Section varchar(10),
foreign key(Name) references Student_Database(Name));
INSERT INTO student VALUES('priya','200','A'),('neha','201','A'),('abhi','203','b');

-- Display --
SELECT Roll_No FROM Student_Database where Roll_No IN
(SELECT Roll_No FROM student where Section='A'); 

-- INSERT --
	INSERT INTO Student_Database (SELECT Section from student );

-- DELETE -- 
DELETE FROM student
WHERE Name IN(SELECT Name from student_Database WHERE Name='somu');

-- UPDATE --
UPDATE student SET Roll_No ='205' Where 
Roll_No IN (SELECT Roll_No from Student_Database where Name IN('200'));