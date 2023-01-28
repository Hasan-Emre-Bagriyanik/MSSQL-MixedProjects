--Öðrencilerin yýlýn kaçýncý günü doðduðunu ekrandaki gibi listeleyen SQL kodunu yazýnýz.
select adi, soyadi, DATEPART(Y,dogum_tar) as Gün from ogrenci order by Gün

--Öðrencilerin haftanýn kaçýncý günü doðduðunu ekrandaki gibi listeleyen SQL kodunu yazýnýz.
select adi ,soyadi, DATEPART(W,dogum_tar) as Hafta from ogrenci order by Hafta

--Bugün doðum günü olan öðrencileri listeleyin.
select * from ogrenci
where DAY(dogum_tar) = DAY(GETDATE()) and MONTH(dogum_tar) = MONTH(GETDATE())

--Bu ay içerisinde doðan öðrencileri listeleyin.
select * from ogrenci 
where MONTH(dogum_tar) = MONTH(GETDATE())

--Öðrencilerin doðduklarý günden bugüne kaç gün geçtiðini veren SQL kodunu yazýn.
select adi,soyadi, DATEDIFF(DAY,dogum_tar,GETDATE()) as gün from ogrenci

--Öðrenci numarasý, ad ve soyad bilgilerini ekrandaki gibi listeleyin.
select CONVERT(varchar,ogr_no) + ' '+ adi + ' ' + soyadi as 'AD SOYAD' from ogrenci



