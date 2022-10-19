----day5_part 2
--1
select SalesOrderID,ShipDate
from Sales.SalesOrderHeader
where OrderDate between '7-28-2002' and '7-29-2014'
--2 
select ProductID , Name
from Production.Product 
where StandardCost <110
--3
select * 
from Production.Product
where Weight is null
--4
select * 
from Production.Product
where Color in ('silver','black','red')
---5
select *
from Production.Product
where left (name,1) ='b'
----6
update Production.ProductDescription
set Description ='Chromoly steel_High of defects'
where ProductDescriptionID=3

select *
from Production.ProductDescription
where Description like '%[_]%'
----7
select sum(TotalDue) ,OrderDate
from Sales.SalesOrderHeader
where OrderDate between '7-1-2001' and '7-31-2014'
group by OrderDate
---8
select distinct hiredate from HumanResources.Employee 
---9
select AVG(distinct listprice) from Production.Product
--10
select 'the '+name +' is only! '+ cast(listprice as varchar(20))
from Production.Product
where ListPrice between 100 and 200 order by ListPrice
---11
select rowguid,Name ,SalesPersonID ,Demographics into sales.store_archive from Sales.Store
select * from sales.store_archive

select rowguid,Name ,SalesPersonID ,Demographics into sales.store_archive2 from Sales.Store where 1=2
select * from sales.store_archive2
---12
select CAST(FORMAT(getdate(),'DD/MM/YYYY') AS varchar(50))
UNION ALL
select CAST(FORMAT(getdate(),'DD MM YYYY') AS varchar(50))
UNION ALL
select CAST(FORMAT(getdate(),'DD/MM/YYYY,hh:mm:ss') AS varchar(50))
UNION ALL
select CAST(FORMAT(getdate(),'DD/MM/YYYY,hh:mm:ss tt') AS varchar(50))