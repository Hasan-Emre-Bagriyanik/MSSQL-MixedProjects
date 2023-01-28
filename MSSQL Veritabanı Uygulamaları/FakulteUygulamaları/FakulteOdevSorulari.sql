--��rencilerin y�l�n ka��nc� g�n� do�du�unu ekrandaki gibi listeleyen SQL kodunu yaz�n�z.
select adi, soyadi, DATEPART(Y,dogum_tar) as G�n from ogrenci order by G�n

--��rencilerin haftan�n ka��nc� g�n� do�du�unu ekrandaki gibi listeleyen SQL kodunu yaz�n�z.
select adi ,soyadi, DATEPART(W,dogum_tar) as Hafta from ogrenci order by Hafta

--Bug�n do�um g�n� olan ��rencileri listeleyin.
select * from ogrenci
where DAY(dogum_tar) = DAY(GETDATE()) and MONTH(dogum_tar) = MONTH(GETDATE())

--Bu ay i�erisinde do�an ��rencileri listeleyin.
select * from ogrenci 
where MONTH(dogum_tar) = MONTH(GETDATE())

--��rencilerin do�duklar� g�nden bug�ne ka� g�n ge�ti�ini veren SQL kodunu yaz�n.
select adi,soyadi, DATEDIFF(DAY,dogum_tar,GETDATE()) as g�n from ogrenci

--��renci numaras�, ad ve soyad bilgilerini ekrandaki gibi listeleyin.
select CONVERT(varchar,ogr_no) + ' '+ adi + ' ' + soyadi as 'AD SOYAD' from ogrenci



