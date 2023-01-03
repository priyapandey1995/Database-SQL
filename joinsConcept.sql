create database student;
use student;
create table user
(UserId int,
Username varchar(50),
primary key(UserId)
);
select * from user;
insert into user(UserID,Username) values
('1','priya'),
('2','abhi'),
('3','neha'),
('4','somu'),
('5','billi');
drop table user;
alter table user add userAge varchar(10) after Username;
update user set Userage=26 where  userId=5;

create table playlist
(UserId int,
PlaylistId int primary key,
PlaylistName varchar(30),
foreign key(UserId) references User(UserId)
);
drop table playlist;

select * from playlist;

insert into playlist(UserId,PlaylistId,PlaylistName) values
('1','101','Devotional Songs'),
('2','102','Hit Songs'),
('3','103','Pop music'),
('4','104','old Hit Songs');

select * from user left join playlist on User.UserId=playlist.PlaylistId;


create table tracks
(PlaylistId int,
TrackId varchar(10) primary key,
foreign key(PlaylistId) references playlist(PlaylistId)
);
drop table tracks;
select * from tracks;
Alter table tracks add trackName varchar(20);
insert into tracks(PlaylistId,TrackId,trackName) values
('101','a1','abc'),
('102','b1','bcd'),
('103','c1','cde');

select * from user left join playlist on User.UserId=playlist.UserId;
select * from user right join playlist on User.UserId=playlist.UserId;
select * from user inner join playlist on User.UserId=playlist.UserId;

select * from playlist left join tracks on playlist.PlaylistId=tracks.PlaylistId;
select * from playlist right join tracks on playlist.PlaylistId=tracks.PlaylistId;
select * from playlist inner join tracks on playlist.PlaylistId=tracks.PlaylistId;

create database functions;
use functions;
create table student
(studentid int primary key,
studentName varchar(30),
department varchar(30)
);
select * from student;
Alter table student add salary int;
insert into student(studentid,studentName,department,salary) values
('1','priya','cs','25000'),
('2','abhi','bsc','30000'),
('3','neha','cs','28000'),
('4','somu','cs','35000'),
('5','billi','cs','25000');

select count(StudentId) total from student;

select sum(StudentId) as sum from student;
select sum(salary) as totalsalary from student;

select avg(StudentId) avg_of from student;
select avg(salary) AverageSalary from student;

select max(StudentId) max_of from student;
select max(salary) MaxofSalary from student;

select min(StudentId) min_of from student;
select min(salary) MinofSalary from student;

select department total from student group by Department;

select count(StudentId),Department total from student group by Department order by StudentId desc;
