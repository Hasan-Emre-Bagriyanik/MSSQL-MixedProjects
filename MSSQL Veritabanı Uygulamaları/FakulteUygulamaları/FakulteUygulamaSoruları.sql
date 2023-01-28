/*Öðrenci tablosundan ogr_noalanýný NUMARA, adi alanýný AD, soyadialanýný SOYAD þeklinde deðiþtirerek 
doðum tarihine göre artan sýralayan (yandaki gibi listeleyen) SQL kodunu yazýn.*/

select ogr_no as NUMARA, adi as AD, soyadi as SOYAD from ogrenci order by dogum_tar


--Ayný sorguya DOÐUM TARÝHÝ alanýný ekleyelim.
select ogr_no as NUMARA, adi as AD, soyadi as SOYAD, dogum_tar as 'DOÐUM TARÝHÝ' from ogrenci order by dogum_tar


/*Öðrenci numarasýný, dersin kodunu, vize, final notunu ve notlarýn baþarý notunu 
(ortalama hesabý: vize*0.4 + final*0.6) listeleyen SQL kodu yazýnýz.*/
select ogr_no, ders_kodu, vize ,final, (vize*0.4 + final*0.6) as ortalama from notlar

/*Öðrencilerin numara, ad, soyad ve yaþ bilgilerini, yaþa göre küçükten büyüðe listeleyen SQL sorgusunu yazýn.*/
select ogr_no, adi, soyadi , (year(getdate()) - year(dogum_tar))  as yaþ from ogrenci order by yaþ


/*Öðrencilerin numarasýný, ad ve soyad bilgilerini (tek alan altýnda aralarýnda boþluk býrakarak, 
ad soyadalanýna göre azalan) ekrandaki gibi listeleyen SELECT sorgusunu yazýn.*/

select ogr_no, adi + ' ' + soyadi as 'AD SOYAD' from ogrenci


/*1999 ve 2001 yýllarý arasýnda doðan kýz öðrencilerin adýný, soyadýný ve doðum tarihi bilgilerini 
doðum tarihine göre artan olacak þekilde ekranda listeleyin.*/

select adi, soyadi, YEAR(dogum_tar) from ogrenci
where (YEAR(dogum_tar) between 1999 and 2001) and cinsiyet = 1 


