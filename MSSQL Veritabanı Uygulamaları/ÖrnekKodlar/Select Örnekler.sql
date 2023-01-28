Select * from Products --Ürünler tablosunun hepsini çaðýrýyor

Select *from Products  Where UnitPrice <30 and UnitsInStock<30 --where ile koþul uyguluyoruz 

Select * from Products Order By UnitPrice desc --Order by ile sýralama yapýlýyor. desc büyükten küçüðe doðru asc küçükten büyüðe doðru

Select * from Products Where UnitPrice Between 10 and 50 Order By UnitPrice --between ile bir aralýk içini verekek sorgu çalýþtýrýyor

Select * from Products Where CategoryID in (1,3,2) Order by CategoryID --in ile içinde verilen deðerleri çaðýrýyor

Select Count(*) as [Ürün Sayýsý] from Products --Count ile o tabloda ne kadar satýr olduðunu gösteriyor

Select Count(*) as [Ürün Sayýsý] from Customers

Select * from Customers

Select Count(Region) as Bölge from Customers --sadece bölgede ne kadar satýr varsa gösteriyor 

select min(UnitPrice) from Products --en az olduðu satýrý gösteriyor
select max(UnitPrice) from Products --en çok olduðu satýrý gösteriyor
Select avg(UnitPrice) from Products --ortlamasýný alýyor
Select Sum(UnitPrice ) from Products --Toplamýný alýyor
Select rand() --Rastgele bir sayý atýyor





Select left('Hasan Emre Baðrýyanýk',12) --Soldan 12 karakter okuyor 
Select left(ProductName,5) from Products 

Select right('Hasan Emre Baðrýyanýk',10) --Saðdan 12 karakter okuyor 
Select right(ProductName,5) from Products

Select ProductName,len(ProductName) as [Karakter Sayýsý] from Products  --len ile boyutunu söylüyor 

Select lower('HasAN EMrE BaÐRýYAnýK') --Tüm harfleri küçük yazýyor
select lower(ProductName) from Products

Select upper('hasan emre baðrýyanýk') --Tüm harfleri büyük yazýyor
Select upper(ProductName) from Products

Select trim('       Hasan Emre       ') --Boþluklarý kaldýrýyor
Select trim(ProductName) from Products where trim(ProductName) = 'Chai'

Select ltrim('          hasan emre                            ') --Soldaki boþluklarý siliyor
Select rtrim('                       hasan emre                            ') --Saðdaki boþluklarý siliyor

Select reverse('Hasan Emre Baðrýyanýk') --Kelimleri tersten yazýyor

Select CHARINDEX('n','Hasan Emre',1) --1'den baþlayarak n harfini görene kadar ilerliyor ve kaçýncý sýrada olduðunu söylüyor

Select replace('Hasan Emre',' ','_') -- Yerdeðiþtirme boþluk ile alttan tireyi yer deðiþtiriyor
Select replace(ProductName,' ','_') from Products
Select substring(ProductName,1,6) from Products --Birden Baþlayarak 6'ya kadar harfleri yazýyor 

Select ascii('A') --harfin bilgisayar dilinde sayýyý gösteriyor






Select distinct Country,City from Customers order by Country,City --distinct Listede bir kere kullanýlaný birde sýralamýyor

Select Country,Count(*) as Adet from Customers group by Country --group by bir þeyden kaç tane olduðunu gruplar halinde söyler

Select Country,City,Count(*) as Adet from Customers group by Country,City having Count(*)>1 order by Country
--Having kümeleþmiþ gruplarýn içinde iþlem yapar

Select * from Products p inner join Categories c on p.CategoryID = c.CategoryID where p.UnitPrice > 40 order by c.CategoryID 
--inner join ile iki farklý tabloyu birleþtirdik ve koþulumuz iki tarafýnda categoryId'leri eþit olmalýdýr.Olmayanlarý çaðýrmaz.

Select p.ProductName,o.OrderDate,od.Quantity * od.UnitPrice as Total from Products p inner join [Order Details] od 
on p.ProductID = od. ProductID inner join Orders o on o.OrderID = od.OrderID order by Total desc
--3 tane tabloyu birleþtirdik sýra ile kimlerde ayný idler var diye baktýk ve onlar arasýnda birleþtirdik

Select *from Customers c left join Orders o on c.CustomerID = o.CustomerID 
where o.CustomerID is null   --Left join soldaki tabloda olan ama saðdaki tabloda olmayan satýrlarý da getir demek anlamýna geliyor

Select * from Orders o right join Customers c on o.CustomerID = c.CustomerID
where o.CustomerID is null  --Right join saðdaki tabloda olan ama Soldaki tabloda olmayan satýrlarý da getir demek anlamýna geliyor

Select * from Customers c full join Orders o on c.CustomerID = o.CustomerID
--Soldaki ve saðdaki her þeyi getirir






--Wrokshop satýþ yapamayan elemanlarýn listeleri
Select * from Employees e left join Orders o on e.EmployeeID = o.EmployeeID
where o.EmployeeID is null

--Workshop hangi üründen kaç adet satýlmýþ
Select  p.ProductName,Count(*) as Adet from Products p inner join [Order Details] od on p.ProductID = od.ProductID
group by p.ProductName order by p.ProductName

--workshop hangi kategoriden kaç tane satmýþýz
Select c.CategoryName,Count(*) as Adet from Products p inner join Categories c on p.CategoryID = c.CategoryID
inner join [Order Details] od on od.ProductID = p.ProductID group by c.CategoryName

--Workshop personellerden kim kimin üstü onu yazdýrma
Select e2.FirstName +' '+ e2.LastName as Personel, e1.FirstName + ' ' + e1.LastName as Üstü
from Employees e1 right join Employees e2  on e1.EmployeeID = e2.ReportsTo



  



--Veri tabanýndaki bir tabloya bir þey eklemek için kullanýlýr
insert into Categories (CategoryName,Description) values('Test', 'Test açýklamasý')

insert into [Order Details] values(10248,12,12,15,0)--Deðerler tam bir þekilde girilmedir 

--Burada güncelleme yapýyoruz 
update Categories set CategoryName='testler bitti' , Description ='testler bitti diye söylüyor'
where CategoryID = 9

update Territories set TerritoryDescription ='Akdeniz Bölgesi' where RegionID = 1
update Territories set TerritoryDescription = 'Karadeniz Bölgesi' where RegionID = 2

--Burada silme iþlemi yapýyoruz
delete from Categories where  CategoryID >= 9





--yeni bir Tablo oluþturduk ve baþka bir tablodan bu tabloya veri çektik
Select * from CustomersWork

insert into CustomersWork(CustomerId,CompanyName,ContactTitle) Select CustomerId,CompanyName,ContactTitle from Customers

delete from CustomersWork

insert into CustomersWork (CustomerId,CompanyName,ContactTitle) Select CustomerId,CompanyName,ContactTitle from Customers
where ContactName like '%en%'

Select * from CustomersWork




--Baþka bir tabloda yaptýðýmýz güncellemeyi gerçek tabloya geri aktardýk
update Customers set CompanyName = CustomersWork.CompanyName from Customers inner join CustomersWork 
on Customers.CustomerID = CustomersWork.CustomerId
Where CustomersWork.CompanyName like '%TEST%'

Select * from CustomersWork



--Silme iþlemi 
delete Customers
from 
Customers inner join CustomersWork  on Customers.CustomerID = CustomersWork.CustomerId
Where CustomersWork.CompanyName like '%TEST%'



--union ile iki tablo alt alta birleþtirilebilir bunu için iki tablonun da sütun sayýlarý ayný olmak zorundadýr
Select CustomerID,CompanyName,ContactTitle from Customers
union --all
Select * from CustomersWork