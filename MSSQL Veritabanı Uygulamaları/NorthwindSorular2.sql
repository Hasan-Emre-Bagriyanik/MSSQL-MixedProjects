--Employess, orders ve products tablolarýndaki tüm verileri Select komutu ile listeleyiniz.
select * from Employees
select * from Orders
select * from Products

--(Customers ) Müþterilerin firma adý, yetkili kiþi ve telefon numaralarý bilgilerini listeleyiniz.
select CompanyName, ContactName, Phone from Customers

--Bulunulan tarihe(ay-gün) ait sipariþlerin hangi yýlda verildiði bilgilerini Ay bilgisine göre listeleyen SQL komutunu yazýnýz.
select CustomerID , DATEPART(YEAR,OrderDate) as Yýl from Orders
where DATEPART(day,OrderDate) = DATEPART(day,GETDATE()) and
DATEPART(MONTH,OrderDate) = DATEPART(MONTH,GETDATE())

--1996 yýlýnda bugünkü ay ve günde teslimatý yapýlmasý gereken sipariþleri listeleyiniz.
select * from Orders
where DATEPART(YEAR,ShippedDate) = '1996' and
DATEPART(MONTH,ShippedDate) = DATEPART(MONTH,GETDATE()) and
DATEPART(DAY,ShippedDate) = DATEPART(DAY,GETDATE()) 


--Sipariþlerin, sipariþ verildiði tarih ile sipariþin teslim edilmesi istenilen tarih arasýndaki farký (gün
--bazýnda) ve müþteri id bilgilerini listeleyen SQL kodunu yazýnýz.
select CustomerID, DATEDIFF(D,OrderDate,ShippedDate) as 'Gün Farký' from Orders


--Teslimat bölgesi Essex olan sipariþleri listeleyiniz.
select * from Orders
where ShipRegion = 'Essex'


--Birim fiyatý en yüksek olan ürünün fiyat bilgisini listeleyen SQL kodunu yazýnýz.
select MAX(UnitPrice) as Fiyat from Products
----------------
select top 1 UnitPrice as Fiyat from Products
order by UnitPrice desc


--Yumuþak içime (Soft drinks ) sahip içeceklerin hangi kategoriye ait olduðunu listeleyen SQL kodunu yazýnýz.
select CategoryName from Categories
where Description like '%Soft drinks%'


--1997 yýlýnda teslim edilen ve müþteri Ýd bilgisi LILAS olan sipariþleri listeleyiniz.
select * from Orders
where DATEPART(YEAR,ShippedDate) = '1997' and
CustomerID = 'LILAS'


--Brezilya veya Meksika’da bulunan müþteri bilgilerini listeleyiniz.
select *  from Customers
where Country = 'Mexico' or Country = 'Brazil'


--Teslimat bölgesi Ýtalya, Fransa ve Ýngiltere olan sipariþleri listeleyiniz.
select * from Orders 
where ShipCountry = 'Italy' or ShipCountry = 'France' or ShipCountry = 'England' 


--10.02.1996 ve 10.02.1997 tarihleri arasýnda verilmiþ olan sipariþleri listeleyiniz.
select * from Orders 
where OrderDate between '10.02.1996' and  '10.02.1997'


--Müþteri id bilgisi KOENE olan firmanýn sipariþlerini aðýrlýða göre sýralayan SQL kodunu yazýnýz.
select * from Orders
where CustomerID = 'KOENE'  order by Freight 


--Sipariþ aðýrlýðý 100 kg dan fazla olan ve teslimat ülkesi Almanya olan sipariþleri listeleyiniz.
select * from Orders
where Freight > 100 and ShipCountry = 'Germany'


--Müþteri adý, firmada ki yetkili kiþi, yetkili kiþinin unvaný ve adres bilgilerini firma ismine göre
--azalan olarak listeleyen SQL kodunu yazýnýz.
select CompanyName, ContactName, ContactTitle, Address from Customers
order by CompanyName desc


--Sipariþlerin müþteri id’sini, Teslimat adresini,aðýrlýðýný ve teslimat tarihini, sipariþ tarihine göre
--artan ve aðýrlýða göre azalan sýrada listeleyen SQL kodunu yazýnýz.
select CustomerID, ShipAddress, Freight, ShippedDate from Orders
order by Freight desc , ShippedDate asc 


--Ülkeler benzersiz olacak þekilde sipariþ alýnan ülkeler bilgilerini listeleyen SQL kodunu yazýnýz.
select distinct ShipCountry  from Orders


--Müþterilerin þehir bilgisini takma adý M.Þehir olacak þekilde listeleyiniz.
select City as 'M.Þehir' from Customers


--1960’dan sonra doðan personellerin adýný, soyadýný ve unvan kýsaltmasýný tek alan altýnda soyad
--bilgisine göre azalan olarak listeleyen SQL kodunu yazýnýz.
select TitleOfCourtesy+ FirstName + ' ' + LastName as Çalýþan  from Employees
where DATEPART(YEAR,BirthDate) > '1960' order by LastName desc


--Erkek personellerin doðum tarihlerini 107 formatýna uygun þekilde listeleyiniz.
select FirstName as isim , CONVERT(varchar,BirthDate,107) as 'Doðum Tarihi' from Employees
where TitleOfCourtesy = 'Mr.'


