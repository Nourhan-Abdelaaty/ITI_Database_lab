------------1
create view GradV(fullName,Course)
as
select student.St_Fname +' '+ Student.St_Lname ,Course.Crs_Name
from Student inner join Stud_Course 
on Student.St_Id=Stud_Course.St_Id
inner join Course
on Course.Crs_Id=Stud_Course.Crs_Id
where Stud_Course.Grade>50

-- select fullName,Course from GradV
-----------------2
go 
create view InsTeach
with encryption
as
select Instructor.Ins_Name ,Topic.Top_Name
from Department inner join Instructor
on Department.Dept_Id=Instructor.Ins_ID
 inner join Ins_Course
on Instructor.Ins_Id=Ins_Course.Ins_Id
inner join Course
on Course.Crs_Id=Ins_Course.Crs_Id
inner join 
Topic
on Topic.Top_Id=Course.Top_Id
where Department.Dept_Manager=Instructor.Ins_Id

--select Ins_Name , Top_Name from InsTeach
---------3
go 
create view DepSDJav
as
select Instructor.Ins_Name,Department.Dept_Name
from Instructor inner join Department
on Department.Dept_Id=Instructor.Dept_Id
where Department.Dept_Name in ('SD','Java')

--select Ins_Name, Dept_Name from  DepSDJav
---------4
go
create view V1
as
select * from Student 
where St_Address in ('Cairo','alex')
with check option

--select * from V1 
----------5
go
create view EmpNum(PName,EmpNum)
as
select Project.Pname ,count(Employee.SSN)
from Departments inner join Employee
on Departments.Dnum=Employee.Dno
inner join Project
on Departments.Dnum=Project.Dnum
group by Project.Pname

--select * from EmpNum
------------6
go
create schema Company
create schema HumanResource
alter schema Company transfer Departments
alter schema HumanResource transfer Employee
select * from Company.Departments
---------------7
go
create clustered index ind on Department(Manager_hiredate)
--can not create because theires an id has clustred index

------------------8
go
 create unique index i3 on Student(st_age) 
---cannot applaied because age values duplicated not unique

---------9
declare c1 cursor 
for select Salary from HumanResource.Employee
for update
declare @sal int 
open c1
fetch c1 into @sal
while @@fetch_status=0
  begin
  if @sal>3000
       update HumanResource.Employee
	     set Salary=@sal*1.20
	    where current of c1
	  else 
	     update HumanResource.Employee
	       set Salary=@sal*1.30
	    where current of c1
      fetch c1 into @sal
  end
  close c1
  Deallocate c1

--------10 
go

declare c2 cursor
for 
 select Instructor.Ins_Name ,Department.Dept_Name from 
 Department inner join Instructor
 on Instructor.Ins_Id=Department.Dept_Manager
 for read only
 declare @deptnam nvarchar(20) , @insNam nvarchar(20)
 open c2
 fetch c2 into @insNam , @deptnam
 while @@fetch_status=0
 begin
 select @deptnam,@insNam
 fetch c2 into @insNam , @deptnam
 end
 select @deptnam,@insNam
 close c2
 Deallocate c2
 ----------11
 go 
 declare c3 cursor
 for 
 select ins_name from Instructor
 for read only
 declare @n nvarchar(max),@cn nvarchar(20)
 open c3
 fetch c3 into @cn
 while @@FETCH_STATUS=0
 begin
 set @n=concat(@n,',',@cn)
 fetch c3 into @cn
 end
 select @n
 close c3
 deallocate c3