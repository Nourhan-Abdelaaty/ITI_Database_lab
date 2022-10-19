--1
select dnum,dname,mgrssn,fname
from departments,employee
where ssn=mgrssn
---2
select dname,pname
from Departments,Project
where Departments.Dnum=Project.Dnum
--------3
select Dependent.* , fname 
from  Dependent ,Employee
where ssn=essn
------4
select pnumber,pname ,plocation
from Project 
where City in ('alex', 'cairo')
------5 
select *
from project 
where Pname like 'a%'
-------6
select fname,ssn
from Employee
where dno=30 and Salary between 1000 and 2000
---7
select fname 
from Employee inner join Works_for on essn=ssn 
inner join Project on   pno=Pnumber  
where  Dno=10 and Hours>=10 and Pname='rabwab'
----8
select y.Fname
from Employee x , Employee y 
where y.SSN=x.Superssn and y.Fname='kamel' and y.Lname='mohamed'
---
select e1.Fname
from Employee e1 ,Employee e2
where e1.ssn =e2.Superssn and e2.Fname='kamel' and e2.Lname='mohamed'
-----9
select fname ,pname 
from Employee , Project , Works_for
where essn=SSN and Pno= Pnumber
order by Pname 
------10
select pnumber ,dname ,lname ,bdate,address
from Employee ,Project,Departments
where Departments.Dnum= Project.Dnum and ssn=MGRSSN and City='cairo' 
----11****************
select distinct * from Employee,Departments where ssn= MGRSSN
-----12
select e.*, d.* from Employee e left join Dependent d on  ssn=ESSN
------13
insert into Employee values ('Nourhan','mohamed',102672,'2000-01-1','alex','f',8000,112233,30)
--14
insert into Employee values ('laila','mohamed',102660,'2000-01-1','alex','f',NULL,NULL,30)
--15
update Employee set Salary = Salary+ Salary*0.2 where ssn= 102672