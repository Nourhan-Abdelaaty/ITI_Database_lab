create database lab6

create table instructor (
id int primary key identity ,
salary int default 3000 ,
overtime int unique ,
BD date ,
fname varchar(30) ,
lname varchar(30) ,
address varchar(30) ,
hiredate date default getdate() ,
age as (year(getdate())-year(BD)) ,
netsalary as(isnull(salary,0)+isnull(overtime,0)) persisted ,
constraint c10 check (address in ('alex','cairo')),
constraint c11 check (salary  between 1000 and 5000),

)

create table course (
id int primary key identity,
cname varchar(30),
duration int unique ,

)

create table lab (
lid int identity,
cid int ,
location varchar(30),
capacity int check (capacity <20) ,
constraint c8 primary key (cid,lid),
constraint c1 foreign key (cid) references course(id)
on delete  cascade on update cascade

)

create table teach (
cid int foreign key references  course (id) on delete cascade on update cascade ,
iid int  foreign key references  instructor (id) on delete cascade on update cascade ,
constraint c33 primary key (cid,iid)
)