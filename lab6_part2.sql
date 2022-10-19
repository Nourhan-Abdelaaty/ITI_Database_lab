-----functions 
--1
create function getmonth(@date date )
returns varchar(30)
begin
declare @m varchar(30)=format(@date ,'MMMM')
return @m
end
go
-----4
create function checkname(@id int ) 
returns varchar(30)
begin 
declare @n varchar(30)
declare @mg varchar(30)
declare @fname varchar(30) =(select st_fname from student where st_id=@id)
declare @lname varchar(30) =(select st_lname from student where st_id=@id)
if @fname is null and @lname is null
 set @mg ='First name & last name are null'
else if @fname is null and @lname is not null
   set @mg ='First name is null'
else if @lname is not null
 set @mg ='last name is null'
else 
  set @mg ='First name & last name are not null'
  return @mg
end
go
-----7
select st_id , SUBSTRING(st_fname,1,len(St_Fname)-1)
from Student 
where St_Fname is not null  

