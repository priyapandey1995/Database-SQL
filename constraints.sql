-- clauses -- 
create database Customer;
use Customer;

create table Customer(customerId varchar(10),customerName varchar(50),contactName varchar(50),Address varchar(50));
insert into Customer(customerId,CustomerName,contactName,Address) values(1,'Priya','Ajinkya','akola'),(2,'neha','gullu','marathalli'),(3,'abhi','prakash','bangalore'),(4,'somu','pramod','khemapur'),(5,'prakash','Reeta','bangalore');

select * from customer;

select * from customer where customerId=1; 
-- where clause -- 
select * from customer where customerId BETWEEN 1 AND 5;

-- Order By --
select customerId from customer ORDER BY customerId DESC;
-- ORDER several Columns -- 
select customerId,customerName from customer ORDER BY customerId,customerName DESC;

-- UNION --
select * from customer;
create table Supplier(supplierId int,supplierName varchar(10),supplierCity varchar(50),Address varchar(50));
insert into Supplier(supplierId,supplierName,supplierCity,Address) values(1,'miki','bangalore','akola'),(2,'kiki','pune','jindal'),(3,'tiki','bangalore','marathalli'),(4,'piku','bangalore','khemapur'),(5,'tinku','bangalore','bannergatta');
select * from supplier;

select Address from customer UNION select Address from supplier ORDER BY Address;

-- Constraints --
-- 1. UNIQUE -- 
create table person(id int not null UNIQUE ,firstName varchar(50) not null, age int);
select * from person;
insert into person(id,firstName,age) values (3,'neha',29),(4,'abhi',27);
 -- CHECK -- 
create table studentData(id int not null,firstName varchar(50) not null,lastName varchar(50) not null, age int CHECK(age<=27));
select * from studentData;
insert into studentData(id,firstName,lastName,age) values (1,'ajinkya','Kambe',28),(2,'priya','pandey',28),(3,'abhi','pandey',27);

-- DEFAULT --
create table studentInfo(id int not null,firstName varchar(50) not null,lastName varchar(50) not null, age int , city varchar(50) not null DEFAULT 'Bangalore');
select * from studentInfo;
insert into studentInfo(id,firstName,lastName,age) values (1,'ajinkya','Kambe',28),(2,'priya','pandey',28),(3,'abhi','pandey',27);

-- AUTO INCREMENT -- 
create table students(id int not null auto_increment,firstName varchar(50) not null,lastName varchar(50) not null, age int , city varchar(50) not null,primary key(id));
insert into students(id,firstName,lastName,age,city) values ('1','ajinkya','Kambe',28,'bangalore');
select * from students;

-- ENUM --
CREATE TABLE MidiDress (  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    name VARCHAR(35),  
    size ENUM('small', 'medium', 'large', 'x-large')  
);  
 
select * from MidiDress;
select name,size from MidiDress where size='medium';

INSERT INTO MidiDress(id, name, size)  
VALUES (1,'priya', 'medium'),  
(2, 'swarna', 3),  
(3, 'neha', 4),  
(4, 'abhi', 'small');

-- not null -- 
 create table foods(foodId int not null,category varchar(50) not null,place varchar(50) );
 select * from foods;
 insert into foods(foodId,category,place) values(1,'puri','U.P'),(2,'mudde','karnataka'),(3,'','punjab');
 update foods set category='parata' where foodId=3;
 insert into foods(foodId,category,place) values(4,'haryana','');