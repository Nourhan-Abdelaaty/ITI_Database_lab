
------1
create proc getNum @DeptName varchar(20)
as
select count(Student.St_Id)
from Department inner join Student
on Department.Dept_Id=Student.Dept_Id
group by Department.Dept_Name
having Department.Dept_Name=@DeptName

--execute getNum 'java'
---------2
go

create proc Pro1 @id int
as
 if(   (select count(Works_for.ESSn)
    from Works_for 
     where Pno=@id) >=3 )
	 select 'No of Employees more than 3'
	 else  select  Employee.Fname+' '+
	  Employee.Lname+'Employee work for project'+convert(varchar(10),@id)
	 from  Employee
	 inner join Works_for 
     on Employee.SSN=Works_for.ESSn
	 where Works_for.Pno=@id

--execute Pro1 100
----------3 
	 go

create proc chgEmp @oldid int ,@newid int ,@pnum int
as
update Works_for set ESSn=@newid , Pno=@pnum
where ESSn=@oldid
---exec chgEmp 102673 ,102673, 100
-----------4
go 

create table Adit (ProjectNo int , 
UserName nvarchar(50) ,ModifiedDate datetime,Budget_Old bigint ,
Budget_New bigint ) 

go 

create trigger myTrigg
on Project
after update
as
	if update(Budget)
	begin
	declare @num nvarchar(50),@old int,@new int
	select @num=Pnumber from inserted
	select @old=Budget from deleted
	select @new=Budget from inserted
		insert into Adit (ProjectNo, 
UserName ,ModifiedDate ,Budget_Old ,
Budget_New ) 
values(@num,suser_name(),getdate() ,@old,@new)
end

---------5
select * from Department
go
create trigger NoInnsert 
on Department
instead of insert
as
select 'Cannot insert new record in Table'
--insert into Department(Dept_Id) values(86)
----------6

go
create trigger EmpIns
on Employee
after insert
as
   if month(getdate())=3
     rollback
---insert into Employee (Fname,SSN) values ('mo',5856778)
------7

create table studAudit(servername nvarchar(50),dat date,note nvarchar(50))
go
create trigger stadd
on Student
after insert
as
declare @note int
select @note=St_Id from inserted

insert into studAudit(servername,dat,note)
     values(@@SERVERNAME,GETDATE(), suser_name()+'insert new row with key='+CONVERT(varchar(5),@note))


--insert into student (st_id) values(687)
--select * from studAudit
----8
go
 create trigger stddele
on Student
instead of  delete
as
declare @note int
select @note=St_Id from deleted

insert into studAudit(servername,dat,note)
     values(@@SERVERNAME,GETDATE(), 'try to delete row with key='+CONVERT(varchar(5),@note))
