
--Öðrencilerin yýlýn kaçýncý günü doðduðunu ekrandaki gibi listeleyen SQL kodunu yazýnýz.
select adi, soyadi, DATEPART(DAY,dogum_tar) as Gün from ogrenci order by Gün


--Öðrencilerin haftanýn kaçýncý günü doðduðunu ekrandaki gibi listeleyen SQL kodunu yazýnýz.
select adi,soyadi,DATEPART(WEEK,dogum_tar) as Hafta from ogrenci order by Hafta


--Bugün doðum günü olan öðrencileri listeleyin.
select * from ogrenci where DATEPART(DAY,dogum_tar) = DATEPART(DAY,GETDATE()) and 
DATEPART(MONTH,dogum_tar) = DATEPART(MONTH,GETDATE()) 


--Bu ay içerisinde doðan öðrencileri listeleyin.
select * from ogrenci where DATEPART(MONTH,dogum_tar) = DATEPART(MONTH,GETDATE())


--Öðrencilerin doðduklarý günden bugüne kaç gün geçtiðini veren SQL kodunu yazýn.
select adi, soyadi,DATEDIFF(DAY,dogum_tar,GETDATE()) as Gün from ogrenci 


--Öðrenci numarasý, ad ve soyad bilgilerini ekrandaki gibi listeleyin.
select CONVERT(varchar,ogr_no) + ' '+ adi + ' ' + soyadi  as 'AD SOYAD' from ogrenci
