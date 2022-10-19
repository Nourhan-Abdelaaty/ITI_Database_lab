---1
select * from employee
---2
select fname ,lname ,salary ,Dno  from Employee
-----3
 select pname,plocation,dnum from project 
 ----4
 select fname + '' +lname as fullname ,salary*0.1*12 as  ANNUALBONUS  from Employee
 ---5
 select ssn ,fname  from Employee where Salary>1000
 ---6
 select ssn ,fname from Employee where Salary*12 >10000
 ------7
 select fname,salary from Employee where sex = 'f'
 ------8
 select dnum ,dname from Departments where MGRSSN= 968574
 -----9
 select pnumber,pname,plocation from Project where dnum=10