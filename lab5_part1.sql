----day5_part 1
---1
select count(*)
from Student
where St_Age is not null
----2
select distinct ins_name 
from Instructor
----3
select isnull( st_id,'no id') as 'student ID' ,isnull(St_Fname,'') +' '+isnull(st_lname,'') as 'student full name', isnull (dept_name,'') as 'Department name'
from Department,Student
where Student.Dept_Id = Department.Dept_Id
-----4
select ins_name , dept_name 
from Department right join Instructor
on Department.Dept_Id=Instructor.Dept_Id
------5
select st_fname +' '+ st_lname , Crs_Name 
from Student , Course ,Stud_Course
where Stud_Course.Crs_Id= Course.Crs_Id and Stud_Course.St_Id=Student.St_Id and Grade is not null
-----6 
select count(crs_id) 
from Course , Topic
where Course.Top_Id = Topic.Top_Id
group by topic.Top_Id
----7
select MAX(salary) ,min(salary)
from Instructor
-----8
select salary 
from Instructor 
where Salary < ( select AVG(Salary) from Instructor)
-----9
select dept_name
from Department ,Instructor
where  Department.Dept_Id= Instructor.Dept_Id and salary= ( select min(Salary) from Instructor)  
----10
select distinct top(2) Salary from Instructor order by salary desc
---11
select ins_name , coalesce(cast(Salary as varchar(10)),'bonus') from Instructor
-----12
select s1.St_Fname , s2.St_Fname ,s2.St_Lname ,s2.St_Id,s2.Dept_Id ,s2.St_Age
from Student s1 , Student s2
where s1.St_Id = s2.St_super
--13
select salary 
from (select *, row_number() over( partition by dept_id order by salary desc) as d
from Instructor ) as t
where d in (1,2) and salary is not null and dept_id is not null 
----14
select * 
from (select *,ROW_NUMBER() over (partition by dept_id order by newid()desc)as t
from Student s) as e 
where e.t=1
---15 
delete Stud_Course
where St_Id in (select st_id from Student where Dept_Id =
(select Dept_Id from Department where Dept_Name='SD'))
-------16
merge into [dbo].[lasttransaction] as c
using [dbo].[daily_transaction] as ct
on c.id=ct.id
when matched 
then update  set c.trans+= ct.mount
when not matched then insert values (ct.id,ct.mount)
;


-----------------------------------------------------

