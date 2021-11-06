create database s204361124
go
use s204361124
create table Student
(
    Sno char(10) not null,
    Sname char(10),
    Ssex char(2),
    Sage tinyint,
    Sdep char(10),
    primary key(Sno)
)
go
create table Course
(
    Cno char(10) ,
    Cname char(10),
    Cpno tinyint ,
    Ccredit char(10),
    primary key(Cno)
)

create table SC
(
  Sno char(10) not null ,
  Cno char(10) ,
  Grade tinyint ,
  primary key(Sno,Cno),
  constraint fkey1 foreign key(Sno) references Student(Sno),
  constraint fkey2 foreign key(Cno) references Course(Cno),
  constraint c1 check(Grade>=0 and Grade<=100)
)
alter table Course add  ss tinyint

alter table Course drop column ss

alter table Course alter column Cno char(30)

drop table SC

alter table Student alter column Ssex char(10)

create table Student1
(
    Sno char(8) primary key nonclustered,
    Sname char(10),
    Ssex char(2),
    Sage tinyint,
    Sdep char(10),
    --primary key(Sno) nonclustered
)
go
create unique index index1
on Student(Ssex)
go
create index index2
on Student(Sage)
go
drop index Student.index2
go
insert into Student
values('204361127','张三','男','20','CS')
go
insert into Student
values('204361126','李四','男','19','AS')
go
insert into Student
values('204361129','王五','男','30','AS')
go
select Sno,Sage--找出每个系的最大年龄
from Student stu1
where stu1.Sage=(
select MAX(Sage)
from Student stu2
where stu2.Sdep=stu1.Sdep
)
go
select *from Student
go 
select *from SC 
go
select *
from Student,SC
where Student.Sno=SC.Sno
go
select *from Course
go
alter table Student alter column Sno char(20)
drop index Student.index1
go
delete from Student
where Sno='2043611';
go
update Student
set Sdep='CS'
where Sno='204361129'
go
insert SC
values('204361127','语文','90')
go
insert SC
values('204361126','数电','91')
go
insert Course
values('语文','sd','90','as')
go
insert Course
values('数电','sd','90','as')
go
alter table SC drop constraint c1
alter table SC add constraint c1 check(Grade>=0 and Grade <=100)
alter table SC drop constraint fkey1
alter table SC drop constraint fkey2
go
alter table Course alter column Cno char(8) not null
go
alter table SC add primary key(Sno,Cno)
go
select Sname from Student
--where Sname='苏静';
go
--对Sno分组算Sage的个数
select Ssex,count(Sage)
from Student
group by Ssex
go
alter table Student drop column Sdep
go
alter table Student add Sdep char(10)