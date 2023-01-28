Select * from Products --�r�nler tablosunun hepsini �a��r�yor

Select *from Products  Where UnitPrice <30 and UnitsInStock<30 --where ile ko�ul uyguluyoruz 

Select * from Products Order By UnitPrice desc --Order by ile s�ralama yap�l�yor. desc b�y�kten k����e do�ru asc k���kten b�y��e do�ru

Select * from Products Where UnitPrice Between 10 and 50 Order By UnitPrice --between ile bir aral�k i�ini verekek sorgu �al��t�r�yor

Select * from Products Where CategoryID in (1,3,2) Order by CategoryID --in ile i�inde verilen de�erleri �a��r�yor

Select Count(*) as [�r�n Say�s�] from Products --Count ile o tabloda ne kadar sat�r oldu�unu g�steriyor

Select Count(*) as [�r�n Say�s�] from Customers

Select * from Customers

Select Count(Region) as B�lge from Customers --sadece b�lgede ne kadar sat�r varsa g�steriyor 

select min(UnitPrice) from Products --en az oldu�u sat�r� g�steriyor
select max(UnitPrice) from Products --en �ok oldu�u sat�r� g�steriyor
Select avg(UnitPrice) from Products --ortlamas�n� al�yor
Select Sum(UnitPrice ) from Products --Toplam�n� al�yor
Select rand() --Rastgele bir say� at�yor





Select left('Hasan Emre Ba�r�yan�k',12) --Soldan 12 karakter okuyor 
Select left(ProductName,5) from Products 

Select right('Hasan Emre Ba�r�yan�k',10) --Sa�dan 12 karakter okuyor 
Select right(ProductName,5) from Products

Select ProductName,len(ProductName) as [Karakter Say�s�] from Products  --len ile boyutunu s�yl�yor 

Select lower('HasAN EMrE Ba�R�YAn�K') --T�m harfleri k���k yaz�yor
select lower(ProductName) from Products

Select upper('hasan emre ba�r�yan�k') --T�m harfleri b�y�k yaz�yor
Select upper(ProductName) from Products

Select trim('       Hasan Emre       ') --Bo�luklar� kald�r�yor
Select trim(ProductName) from Products where trim(ProductName) = 'Chai'

Select ltrim('          hasan emre                            ') --Soldaki bo�luklar� siliyor
Select rtrim('                       hasan emre                            ') --Sa�daki bo�luklar� siliyor

Select reverse('Hasan Emre Ba�r�yan�k') --Kelimleri tersten yaz�yor

Select CHARINDEX('n','Hasan Emre',1) --1'den ba�layarak n harfini g�rene kadar ilerliyor ve ka��nc� s�rada oldu�unu s�yl�yor

Select replace('Hasan Emre',' ','_') -- Yerde�i�tirme bo�luk ile alttan tireyi yer de�i�tiriyor
Select replace(ProductName,' ','_') from Products
Select substring(ProductName,1,6) from Products --Birden Ba�layarak 6'ya kadar harfleri yaz�yor 

Select ascii('A') --harfin bilgisayar dilinde say�y� g�steriyor






Select distinct Country,City from Customers order by Country,City --distinct Listede bir kere kullan�lan� birde s�ralam�yor

Select Country,Count(*) as Adet from Customers group by Country --group by bir �eyden ka� tane oldu�unu gruplar halinde s�yler

Select Country,City,Count(*) as Adet from Customers group by Country,City having Count(*)>1 order by Country
--Having k�mele�mi� gruplar�n i�inde i�lem yapar

Select * from Products p inner join Categories c on p.CategoryID = c.CategoryID where p.UnitPrice > 40 order by c.CategoryID 
--inner join ile iki farkl� tabloyu birle�tirdik ve ko�ulumuz iki taraf�nda categoryId'leri e�it olmal�d�r.Olmayanlar� �a��rmaz.

Select p.ProductName,o.OrderDate,od.Quantity * od.UnitPrice as Total from Products p inner join [Order Details] od 
on p.ProductID = od. ProductID inner join Orders o on o.OrderID = od.OrderID order by Total desc
--3 tane tabloyu birle�tirdik s�ra ile kimlerde ayn� idler var diye bakt�k ve onlar aras�nda birle�tirdik

Select *from Customers c left join Orders o on c.CustomerID = o.CustomerID 
where o.CustomerID is null   --Left join soldaki tabloda olan ama sa�daki tabloda olmayan sat�rlar� da getir demek anlam�na geliyor

Select * from Orders o right join Customers c on o.CustomerID = c.CustomerID
where o.CustomerID is null  --Right join sa�daki tabloda olan ama Soldaki tabloda olmayan sat�rlar� da getir demek anlam�na geliyor

Select * from Customers c full join Orders o on c.CustomerID = o.CustomerID
--Soldaki ve sa�daki her �eyi getirir






--Wrokshop sat�� yapamayan elemanlar�n listeleri
Select * from Employees e left join Orders o on e.EmployeeID = o.EmployeeID
where o.EmployeeID is null

--Workshop hangi �r�nden ka� adet sat�lm��
Select  p.ProductName,Count(*) as Adet from Products p inner join [Order Details] od on p.ProductID = od.ProductID
group by p.ProductName order by p.ProductName

--workshop hangi kategoriden ka� tane satm���z
Select c.CategoryName,Count(*) as Adet from Products p inner join Categories c on p.CategoryID = c.CategoryID
inner join [Order Details] od on od.ProductID = p.ProductID group by c.CategoryName

--Workshop personellerden kim kimin �st� onu yazd�rma
Select e2.FirstName +' '+ e2.LastName as Personel, e1.FirstName + ' ' + e1.LastName as �st�
from Employees e1 right join Employees e2  on e1.EmployeeID = e2.ReportsTo



  



--Veri taban�ndaki bir tabloya bir �ey eklemek i�in kullan�l�r
insert into Categories (CategoryName,Description) values('Test', 'Test a��klamas�')

insert into [Order Details] values(10248,12,12,15,0)--De�erler tam bir �ekilde girilmedir 

--Burada g�ncelleme yap�yoruz 
update Categories set CategoryName='testler bitti' , Description ='testler bitti diye s�yl�yor'
where CategoryID = 9

update Territories set TerritoryDescription ='Akdeniz B�lgesi' where RegionID = 1
update Territories set TerritoryDescription = 'Karadeniz B�lgesi' where RegionID = 2

--Burada silme i�lemi yap�yoruz
delete from Categories where  CategoryID >= 9





--yeni bir Tablo olu�turduk ve ba�ka bir tablodan bu tabloya veri �ektik
Select * from CustomersWork

insert into CustomersWork(CustomerId,CompanyName,ContactTitle) Select CustomerId,CompanyName,ContactTitle from Customers

delete from CustomersWork

insert into CustomersWork (CustomerId,CompanyName,ContactTitle) Select CustomerId,CompanyName,ContactTitle from Customers
where ContactName like '%en%'

Select * from CustomersWork




--Ba�ka bir tabloda yapt���m�z g�ncellemeyi ger�ek tabloya geri aktard�k
update Customers set CompanyName = CustomersWork.CompanyName from Customers inner join CustomersWork 
on Customers.CustomerID = CustomersWork.CustomerId
Where CustomersWork.CompanyName like '%TEST%'

Select * from CustomersWork



--Silme i�lemi 
delete Customers
from 
Customers inner join CustomersWork  on Customers.CustomerID = CustomersWork.CustomerId
Where CustomersWork.CompanyName like '%TEST%'



--union ile iki tablo alt alta birle�tirilebilir bunu i�in iki tablonun da s�tun say�lar� ayn� olmak zorundad�r
Select CustomerID,CompanyName,ContactTitle from Customers
union --all
Select * from CustomersWork