--1
select dependent_name , d.Sex
from Dependent d , Employee e
where  ssn=essn and e.sex='f' and d.Sex='f'
union
select dependent_name , d.Sex
from Dependent d , Employee e
where  ssn=essn and e.sex='m' and d.Sex='m'
--2
select pname ,sum(hours)
from Project, Works_for
where Pno=Pnumber
group by Pname

--3
select d.*
from Departments d ,Employee
where dnum=Dno
and ssn=(select top(1)ssn from Employee order by SSN)
---4
select dname , max(salary) ,min(salary),AVG(salary)
from Departments , Employee
where Dno=Dnum
group by Dname
-----5
select fname , lname 
from Employee ,Departments
where ssn=MGRSSN and ssn not in (select essn from Dependent)

------6
select dnum,dname, count(ssn) 
from Employee , Departments where dnum= dno 
group by dname , dnum 
having avg(salary)  < (select avg(salary) from Employee) 
--------7
select fname ,lname ,pname 
from Employee ,Project ,Works_for
where Pno=Pnumber and ssn=ESSn
order by Dnum , Fname,Lname
-----------8
select  salary from Employee
where Salary in (select distinct top(2) Salary from Employee order by salary desc)
-----9 
select fname + lname 
from Employee
intersect
select Dependent_name
from Dependent
-------10 
select ssn ,fname ,lname from Employee
where exists (select essn from Dependent , Employee where ssn = ESSN)
-------11
insert into Departments(Dname,Dnum,MGRSSN,[MGRStart Date])
values('DEPT IT',100,112233,'1-11-2006')
---------12
update Departments
set MGRSSN=968574
where Dnum=100 

update Departments
set MGRSSN=102672
where MGRSSN=223344

update Employee
set Superssn=102672
where ssn=102672
----------13
delete from Dependent where essn=223344
update Departments
set MGRSSN=102672
where MGRSSN=223344

update Employee 
set Superssn=102672
where Superssn=223344

update Works_for
set essn=102672
where essn =223344

delete from Employee where ssn=223344

---14
update Employee
set Salary = salary+ Salary*0.3 
where ssn in 
( select SSN
from Employee , Project ,Works_for
where ssn =essn and pno=Pnumber and Pname='AL Rabwah'
)