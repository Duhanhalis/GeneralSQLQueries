-- Herbirini secme
use AdventureWorks2022
select * from Sales.SalesOrderDetail

--Aritmetik Operatorler
use AdventureWorks2022
select UnitPrice+5 from Sales.SalesOrderDetail
use AdventureWorks2022
select UnitPrice-5 from Sales.SalesOrderDetail
use AdventureWorks2022
select UnitPrice/5 from Sales.SalesOrderDetail
use AdventureWorks2022
select UnitPrice*5 from Sales.SalesOrderDetail
use AdventureWorks2022
select UnitPrice%5 from Sales.SalesOrderDetail

--Karþýlaþtýrma Operatörleri
use AdventureWorks2022
select UnitPrice from Sales.SalesOrderDetail where UnitPrice  > 2000
use AdventureWorks2022
select UnitPrice from Sales.SalesOrderDetail where UnitPrice  < 2000
use AdventureWorks2022
select UnitPrice from Sales.SalesOrderDetail where UnitPrice  = 2024.994
use AdventureWorks2022
select UnitPrice from Sales.SalesOrderDetail where UnitPrice  != 2000
use AdventureWorks2022
select UnitPrice from Sales.SalesOrderDetail where UnitPrice  <> 2024.994
use AdventureWorks2022
select UnitPrice from Sales.SalesOrderDetail where UnitPrice  >= 2000

--Mantýksal Operatörler
use AdventureWorks2022
select * from Sales.SalesOrderDetail where OrderQty = 5 And ProductID = 770
use AdventureWorks2022
select OrderQty,ProductID from Sales.SalesOrderDetail where OrderQty = 5 Or ProductID = 770
use AdventureWorks2022
select OrderQty,ProductID from Sales.SalesOrderDetail where OrderQty = 5 and Not(ProductID = 770)

--Özel Operatörler
use AdventureWorks2022
select * from Sales.SalesOrderDetail where UnitPrice between 1800 and 2000
use AdventureWorks2022
select * from Person.CountryRegion where CountryRegionCode in ('AD','AM','AO','AR')

use AdventureWorks2022
select FirstName from Person.Person where FirstName like 'A%'
use AdventureWorks2022
select FirstName from Person.Person where FirstName like '%A'
use AdventureWorks2022
select FirstName from Person.Person where FirstName like '%A%'
use AdventureWorks2022
select FirstName from Person.Person where FirstName like 'A_e'
use AdventureWorks2022
select FirstName from Person.Person where FirstName like '[AJB]%'
use AdventureWorks2022
select * from Person.Person WHERE FirstName LIKE 'Ab%' AND FirstName NOT LIKE 'Abby';
use AdventureWorks2022
select * from Person.Person where MiddleName is null
use AdventureWorks2022
select * from Person.Person order by LastName Asc
use AdventureWorks2022
select * from Person.Person order by LastName Desc
use AdventureWorks2022
select * from Person.Person order by FirstName,LastName Asc

-- Sql Fonksiyonlar
	-- Toplam (Aggregate) Fonksiyonlar
use AdventureWorks2022
select COUNT(*) from Person.Person where MiddleName is null
use AdventureWorks2022
select count(*) as TotalSalary,sum(UnitPrice) as Total from Sales.SalesOrderDetail
use AdventureWorks2022
select AVG(UnitPrice) from Sales.SalesOrderDetail
use AdventureWorks2022
select Min(UnitPrice) from Sales.SalesOrderDetail
use AdventureWorks2022
select max(UnitPrice) from Sales.SalesOrderDetail

	-- String Fonksiyonlar
use AdventureWorks2022
select * from Person.Person where Len(FirstName) < 4
use AdventureWorks2022
select Upper(FirstName) from Person.Person
use AdventureWorks2022
select lower(FirstName) from Person.Person
use AdventureWorks2022
select left(FirstName,3) from Person.Person
use AdventureWorks2022
select right(FirstName,3) from Person.Person
-- Not : 3. sýradakinden itibaren 4 harf daha alýr substring
use AdventureWorks2022
select substring(FirstName,3,4) from Person.Person
use AdventureWorks2022
select concat(FirstName,' ',LastName) from Person.Person
use AdventureWorks2022
select replace(FirstName,'x','ks') from Person.Person where FirstName like '%x%'
use AdventureWorks2022
select trim(FirstName) from Person.Person

	--Tarih ve Saat Fonksiyonlarý
use AdventureWorks2022
select getdate() from Person.Person
select getdate();
use AdventureWorks2022
select DATEADD(YEAR,20,ModifiedDate) from Person.Person
select DATEADD(DAY,20,GETDATE())
use AdventureWorks2022 
select ModifiedDate,DATEDIFF(YEAR,ModifiedDate,GETDATE()) from Person.Person
select format(GETDATE(),'mm/dd/yy')
select format(GETDATE(),'mm-dd-yyyy')
 
	--Matematiksel Fonksiyonlar
use AdventureWorks2022
select Ceiling(UnitPrice) from Sales.SalesOrderDetail
use AdventureWorks2022
select FLOOR(UnitPrice) from Sales.SalesOrderDetail

-- Group BY
use AdventureWorks2022
select StateProvinceID,Count(StateProvinceID) from Person.Address group by StateProvinceID order by Count(StateProvinceID) asc
use AdventureWorks2022
select StateProvinceID,Max(StateProvinceID) from Person.Address group by StateProvinceID 
use AdventureWorks2022
select StateProvinceID,Min(StateProvinceID) from Person.Address group by StateProvinceID
use AdventureWorks2022
select StateProvinceID,Sum(StateProvinceID) from Person.Address group by StateProvinceID
use AdventureWorks2022
select StateProvinceID,Avg(StateProvinceID) from Person.Address group by StateProvinceID

-- Distinct
use AdventureWorks2022
select distinct StateProvinceID,Count(*) from Person.Address group by StateProvinceID
use AdventureWorks2022
select StateProvinceID,Count(*) from Person.Address group by StateProvinceID

-- Having
use AdventureWorks2022
select StateProvinceID,Count(*) from Person.Address group by StateProvinceID having Count(*) < 200
use AdventureWorks2022
select StateProvinceID,Count(*) from Person.Address group by StateProvinceID

-- Joins
	-- Iki Tane Tablo
use AdventureWorks2022
select * from Production.Product inner join Production.ProductSubcategory on Production.Product.ProductSubcategoryID = ProductSubcategory.ProductSubcategoryID
select * from Production.Product where Not(ProductSubcategoryID is null)
select * from Production.ProductSubcategory where Not(ProductSubcategoryID is null)
	-- Uc tane Tablo
select Production.ProductModel.Name, Production.ProductSubcategory.Name , Production.Product.Name 
from Production.Product 
inner join Production.ProductSubcategory 
on Production.Product.ProductSubcategoryID = ProductSubcategory.ProductSubcategoryID
inner join Production.ProductModel 
on Production.ProductModel.ProductModelID = Production.Product.ProductModelID
group by Production.ProductModel.Name
select Name from Production.ProductModel
select Name from Production.ProductSubcategory
select Name from Production.Product

-- ALT SORGULAR (Subqueries)
use AdventureWorks2022
select Name,StandardCost from Production.Product
where StandardCost = (select max(StandardCost) from Production.Product)

-- SET OPERATÖRLERÝ
use AdventureWorks2022
select Name,StandardCost,ListPrice from Production.Product
where StandardCost = (select max(StandardCost) from Production.Product)
union 
select Name,StandardCost,ListPrice from Production.Product
where ListPrice > 100

use AdventureWorks2022
select Name,StandardCost,ListPrice from Production.Product
where StandardCost = (select max(StandardCost) from Production.Product)
union all
select Name,StandardCost,ListPrice from Production.Product
where ListPrice > 100

-- Left Join
select * from Production.Product pro
left join Production.ProductSubcategory sub
on pro.ProductSubcategoryID = sub.ProductSubcategoryID
select * from Production.Product
select * from Production.ProductSubcategory

-- Right Join
select * from Production.Product pro
right join Production.ProductSubcategory sub
on pro.ProductSubcategoryID = sub.ProductSubcategoryID
select * from Production.Product
select * from Production.ProductSubcategory

-- Exists
use AdventureWorks2022
select Name,StandardCost,ListPrice from Production.Product
where exists (select StandardCost from Production.Product where StandardCost = 98.77)

use AdventureWorks2022
select Name,StandardCost,ListPrice from Production.Product
where not exists (select StandardCost from Production.Product where StandardCost = 100)

-- All
use AdventureWorks2022
select FirstName,LastName from Person.Person a
where Len(FirstName) > all (select Len(LastName) from Person.Person)

-- Any 
use AdventureWorks2022
select FirstName,LastName from Person.Person
where 30 < any (select Len(LastName) from Person.Person)

use AdventureWorks2022
select FirstName,LastName from Person.Person
where Len(LastName) > 30