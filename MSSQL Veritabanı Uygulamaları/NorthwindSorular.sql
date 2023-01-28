/*1.soru*/
select * from Employees
select * from Orders
select * from Products


/*2.soru*/
select CompanyName, ContactName, Phone from Customers


/*3.soru*/
select CustomerID, DATEPART(year,OrderDate) as Yýl from Orders
where DATEPART(day,OrderDate)= DATEPART(day,GETDATE()) and 
DATEPART(month,OrderDate)= DATEPART(month,getdate()) order by Yýl


/*4.soru*/
select * from Orders
where DATEPART(day,ShippedDate)= DATEPART(day,GETDATE()) and 
DATEPART(month,ShippedDate)= DATEPART(month,getdate()) and DATEPART(year,ShippedDate) = '1996'


/*5.soru*/
select CustomerID, DATEDIFF(day,OrderDate,ShippedDate) as fark from Orders


/*6.soru*/
select * from Orders
where ShipRegion = 'Essex'


/*7.soru*/
select MAX(UnitPrice) as Fiyat from Products

/*8.soru*/
select CategoryName from Categories
where Description like '%Soft drinks%'

/*9.soru*/
select * from Orders
where CustomerID = 'LILAS'  and year(ShippedDate) = '1997'

/*10.soru*/
select * from Orders
where ShipCountry = 'Mexico' or ShipCountry = 'Brazil'

/*11.soru*/
select * from Orders
where ShipCountry = 'Italy' or ShipCountry = 'France' or ShipCountry = 'England'

/*12.soru*/
select * from Orders
where OrderDate between '10.02.1996' and '10.02.1997'

/*13.soru*/
select * from Orders
where CustomerID = 'KOENE' order by Freight

/*14.soru*/
select * from Orders
where Freight > 100  and ShipCountry = 'Germany'

/*15.soru*/
select CompanyName, ContactName, ContactTitle, Address  from Customers 
order by ContactName desc


/*16.soru*/
select CustomerID, ShipAddress, Freight, ShippedDate  from Orders
order by Freight desc, OrderDate asc


/*17.soru*/
select distinct ShipCountry from Orders

/*18.soru*/
select city as 'M.Sehir' from Customers

/*19.soru*/
select FirstName + ' '+ LastName+ ' ' + TitleOfCourtesy  as Çalýþan from Employees 
where BirthDate > 1960 order by LastName desc

/*20.soru*/
select FirstName as isim , CONVERT(varchar,BirthDate,107) as 'Doðum Tarihi' from Employees 